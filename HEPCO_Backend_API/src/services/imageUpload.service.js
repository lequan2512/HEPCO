const fs = require('node:fs/promises');
const path = require('node:path');
const { randomUUID } = require('node:crypto');
const cloudinary = require('cloudinary').v2;
const { LOCAL_MEDIA_DIRECTORY, IMAGE_FOLDER, IMAGE_MAX_BYTES } = require('../constants/upload');
const { prisma } = require('../db');
const AppError = require('../utils/AppError');

const localEnabled = () => process.env.UPLOAD_STORAGE === 'local' && !process.env.VERCEL && process.env.NODE_ENV !== 'production';

const MIME_TYPES = {
  png: 'image/png',
  jpg: 'image/jpeg',
  gif: 'image/gif',
  webp: 'image/webp',
  pdf: 'application/pdf'
};

const fileExtension = (buffer) => {
  if (buffer.subarray(0, 8).equals(Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]))) return 'png';
  if (buffer[0] === 255 && buffer[1] === 216 && buffer[2] === 255) return 'jpg';
  if (['GIF87a', 'GIF89a'].includes(buffer.subarray(0, 6).toString())) return 'gif';
  if (buffer.subarray(0, 4).toString() === 'RIFF' && buffer.subarray(8, 12).toString() === 'WEBP') return 'webp';
  if (buffer.subarray(0, 5).toString() === '%PDF-' || buffer.subarray(0, 4).toString() === '%PDF') return 'pdf';
  throw new AppError('INVALID_IMAGE_UPLOAD', 400, 'Unsupported file format (supported: PNG, JPG, GIF, WebP, PDF)');
};

const hasCloudConfig = () => [
  process.env.CLOUDINARY_CLOUD_NAME,
  process.env.CLOUDINARY_API_KEY,
  process.env.CLOUDINARY_API_SECRET
].every(Boolean);

const configureCloud = () => {
  if (hasCloudConfig()) {
    cloudinary.config({
      cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
      api_key: process.env.CLOUDINARY_API_KEY,
      api_secret: process.env.CLOUDINARY_API_SECRET
    });
  }
};

if (hasCloudConfig()) {
  configureCloud();
}

exports.uploadImage = async (file) => {
  if (!file?.buffer) throw new AppError('NO_FILE_UPLOADED', 400, 'An image or document file is required');
  const extension = fileExtension(file.buffer);
  if (extension !== 'pdf' && file.buffer.length > IMAGE_MAX_BYTES) {
    throw new AppError('INVALID_IMAGE_UPLOAD', 400, 'Image size must not exceed 10 MB');
  }
  const subFolder = extension === 'pdf' ? 'files' : 'images';
  const filename = `${randomUUID()}.${extension}`;

  // 1. If Cloudinary credentials are fully configured, upload to Cloudinary
  if (hasCloudConfig()) {
    try {
      configureCloud();
      return await new Promise((resolve, reject) => {
        const resourceType = extension === 'pdf' ? 'auto' : 'image';
        const stream = cloudinary.uploader.upload_stream({ folder: IMAGE_FOLDER, resource_type: resourceType }, (error, result) => {
          if (error) reject(error);
          else if (!result?.secure_url) reject(new AppError('UPLOAD_FAILED', 502, 'File storage did not confirm a permanent URL'));
          else resolve(result.secure_url);
        });
        stream.end(file.buffer);
      });
    } catch (cloudErr) {
      console.warn('Cloudinary upload failed, falling back to database storage:', cloudErr.message);
    }
  }

  // 2. Store in permanent MySQL media_files table
  try {
    const mimeType = MIME_TYPES[extension] || file.mimetype || 'application/octet-stream';
    await prisma.$executeRawUnsafe(
      'INSERT INTO media_files (filename, mime_type, data, size) VALUES (?, ?, ?, ?)',
      filename,
      mimeType,
      file.buffer,
      file.buffer.length
    );
    return `/api/media/${subFolder}/${filename}`;
  } catch (dbErr) {
    console.error('Database media storage error:', dbErr.message);

    // 3. Fallback to local directory if configured
    if (localEnabled()) {
      const folder = path.join(LOCAL_MEDIA_DIRECTORY, subFolder);
      await fs.mkdir(folder, { recursive: true });
      await fs.writeFile(path.join(folder, filename), file.buffer, { flag: 'wx' });
      return `/api/media/${subFolder}/${filename}`;
    }
    throw new AppError('UPLOAD_FAILED', 500, 'Không thể lưu tệp vào cơ sở dữ liệu');
  }
};

exports.deleteImage = async (url) => {
  if (!url || typeof url !== 'string') return;

  // Check database media URL
  const mediaMatch = url.match(/\/api\/media\/(?:images|files)\/([a-zA-Z0-9._-]+)/);
  if (mediaMatch) {
    const filename = mediaMatch[1];
    try {
      await prisma.$executeRawUnsafe('DELETE FROM media_files WHERE filename = ?', filename);
    } catch (e) {
      console.warn('Could not delete media file from db:', e.message);
    }
    if (localEnabled()) {
      try {
        const subFolder = filename.endsWith('.pdf') ? 'files' : 'images';
        await fs.unlink(path.join(LOCAL_MEDIA_DIRECTORY, subFolder, filename));
      } catch (error) {
        if (error.code !== 'ENOENT') throw error;
      }
    }
    return;
  }

  // Cloudinary delete
  if (hasCloudConfig()) {
    try {
      configureCloud();
      let parsed;
      try { parsed = new URL(url); } catch { return; }
      const prefix = `/${process.env.CLOUDINARY_CLOUD_NAME}/image/upload/`;
      if (parsed.protocol !== 'https:' || parsed.hostname !== 'res.cloudinary.com' || !parsed.pathname.startsWith(prefix)) return;
      const relative = parsed.pathname.slice(prefix.length).replace(/^v\d+\//, '');
      if (!/^hepco_news\/[A-Za-z0-9_-]+\.[A-Za-z0-9]+$/.test(relative)) return;
      await cloudinary.uploader.destroy(relative.replace(/\.[^.]+$/, ''));
    } catch (e) {
      console.warn('Cloudinary delete error:', e.message);
    }
  }
};
