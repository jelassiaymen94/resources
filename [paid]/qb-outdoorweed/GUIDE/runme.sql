  CREATE TABLE IF NOT EXISTS `plants` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) DEFAULT NULL,
    `coords` text COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `plantgender` int(11) DEFAULT NULL,
    `water` int(11) DEFAULT NULL,
    `fertilizer` int(11) DEFAULT NULL,
    `timestamp` bigint(20) DEFAULT NULL,
    `zone` text COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;