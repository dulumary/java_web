CREATE TABLE `post` (
   `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `userId` int NOT NULL,
   `subject` varchar(255) NOT NULL,
   `content` text NOT NULL,
   `imagePath` varchar(255),
   `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;