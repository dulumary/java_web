# 1. 테이블 생성

CREATE TABLE `score` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `name` varchar(8) NOT NULL,
    `year` int NOT NULL,
    `term` char(4) NOT NULL,
    `title` varchar(4) NOT NULL,
    `score` int NOT NULL,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET= utf8mb4;


# 2. 컬럼 추가 

ALTER TABLE `score` ADD COLUMN `semester` tinyint NOT NULL AFTER `year`;

# 3. 컬럼 이름 수정

ALTER TABLE `score` CHANGE COLUMN `title` `subject` varchar(4) NOT NULL;

# 4. 컬럼 타입 수정

ALTER TABLE `score` MODIFY COLUMN `name` varchar(32) NOT NULL;

ALTER TABLE `score` MODIFY COLUMN `subject` varchar(16) NOT NULL;