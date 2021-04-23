# 1. 성적 테이블 나누기

CREATE TABLE `new_score` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `studentId` int NOT NULL,
    `year` int NOT NULL,
    `semester` tinyint NOT NULL,
    `term` char(4) NOT NULL,
    `subject` varchar(4) NOT NULL,
    `score` int NOT NULL,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET= utf8mb4;

CREATE TABLE `new_student` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `name` varchar(32) NOT NULL,
    `phoneNumber` varchar(12) NOT NULL,
    `email` varchar(64) NOT NULL,
    `dreamJob` varchar(16) NOT NULL, 
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. Insert 

insert into `new_student`
(`name`, `phoneNumber`, `email`, `dreamJob`, `createdAt`, `updatedAt`)
values
('유재석', '01000001111', 'mc_u@naver.com', '래퍼', now(), now()),
('조세호', '01011110000', 'josep@gmail.com', '변호사', now(), now());

SELECT * from `new_student`;

INSERT INTO `new_score` (
    `studentID`, `year`, `semester`, `term`, `subject`, `score`, `createdAt`, `updatedAt`
)
VALUES (1, 2020, 1, '중간고사', '국어', 80, now(), now()),
(1, 2020, 1, '중간고사', '영어', 95, now(), now()),
(1, 2020, 1, '중간고사', '수학', 90, now(), now()),
(2, 2020, 1, '중간고사', '국어', 85, now(), now()),
(2, 2020, 1, '중간고사', '영어', 90, now(), now()),
(2, 2020, 1, '중간고사', '수학', 70, now(), now());

# 3. 성적 출력

SELECT `id`, `name` FROM `new_student` WHERE `name` = '조세호';

SELECT `year`, `semester`, `term`, `subject`, `score` FROM `new_score` WHERE `studentId` = 2;

