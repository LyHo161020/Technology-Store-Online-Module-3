CREATE TABLE `products` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `type` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
                            `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
                            `url_image` varchar(16000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
                            `amount` int NOT NULL,
                            `price` int NOT NULL,
                            `deleted` tinyint DEFAULT '0',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;