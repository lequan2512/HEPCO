CREATE INDEX `news_type_created_at_idx` ON `news` (`type`, `created_at`);
CREATE INDEX `gallery_created_at_id_idx` ON `gallery` (`created_at`, `id`);
CREATE INDEX `gallery_category_created_at_id_idx` ON `gallery` (`category`, `created_at`, `id`);

CREATE TABLE IF NOT EXISTS `media_files` (
  `filename` VARCHAR(191) NOT NULL,
  `mime_type` VARCHAR(191) NOT NULL,
  `data` LONGBLOB NOT NULL,
  `size` INTEGER NOT NULL,
  PRIMARY KEY (`filename`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
