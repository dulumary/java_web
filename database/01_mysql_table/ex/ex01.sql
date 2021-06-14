/* ### 데이터베이스 생성하기 ### */
CREATE database `test`;

/*
    ### 테이블 생성하기 ###

    사람 정보 저장하는 테이블
    행 번호 | 이름 | 생년월일 | 취미 | 자기소개(없을 수 있음) | 작성 시간 | 수정 시간 
*/

CREATE TABLE `person` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `name` varchar(16) NOT NULL,
    `birth` int NOT NULL,
    `hobby` varchar(64) NOT NULL,
    `introduce` text,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DESC `person`;


/* ### 테이블 삭제하기 ### */
DROP TABLE `person`;

/* ### 테이블 다시 만들기 ### */
CREATE TABLE `person` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `name` varchar(16) NOT NULL,
    `birth` int NOT NULL,
    `hobby` varchar(64) NOT NULL,
    `introduce` text,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* ### 테이블 수정하기 ### */


ALTER TABLE `person` RENAME `user`;


ALTER TABLE `user` ADD COLUMN `email` varchar(16) NULL;


ALTER TABLE `user` MODIFY COLUMN `email` varchar(32) NULL;


ALTER TABLE `user` CHANGE COLUMN `birth` `yyyymmdd` varchar(16);