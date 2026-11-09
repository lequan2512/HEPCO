const fs = require('node:fs/promises');
const path = require('node:path');
const { randomUUID } = require('node:crypto');
const cloudinary = require('cloudinary').v2;
const { LOCAL_MEDIA_DIRECTORY, IMAGE_FOLDER } = require('../constants/upload');
const AppError = require('../utils/AppError');

const localEnabled = () => process.env.UPLOAD_STORAGE === 'local' && !process.env.VERCEL && process.env.NODE_ENV !== 'production';

const fileExtension = (buffer) => {
  if (buffer.subarray(0, 8).equals(Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]))) return 'png';
  if (buffer[0] === 255 && buffer[1] === 216 && buffer[2] === 255) return 'jpg';
  if (['GIF87a', 'GIF89a'].includes(buffer.subarray(0, 6).toString())) return 'gif';
  if (buffer.subarray(0, 4).toString() === 'RIFF' && buffer.subarray(8, 12).toString() === 'WEBP') return 'webp';
  if (buffer.subarray(0, 5).toString() === '%PDF-' || buffer.subarray(0, 4).toString() === '%PDF') return 'pdf';
  throw new AppError('INVALID_IMAGE_UPLOAD', 400, 'Unsupported file format (supported: PNG, JPG, GIF, WebP, PDF)');
};

const configureCloud = () => {
  if (![process.env.CLOUDINARY_CLOUD_NAME, process.env.CLOUDINARY_API_KEY, process.env.CLOUDINARY_API_SECRET].every(Boolean)) {
    throw new AppError('UPLOAD_CONFIGURATION_ERROR', 503, 'File storage is not configured');
  }
  cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET
  });
};

if ([process.env.CLOUDINARY_CLOUD_NAME, process.env.CLOUDINARY_API_KEY, process.env.CLOUDINARY_API_SECRET].every(Boolean)) {
  configureCloud();
}

exports.uploadImage = async (file) => {
  if (!file?.buffer) throw new AppError('NO_FILE_UPLOADED', 400, 'An image or document file is required');
  const extension = fileExtension(file.buffer);
  if (localEnabled()) {
    const subFolder = extension === 'pdf' ? 'files' : 'images';
    const folder = path.join(LOCAL_MEDIA_DIRECTORY, subFolder);
    await fs.mkdir(folder, { recursive: true });
    const filename = `${randomUUID()}.${extension}`;
    await fs.writeFile(path.join(folder, filename), file.buffer, { flag: 'wx' });
    return `/api/media/${subFolder}/${filename}`;
  }
  configureCloud();
  return new Promise((resolve, reject) => {
    const resourceType = extension === 'pdf' ? 'auto' : 'image';
    const stream = cloudinary.uploader.upload_stream({ folder: IMAGE_FOLDER, resource_type: resourceType }, (error, result) => {
      if (error) reject(new AppError('UPLOAD_FAILED', 502, 'File storage did not accept the upload'));
      else if (!result?.secure_url) reject(new AppError('UPLOAD_FAILED', 502, 'File storage did not confirm a permanent URL'));
      else resolve(result.secure_url);
    });
    stream.end(file.buffer);
  });
};

exports.deleteImage = async (url) => {
  if (localEnabled() && typeof url === 'string' && /^\/api\/media\/(images|files)\/[a-f0-9-]+\.(png|jpg|gif|webp|pdf)$/.test(url)) {
    try {
      const parts = url.split('/');
      const filename = parts.pop();
      const subFolder = parts.pop();
      await fs.unlink(path.join(LOCAL_MEDIA_DIRECTORY, subFolder, filename));
    } catch (error) {
      if (error.code !== 'ENOENT') throw error;
    }
    return;
  }
  configureCloud();
  let parsed;
  try { parsed = new URL(url); } catch { throw new AppError('INVALID_INPUT', 400, 'Invalid file URL'); }
  const prefix = `/${process.env.CLOUDINARY_CLOUD_NAME}/image/upload/`;
  if (parsed.protocol !== 'https:' || parsed.hostname !== 'res.cloudinary.com' || !parsed.pathname.startsWith(prefix)) return;
  const relative = parsed.pathname.slice(prefix.length).replace(/^v\d+\//, '');
  if (!/^hepco_news\/[A-Za-z0-9_-]+\.[A-Za-z0-9]+$/.test(relative)) return;
  const result = await cloudinary.uploader.destroy(relative.replace(/\.[^.]+$/, ''));
  if (!['ok', 'not found'].includes(result.result)) throw new AppError('DELETE_FAILED', 502, 'File storage did not confirm deletion');
};
