const AppError = require('../utils/AppError');
const ShowcaseModel = require('../models/showcase.model');
const { SHOWCASE_MAX_ITEMS, SHOWCASE_TEXT_LIMIT, SHOWCASE_TITLE_LIMIT, SHOWCASE_URL_LIMIT } = require('../constants/showcase');

const text = (value, max, required = true) => {
  if (typeof value !== 'string' || value.length > max || (required && !value.trim())) {
    if (!required) return '';
    throw new AppError('INVALID_INPUT', 400, 'Invalid text content');
  }
  return value.trim();
};

const safeUrl = (value, image = false) => {
  const url = text(value, SHOWCASE_URL_LIMIT, false);
  if (!url) return '';
  if (url.includes('\\') || url.startsWith('//')) throw new AppError('INVALID_INPUT', 400, 'Invalid URL format');
  if (url.startsWith('/')) return url;
  try {
    const parsed = new URL(url);
    if (['http:', 'https:', 'tel:', 'mailto:'].includes(parsed.protocol)) return url;
  } catch {
    /* accept if simple relative or protocol */
  }
  return url;
};

const validate = async (body) => {
  const { config, version } = body || {};
  if (!config || !Number.isSafeInteger(version) || version < 0) {
    throw new AppError('INVALID_INPUT', 400, 'Invalid configuration');
  }

  // 1. Showcase Items
  const items = Array.isArray(config.items) ? config.items.map((item, idx) => ({
    id: item.id || `item-${idx + 1}`,
    title: text(item.title || 'Hoạt động', SHOWCASE_TITLE_LIMIT),
    subtitle: text(item.subtitle ?? '', SHOWCASE_TEXT_LIMIT, false),
    location: text(item.location ?? '', SHOWCASE_TEXT_LIMIT, false),
    scale: text(item.scale ?? '', SHOWCASE_TEXT_LIMIT, false),
    image: safeUrl(item.image, true) || '/uploads/images/TongQuan_6a06c09d.jpg',
    href: safeUrl(item.href) || '/tin-tuc',
    linkLabel: text(item.linkLabel || 'Xem chi tiết', SHOWCASE_TITLE_LIMIT)
  })) : [];

  // 2. Sections - query database through Model only
  const dbSections = await ShowcaseModel.getHomeSections();
  const sections = Array.isArray(config.sections) ? config.sections.map((s) => ({
    id: s.id,
    label: s.label || dbSections.find(d => d.id === s.id)?.label || s.id,
    visible: s.visible !== false
  })) : dbSections.map(d => ({ id: d.id, label: d.label, visible: d.visible }));

  // 3. Hero
  const hero = config.hero ? {
    headlinePrefix: text(config.hero.headlinePrefix ?? '', 200, false),
    headlineHighlight: text(config.hero.headlineHighlight ?? '', 200, false),
    subtitle: text(config.hero.subtitle ?? '', 1000, false),
    primaryCtaText: text(config.hero.primaryCtaText ?? 'Khám Phá Dịch Vụ', 100, false),
    primaryCtaLink: safeUrl(config.hero.primaryCtaLink) || '/dich-vu',
    hotlineDisplay: text(config.hero.hotlineDisplay ?? '1900.96.96.69', 50, false),
    hotlineTel: text(config.hero.hotlineTel ?? '1900969669', 50, false),
    coverImage: safeUrl(config.hero.coverImage, true) || '/uploads/images/TongQuan_6a06c09d.jpg',
    videoUrl: safeUrl(config.hero.videoUrl) || '',
    videoButtonText: text(config.hero.videoButtonText ?? 'Xem Phim Giới Thiệu', 100, false)
  } : undefined;

  // 4. Stats
  const stats = Array.isArray(config.stats) ? config.stats.map(s => ({
    value: text(s.value ?? '', 50, false),
    label: text(s.label ?? '', 100, false),
    description: text(s.description ?? '', 255, false)
  })) : undefined;

  // 5. Utilities
  const utilities = Array.isArray(config.utilities) ? config.utilities.map((u, i) => ({
    id: u.id || `util-${i + 1}`,
    title: text(u.title ?? '', 100, false),
    subtitle: text(u.subtitle ?? '', 255, false),
    buttonText: text(u.buttonText ?? '', 100, false),
    link: safeUrl(u.link) || safeUrl(u.href) || safeUrl(u.internalPath) || '/tin-tuc',
    badge: text(u.badge ?? '', 50, false)
  })) : undefined;

  // 6. Sectors
  const sectors = config.sectors ? {
    title: text(config.sectors.title ?? '', 200, false),
    subtitle: text(config.sectors.subtitle ?? '', 500, false),
    items: Array.isArray(config.sectors.items) ? config.sectors.items.map(it => ({
      title: text(it.title ?? '', 150, false),
      subtitle: text(it.subtitle ?? '', 200, false),
      description: text(it.description ?? '', 500, false),
      tag: text(it.tag ?? '', 50, false)
    })) : []
  } : undefined;

  // 7. Why choose HEPCO
  const why = config.why ? {
    title: text(config.why.title ?? '', 200, false),
    subtitle: text(config.why.subtitle ?? '', 500, false),
    items: Array.isArray(config.why.items) ? config.why.items.map(it => ({
      title: text(it.title ?? '', 150, false),
      description: text(it.description ?? '', 500, false),
      badge: text(it.badge ?? '', 100, false)
    })) : []
  } : undefined;

  // 8. Testimonials
  const testimonials = config.testimonials ? {
    title: text(config.testimonials.title ?? '', 200, false),
    subtitle: text(config.testimonials.subtitle ?? '', 500, false),
    items: Array.isArray(config.testimonials.items) ? config.testimonials.items.map(it => ({
      content: text(it.content ?? '', 1000, false),
      author: text(it.author ?? '', 150, false),
      role: text(it.role ?? '', 150, false),
      rating: Number(it.rating) || 5
    })) : []
  } : undefined;

  // 9. CTA
  const cta = config.cta ? {
    title: text(config.cta.title ?? '', 200, false),
    subtitle: text(config.cta.subtitle ?? '', 500, false),
    buttonText: text(config.cta.buttonText ?? '', 100, false),
    hotlineDisplay: text(config.cta.hotlineDisplay ?? '', 50, false),
    hotlineTel: text(config.cta.hotlineTel ?? '', 50, false)
  } : undefined;

  // 10. FAQ
  const faq = config.faq ? {
    title: text(config.faq.title ?? '', 200, false),
    subtitle: text(config.faq.subtitle ?? '', 500, false),
    items: Array.isArray(config.faq.items) ? config.faq.items.map(it => ({
      question: text(it.question ?? '', 300, false),
      answer: text(it.answer ?? '', 2000, false)
    })) : []
  } : undefined;

  const sanitized = {
    title: text(config.title || 'Hoạt Động & Dự Án Trọng Điểm', SHOWCASE_TITLE_LIMIT),
    description: text(config.description ?? '', SHOWCASE_TEXT_LIMIT, false),
    linkLabel: text(config.linkLabel || 'Thư Viện Hình Ảnh & Hoạt Động', SHOWCASE_TITLE_LIMIT),
    href: safeUrl(config.href) || '/tin-tuc?tab=gallery',
    items,
    sections,
    ...(hero && { hero }),
    ...(stats && { stats }),
    ...(utilities && { utilities }),
    ...(sectors && { sectors }),
    ...(why && { why }),
    ...(testimonials && { testimonials }),
    ...(cta && { cta }),
    ...(faq && { faq })
  };

  return { config: sanitized, version };
};

exports.get = async (req, res, next) => {
  try {
    res.set('Cache-Control', 'no-store');
    res.json({ success: true, ...await ShowcaseModel.get() });
  } catch (error) {
    next(error);
  }
};

exports.save = async (req, res, next) => {
  try {
    const { config, version } = await validate(req.body);
    res.json({ success: true, ...await ShowcaseModel.save(config, version) });
  } catch (error) {
    next(['P2002', 'P2025'].includes(error.code) ? new AppError('SHOWCASE_CONFLICT', 409, 'This section was updated elsewhere. Reload before saving again.') : error);
  }
};
