# 1. 테이블 생성

CREATE TABLE `score` (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	`name` varchar(8) NOT NULL,
	`year` int NOT NULL,
	`type` varchar(5) NOT NULL,
	`subject` varchar(4) NOT NULL,
	`score` int NOT NULL,
	`createAt` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updateAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 2. 컬럼 추가 

ALTER TABLE `score` ADD COLUMN `semester` tinyint NOT NULL;


# 3. 컬럼 타입 수정

ALTER TABLE `score` MODIFY COLUMN `name` varchar(32) NOT NULL;

ALTER TABLE `score` MODIFY COLUMN `subject` varchar(16) NOT NULL;
