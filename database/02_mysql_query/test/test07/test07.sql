# 1. 테이블 생성

CREATE TABLE `booking` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `name` varchar(32) NOT NULL,
    `headcount` int NOT NULL,
    `day`int NOT NULL,
    `date` timestamp NOT NULL,
    `phoneNumber`varchar(16),
    `state`varchar(4),
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. 데이터 저장

INSERT INTO `booking` (`name`, `headcount`, `day`, `date`, `phoneNumber`, `state`, `createdAt`, `updatedAt`)
VALUES ('강하늘', 2, 1, '2025-07-21', '010-1234-1111', '대기중', now(), now()), 
('김종국', 4, 1, '2025-08-04', '010-1212-2121', '확정', now(), now()), 
('박명수', 2, 4, '2025-06-12', '010-0000-0000', '취소', now(), now()), 
('마동석', 2, 1, '2025-10-30 ', '010-1010-0101', '대기중', now(), now()), 
('박나래', 10, 3, '2025-06-23', '010-1111-2222', '확정', now(), now()), 
('혜리', 2, 2, '2025-04-12', '010-9999-9999', '확정', now(), now()), 
('황찬성', 25, 1, '2025-09-11', '010-0000-2222', '확정', now(), now()), 
('탁재훈', 4, 3, '2025-07-12', '010-1111-0000', '대기중', now(), now()), 
('장나라', 2, 1, '2025-09-12', '010-2222-0000', '확정', now(), now());


# 3. 날짜 조건 

SELECT `name`, `day`, `date`FROM `booking`WHERE date > '2025-08-01 00:00:00';

# 4. 복합 조건 

SELECT `name`, `headcount`, `day`, `state` FROM `booking` 
WHERE `state`= '확정' AND (`headcount` >= 4 OR `day` >= 2);

# 5. 카운트 

SELECT count(*) FROM `booking` WHERE `day` = 1 AND `state`= '대기중';

# 6. 예약 상태 변경

UPDATE `booking` SET `state`= '취소' WHERE `name` = '마동석' OR `name`= '탁재훈';

# 7. 취소 삭제

SELECT * FROM `booking` WHERE `state` = '취소';
DELETE FROM `booking`WHERE `state`= '취소';