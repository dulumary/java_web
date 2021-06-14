# 1. 테이블 생성

CREATE TABLE `favorite` (
    `id` int NOT NULL AUTO_INCREMENT primary key, 
    `name` varchar(16) NOT NULL,
    `url` varchar(512) NOT NULL,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 2. 데이터 저장

INSERT INTO `favorite` (`name`, `url`, `createdAt`, `updatedAt`) 
VALUES 
('마론달', 'http://marondal.com', now(), now()),
('구글', 'https://google.com', now(), now()),
('네이버', 'https://naver.com', now(), now()),
('다음', 'https://daum.net', now(), now());