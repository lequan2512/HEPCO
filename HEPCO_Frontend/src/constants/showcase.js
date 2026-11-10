export const SHOWCASE_MAX_ITEMS = 12;
export const SHOWCASE_TITLE_LIMIT = 160;
export const SHOWCASE_TEXT_LIMIT = 500;
export const SHOWCASE_URL_LIMIT = 1000;
export const isShowcaseUrl = (value, image = false) => {
  if (typeof value !== 'string' || !value || value.length > SHOWCASE_URL_LIMIT || (value.includes('\\') || [...value].some((character) => character.charCodeAt(0) <= 32)) || value.startsWith('//')) return false;
  if (value.startsWith('/') && (!image || value.startsWith('/images/') || value.startsWith('/uploads/') || value.startsWith('/Public/Upload/') || value.startsWith('/api/media/'))) return true;
  try { return new URL(value).protocol === 'https:'; } catch { return false; }
};

export const DEFAULT_HEADQUARTERS = {
  officeLabel: 'Thông Tin Trụ Sở',
  officeName: 'HEPCO Huế',
  officeDescription: 'Công ty Cổ phần Môi trường và Công trình Đô thị Huế.',
  officeAddress: '46 Trần Phú, Phường Phước Vĩnh, TP. Huế',
};

export const DEFAULT_FOOTER = {
  "brand": "HEPCO",
  "description": "Phát huy thế mạnh và đa dạng hóa lĩnh vực hoạt động để trở thành Công ty môi trường hàng đầu khu vực miền Trung - Tây Nguyên.",
  "contactTitle": "Cổng thông tin điện tử",
  "companyName": "CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ",
  "address": "46 Trần Phú, Phường Thuận Hóa, Thành phố Huế",
  "hotline": "1900 969669",
  "email": "info@hepco.com.vn",
  "facebook": "https://www.facebook.com/hepco.com.vn",
  "copyright": "HEPCO. All rights reserved.",
  "credit": "Thiết kế & Phát triển bởi HEPCO IT"
};
