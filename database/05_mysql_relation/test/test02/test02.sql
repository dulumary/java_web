# 1. 리뷰 테이블 나누기 

CREATE TABLE `new_review` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `storeId` int NOT NULL,
    `menu` varchar(32) NOT NULL,
    `userName` varchar(32) NOT NULL,
    `point` decimal(2,1) DEFAULT 3.5,
    `review` varchar(256),
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `store` (
    `id` int NOT NULL AUTO_INCREMENT primary key, 
    `name` varchar(32) NOT NULL,
    `phoneNumber` varchar(16) NOT NULL,
    `address` varchar(64) NOT NULL, 
    `businessNumber` varchar(32) NOT NULL,
    `introduce` text, 
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. Insert 

INSERT INTO `store` (
    `name`, `phoneNumber`, `address`, `businessNumber`, `introduce`, `createdAt`, `updatedAt`
)
VALUES ("교촌치킨", '02-000-0000', '서울시 서초구', '111-111-1111', '항상 맛있는 닭을 선사 합니다.', now(), now()),
("BHC", '02-111-0000', '서울시 서초구', '111-222-1111', '전지현씨 BHC', now(), now()),
("버거킹", '02-222-1111', '서울시 서초구', '333-222-12222', '맥도날드 가지말고 여기로와요', now(), now());

SELECT * FROM `store`;

INSERT INTO `new_review` (
    `storeId`, `menu`, `userName`, `point`, `review`, `createdAt`, `updatedAt`
) VALUES (1, '오리지날 콤보', '이병헌', 4.5, '콤보는 항상 진리입니다.', now(), now()),
(2, '핫후라이드', '전지현', 5, NULL, now(), now()),
(2, '뿌링클', '이정재', 3.5, '내가 뿌링클 상인가?', now(), now()),
(3, '와퍼세트', '이병헌', 4.0, '패티 너무좋아요', now(), now()),
(1, '오리지날 콤보', '맛있으면짖는개', 4.5, '왈왈왈!! 왈왈!', now(), now()),
(2, '뿌링클', '전지현', 5, NULL, now(), now());

# 3. 리뷰 출력

SELECT `id`, `name` FROM `store` WHERE `name` = '교촌치킨';

SELECT `point`, `review`, `userName` FROM `new_review` WHERE `storeId` = 1;