export const IMAGE_MAX_BYTES = 10 * 1024 * 1024;
const REQUEST_IMAGE_MAX_BYTES = 4 * 1024 * 1024;
const RESIZABLE_TYPES = ['image/jpeg', 'image/png', 'image/webp'];

export async function prepareImageUpload(file) {
  if (file.size > IMAGE_MAX_BYTES) throw new Error('Ảnh không được vượt quá 10 MB.');
  if (file.size <= REQUEST_IMAGE_MAX_BYTES) return file;
  if (!RESIZABLE_TYPES.includes(file.type)) {
    throw new Error('Ảnh trên 4 MB cần ở định dạng JPG, PNG hoặc WebP để giảm dung lượng.');
  }

  const bitmap = await createImageBitmap(file);
  try {
    const canvas = document.createElement('canvas');
    const context = canvas.getContext('2d');
    let scale = Math.min(1, 2560 / Math.max(bitmap.width, bitmap.height));
    for (const quality of [0.88, 0.8, 0.72]) {
      canvas.width = Math.max(1, Math.round(bitmap.width * scale));
      canvas.height = Math.max(1, Math.round(bitmap.height * scale));
      context.drawImage(bitmap, 0, 0, canvas.width, canvas.height);
      const blob = await new Promise((resolve) => canvas.toBlob(resolve, 'image/webp', quality));
      if (blob?.type === 'image/webp' && blob.size <= REQUEST_IMAGE_MAX_BYTES) {
        return new File([blob], file.name.replace(/\.[^.]+$/, '') + '.webp', { type: blob.type });
      }
      scale *= 0.75;
    }
    throw new Error('Không thể giảm dung lượng ảnh. Vui lòng chọn ảnh nhỏ hơn.');
  } finally {
    bitmap.close();
  }
}
