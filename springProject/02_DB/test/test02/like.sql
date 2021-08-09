CREATE TABLE `like` (
   `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `userId`	int NOT NULL,
   `postId` int NOT NULL,
   `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `like` ADD INDEX like_idx_1 (postId);