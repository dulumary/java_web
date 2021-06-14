# 1. 테이블 생성

CREATE TABLE `company` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `name` varchar(32) NOT NULL,
    `business` varchar(16) NOT NULL,
    `scale` varchar(8) NOT NULL,
    `headcount`int NOT NULL,
    `createdAt`timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `recruit`(
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `companyId`int NOT NULL, 
    `position`varchar(64) NOT NULL,
    `responsibilities` varchar(128) NOT NULL, 
    `qualification` text NOT NULL,
    `type`varchar(8) NOT NULL, 
    `region` varchar(16) NOT NULL,
    `salary` int NOT NULL,
    `deadline` timestamp,
    `createdAt`timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 2. 데이터 저장

INSERT INTO `company` (`name`, `business`, `scale`, `headcount`, `createdAt`, `updatedAt`)
VALUES ('Cacao', '인터넷 포털', '대기업', 2848, now(), now()),
('Rine', '모바일 무선', '대기업', 1138, now(), now()),
('NG소프트', '컨텐츠 게임', '중견기업', 4430, now(), now()),
('쿠퐁', '쇼핑몰', '중견기업', 5350, now(), now()),
('Naber', '인터넷 포털', '대기업', 4048, now(), now()),
('우와한형제들', '소프트웨어 솔루션', '중견기업', 926, now(), now());

INSERT INTO `recruit`(`companyId`, `position`, `responsibilities`, `qualification`, `type`, `region`, `salary`, `deadline`, `createdAt`, `updatedAt`) 
VALUES (1, '안드로이드 개발자', '메신저앱 개발', 'kotlin 경력 3년 이상', '정규직', '성남시 분당구', 7300, '2026-03-13', now(), now()),
(1, '안드로이드 개발자', '쇼핑 서비스 개발', 'kotlin 경력 3년 이상', '정규직', '성남시 분당구', 6300, '2026-04-04', now(), now()),
(1, '웹 back-end 개발자', '이모티콘 샵 API 서버 개발', 'spring 경력 3년 이상', '정규직', '성남시 분당구', 7000, '2026-03-28', now(), now()),
(2, '아이폰 앱 개발자', '메신져 앱 개발', 'RxSwift 개발 경력 3년 이상', '정규직', '성남시 분당구', 7600, '2026-04-01', now(), now()),
(2, '웹 back-end 개발자', 'Rine 포스팅 기능 API 개발', 'spring 개발 경력 3년 이상', '정규직', '성남시 분당구', 6600, '2026-03-29', now(), now()),
(3, '게임 개발자', '게임 개발', 'Unreal Engine 개발 5년 이상', '정규직', '성남시 분당구', 8400, '2026-04-20', now(), now()),
(3, '모바일 게임 개발자', '리뉘쥐 모바일 게임 개발', 'Unreal Engine 개발 가능자', '계약직', '성남시 분당구', 8500, '2026-04-05', now(), now()),
(4, '웹 back-end 개발자', '오픈마켓 웹 개발', 'spring 개발 가능자', '정규직', '서울시 송파구', 8100, '2026-05-02', now(), now()),
(4, '웹 front-end 개발자', '오픈마켓 웹 개발', 'react 개발 가능자', '계약직', '서울시 송파구', 9000, '2026-04-10', now(), now()),
(5, '웹 back-end 개발자', 'Naber 메일 기능 개발', 'spring 개발 경력 5년 이상', '계약직', '성남시 분당구', 9800, '2026-04-20', now(), now()),
(5, '동영상 플레이어 개발자', '네이버TV 플레이어 개발', '동영상 코덱 기술 개발가능자', '정규직', '성남시 분당구', 7800, '2026-05-01', now(), now()),
(5, '웹 front-end 개발자', 'Now 웹 개발', 'Vue.js 개발 가능자', '정규직', '성남시 분당구', 7000, '2026-04-15', now(), now()),
(6, '웹 back-end 개발자', '사내 인트라넷 개발', 'spring 개발경력 3년이상', '계약직', '서울시 송파구', 8800, '2026-04-15', now(), now()),
(6, '웹 back-end 개발자', '쇼핑 라이브 API 개발', 'spring 개발경력 3년이상', '정규직', '서울시 송파구 ', 8200, '2026-05-12', now(), now());


# 3. 연봉순 정렬 

SELECT company.name, recruit.position, recruit.qualification, recruit.type,  recruit.salary
FROM `company` JOIN `recruit`ON company.id = recruit.companyId ORDER BY recruit.salary DESC;

# 4. 복합 조건 

SELECT company.name, company.scale, recruit.position, recruit.qualification, recruit.type,  recruit.salary
FROM `company` JOIN `recruit`ON company.id = recruit.companyId 
WHERE company.scale = '대기업' AND recruit.type = '정규직' AND recruit.salary >= 7000
ORDER BY recruit.salary DESC LIMIT 3;

# 5. 기업별 공고 수 

SELECT company.name, count(*) as count, company.business, company.headcount
FROM `company` JOIN `recruit`ON company.id = recruit.companyId
WHERE recruit.deadline < '2026-05-01'
GROUP BY recruit.company ORDER BY count DESC;


# 6. 근무형태 별 평균 연봉 

SELECT recruit.type, avg(recruit.salary) as salary
FROM `company` JOIN `recruit`ON company.id = recruit.companyId
WHERE company.scale = '중견기업'
GROUP BY recruit.type ;

# 7. 기업별 평균 연봉 

SELECT company.name, avg(recruit.salary) as salary, company.scale, company.headcount
FROM `company` JOIN `recruit`ON company.id = recruit.companyId
WHERE recruit.region = '성남시 분당구'
GROUP BY company.id HAVING salary >= 7000
ORDER BY company.headcount DESC;

