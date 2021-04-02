> 부동산 테이블을 통해서 아래 문제 들을 풀어 보세요. 

* 기존 테이블을 삭제하고 아래 CREATE 문을 통해서 테이블을 분석하고, 이를 통해서 테이블을 생성하세요. 

```
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

```

* 아래 INSERT 문을 통해서 데이터를 저장하세요. 

```
INSERT INTO `realtor` (
    `office`, `phoneNumber`, `address`, `grade`, `createdAt`, `updatedAt`)
VALUES ('황금부동산', '02-300-2000', '서울시 서초구', '안심중개사', now(), now()),
('대박공인중개사', '02-000-7777', '서울시 동작구', '일반중개사', now(), now()), 
('팔팔공인중개사', '02-333-8888', '서울시 강남구', '일반중개사', now(), now()), 
('굿모닝부동산', '02-999-1111', '서울시 강남구', '안심중개사', now(), now()), 
('희망공인중개사', '02-222-0909', '서울시 송파구', '일반중개사', now(), now()),
('스타공인중개사', '02-000-7777', '서울시 송파구', '프리미엄중개사', now(), now()),
('중앙부동산', '02-000-7777', '서울시 동작구', '안심중개사', now(), now()),
('햇살공인중개사', '02-000-7777', '서울시 동작구', '일반중개사', now(), now()),
('럭키공인중개사', '02-000-7777', '서울시 동작구', '일반중개사', now(), now()),
('믿음부동산', '02-000-7777', '서울시 동작구', '프리미엄중개사', now(), now());

SELECT * FROM `realtor`;

INSERT INTO `real_estate` (
    `realtorId`, `address`,  `area`, `type`, `price`, `rentPrice`, `createdAt`, `updatedAt`)
VALUES (1, '레이얀 레이크 아파트 301동 905호', 84, '전세', 40000, NULL, now(), now()), 
(2, '레알편한세상 시티 505동 101호', 110, '매매', 120000, NULL, now(), now()), 
(1, '롱데캐슬 101동 402호', 87, '월세', 20000, 200, now(), now()), 
(1, '슼뷰 오피스텔 1210호', 55, '월세', 10000, 100, now(), now()), 
(2, '푸르지용 리버 203동 804호', 123, '매매', 170000, NULL, now(), now());
```
