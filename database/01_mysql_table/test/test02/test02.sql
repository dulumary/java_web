# 1. 테이블 생성

CREATE TABLE `review` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `store` varchar(8) NOT NULL,
    `menu` varchar(8) NOT NULL,
    `point` decimal(2,1) DEFAULT 3.5,
    `review` varchar(256),
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

# 2. 컬럼 추가 

ALTER TABLE `review` ADD COLUMN `userName` varchar(32) NOT NULL AFTER `menu`;

# 3. 컬럽 타입 변경

ALTER TABLE `review` MODIFY COLUMN `store` varchar(32) NOT NULL;
ALTER TABLE `review` MODIFY COLUMN `menu` varchar(32) NOT NULL;