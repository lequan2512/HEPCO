module.exports = {
  NEWS_TYPES: ['news', 'announcement', 'shareholders', 'service', 'about'],
  NEWS_METADATA_FIELDS: [
    'summary',
    'category',
    'documentType',
    'publishYear',
    'attachments',
    'relatedIds',
    'slug',
    'status',
    'featured',
    'docCode',
    'issuedDate',
    'images'
  ],
  NEWS_MAX_PAGE_SIZE: 100,
  NEWS_SORTS: {
    title_asc: { title: 'asc' },
    title_desc: { title: 'desc' },
    created_at_asc: { created_at: 'asc' },
    created_at_desc: { created_at: 'desc' }
  },
};
