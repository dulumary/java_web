CREATE TABLE `post` (
   `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `userId` int NOT NULL,
   `userName` varchar(20) NOT NULL,
   `content` text NOT NULL,
   `imagePath` json,
   `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;