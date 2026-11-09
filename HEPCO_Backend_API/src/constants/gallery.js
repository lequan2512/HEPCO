const GALLERY_CATEGORY = {
  ALL: 'all',
  COMPANY: 'company',
  ENVIRONMENT: 'environment',
  EQUIPMENT: 'equipment',
  COMMUNITY: 'community'
};

const GALLERY_CATEGORY_LABELS = {
  [GALLERY_CATEGORY.COMPANY]: 'Hoạt động công ty',
  [GALLERY_CATEGORY.ENVIRONMENT]: 'Vệ sinh môi trường',
  [GALLERY_CATEGORY.EQUIPMENT]: 'Phương tiện & Thiết bị',
  [GALLERY_CATEGORY.COMMUNITY]: 'Cộng đồng & Đô thị'
};

const GALLERY_LIMITS = {
  DEFAULT_PAGE: 1,
  DEFAULT_LIMIT: 16,
  MAX_LIMIT: 100
};

module.exports = {
  GALLERY_CATEGORY,
  GALLERY_CATEGORY_LABELS,
  GALLERY_LIMITS
};
