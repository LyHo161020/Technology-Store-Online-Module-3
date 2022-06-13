CREATE TABLE `orderitem` (
                             `orderItemId` int NOT NULL AUTO_INCREMENT,
                             `userId` int NOT NULL,
                             `productId` int NOT NULL,
                             `quantity` int NOT NULL,
                             `orderId` int DEFAULT NULL,
                             `total` bigint NOT NULL,
                             `date` date DEFAULT NULL,
                             PRIMARY KEY (`orderItemId`),
                             KEY `userId` (`userId`),
                             KEY `productId` (`productId`),
                             CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
                             CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;