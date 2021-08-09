CREATE TABLE `comment` (
   `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `postId` int NOT NULL,
   `userId` int NOT NULL,
   `userName` varchar(20) NOT NULL,
   `content` varchar(255) NOT NULL,
   `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;