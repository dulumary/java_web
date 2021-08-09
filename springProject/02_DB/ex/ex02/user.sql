CREATE TABLE `user` (
   `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `loginId` varchar(15) NOT NULL,
   `password` varchar(128) NOT NULL,
   `name` varchar(20) NOT NULL,
   `email` varchar(128) NOT NULL,
   `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;