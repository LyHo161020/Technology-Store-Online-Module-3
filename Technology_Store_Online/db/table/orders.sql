CREATE TABLE `order` (
                         `orderId` int NOT NULL AUTO_INCREMENT,
                         `userId` int NOT NULL,
                         PRIMARY KEY (`orderId`),
                         KEY `userId` (`userId`),
                         CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;