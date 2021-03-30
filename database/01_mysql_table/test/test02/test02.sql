# 1. 테이블 생성

CREATE TABLE `review` (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	`store` varchar(8) NOT NULL,
	`menu` varchar(8) NOT NULL,
	`point` float DEFAULT 3.5,
	`review` varchar(256), 
	`createAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updateAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. 컬럼 추가 

ALTER TABLE `review` ADD COLUMN `userName` varchar(32) NOT NULL;

# 3. 컬럽 타입 변경

ALTER TABLE `review` MODIFY COLUMN `store` varchar(32) NOT NULL;
ALTER TABLE `review` MODIFY COLUMN `menu` varchar(32) NOT NULL;