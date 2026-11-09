CREATE TABLE IF NOT EXISTS `gallery` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(191) NOT NULL,
  `original_url` VARCHAR(191) NULL,
  `title` VARCHAR(191) NULL,
  `caption` VARCHAR(191) NULL,
  `category` VARCHAR(191) NULL DEFAULT 'company',
  `category_label` VARCHAR(191) NULL,
  `date` VARCHAR(191) NULL,
  `article_id` INTEGER NULL,
  `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
