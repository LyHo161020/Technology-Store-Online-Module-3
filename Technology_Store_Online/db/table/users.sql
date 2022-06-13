CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `username` varchar(50) NOT NULL,
                        `password` varchar(50) NOT NULL,
                        `name` varchar(50) NOT NULL,
                        `phone` varchar(50) NOT NULL,
                        `email` varchar(50) NOT NULL,
                        `address` varchar(50) NOT NULL,
                        `status` varchar(50) NOT NULL,
                        `role` varchar(50) NOT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

