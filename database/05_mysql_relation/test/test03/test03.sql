# 1. 부동산 매물 테이블 만들기 

CREATE TABLE `real_estate` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `realtorId` int NOT NULL,
    `address` varchar(64) NOT NULL,
    `area` int NOT NULL,
    `type` char(2) NOT NULL,
    `price` int NOT NULL,
    `rentPrice` int,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `realtor` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `office` varchar(16) NOT NULL,
    `phoneNumber` varchar(16) NOT NULL,
    `address` varchar(64) NOT NULL,
    `grade` varchar(8) NOT NULL,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. 정보 입력

INSERT INTO `realtor` (
    `office`, `phoneNumber`, `address`, `grade`, `createdAt`, `updatedAt`)
VALUES ('황금 부동산', '02-300-2000', '서울시 서초구', '안심중개사', now(), now()),
('대박 공인중개사', '02-000-7777', '서울시 동작구', '일반중개사', now(), now());

SELECT * FROM `realtor`;

INSERT INTO `real_estate` (
    `realtorId`, `address`,  `area`, `type`, `price`, `rentPrice`, `createdAt`, `updatedAt`)
VALUES (1, '레이얀 레이크 아파트 301동 905호', 84, '전세', 40000, NULL, now(), now()), 
(2, '레알편한세상 시티 505동 101호', 110, '매매', 120000, NULL, now(), now()), 
(1, '롱데캐슬 101동 402호', 87, '월세', 20000, 200, now(), now()), 
(1, '슼뷰 오피스텔 1210호', 55, '월세', 10000, 100, now(), now()), 
(2, '푸르지용 리버 203동 804호', 123, '매매', 170000, NULL, now(), now());

# 3. 매물 찾기 

SELECT * FROM `realtor` WHERE 'office' = '황금 부동산';

SELECT '황금 부동산', '02-300-2000', `address`, `price`, `rentPrice` FROM `real_estate` WHERE `realtorId` = 1;

# 4. 옵션리스트

CREATE TABLE `option` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `realEstateId` int NOT NULL, 
    `option` varchar(8),
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;