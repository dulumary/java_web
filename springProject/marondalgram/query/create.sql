CREATE TABLE `user` (
	`id` int NOT NULL AUTO_INCREMENT primary key, 
    `loginId` varchar(16) NOT NULL, 
    `password` varchar(32) NOT NULL, 
    `name` varchar(16) NOT NULL, 
    `email` varchar(32), 
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `post` (
	`id` int NOT NULL AUTO_INCREMENT primary key, 
    `userId` int NOT NULL,
    `userName` varchar(16) NOT NULL,
    `content` text NOT NULL,
    `imagepath` varchar(255),
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `comment` (
	`id` int NOT NULL AUTO_INCREMENT primary key, 
    `postId` int NOT NULL,
    `userId` int NOT NULL, 
    `userName` varchar(16),
    `content` varchar(255),
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `like` (
	`id` int NOT NULL AUTO_INCREMENT primary key, 
    `userId` int NOT NULL,
    `postId` int NOT NULL,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



