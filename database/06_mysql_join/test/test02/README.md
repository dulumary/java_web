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
('굿모닝부동산', '02-999-1111', '서울시 강남구', '안심중개사', now(), now()), 
('희망공인중개사', '02-222-0909', '서울시 송파구', '일반중개사', now(), now()),
('럭키공인중개사', '02-777-7777', '서울시 동작구', '일반중개사', now(), now()),
('믿음부동산', '02-333-9999', '서울시 동작구', '프리미엄중개사', now(), now());

SELECT * FROM `realtor`;

INSERT INTO `real_estate` (
    `realtorId`, `address`,  `area`, `type`, `price`, `rentPrice`, `createdAt`, `updatedAt`)
VALUES (1, '레이얀 레이크 아파트 301동 905호', 84, '전세', 40000, NULL, now(), now()),
(5, '레알편한세상 시티 505동 101호', 110, '매매', 120000, NULL, now(), now()), 
(1, '롱데캐슬 101동 402호', 87, '월세', 20000, 200, now(), now()), 
(5, '슼뷰 오피스텔 1210호', 55, '월세', 10000, 100, now(), now()), 
(2, '푸르지용 파크 701동 2104호', 97, '매매', 90000, NULL, now(), now()),
(1, '굿타워 오피스텔 804호', 65, '전세', 20000, NULL, now(), now()), 
(4, '미래 홈타운 103동 104호', 88, '전세', 65000, NULL, now(), now()),
(2, '강남 헤리티지 시티 902동 606호', 90, '매매', 130000, NULL, now(), now()), 
(4, '푸르지용 리버 203동 804호', 123, '매매', 170000, NULL, now(), now()),
(1, '롱데캐슬 503동 802호', 107, '월세', 90000, 150, now(), now()), 
(2, '레알편한세상 시티 105동 806호', 110, '매매', 150000, NULL, now(), now()),
(6, '루체스타 오피스텔 1105호', 53, '월세', 10000, 50, now(), now()), 
(2, '와이파크 시티 205동 1603호', 113, '매매', 120000, NULL, now(), now()), 
(4, '썅떼빌리버 오피스텔 2214호', 45, '월세', 20000, 80, now(), now()), 
(6, '쉐리빌 아파트 603동 1904호', 75, '전세', 50000, NULL, now(), now()),
(1, '그랑시아 103동 306호', 145, '전세', 230000, NULL, now(), now()),
(4, '그랑샤 굿윌 베스트 뷰 파크 502동 1402호', 88, '월세', 40000, 150, now(), now()), 
(5, '풍님 하버 파크빌 402동 702호', 87, '월세', 70000, 100, now(), now()), 
(6, '샤이 리버뷰 파크 803동 1704호', 145, '매매', 230000, NULL, now(), now()),
(1, '휴먼시아 드림빌 208동 604호', 111, '전세', 60000, NULL, now(), now());
```

### 1. 매물 정보 확인 

* 매매 10억 이하 매물을 면적 내림 차순으로 출력하세요. 
* 출력 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 주소, 면적, 금액 입니다. 


### 2. 안심 중개사 

* 안심 중개사가 등록한 월세 매물을 월세 금액 오름차순으로 출력하세요.
* 출력 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 주소, 보증금액, 월세금액, 면적 입니다. 

### 3. 매물 확인

* 서울시 서초구에 있는 공인중개사 사무실 매물 중 전세 7억 이하 매물을 보증금액 오름차순으로 5개 출력하세요. 
*  출력 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 주소, 보증금액, 면적 입니다. 

### 4. 공인중개상 매물 개수

* 공인중개사 별로 매물 개수를 내림차순으로 출력하세요. 
* 출력 컬럼은 공인중개사 사무실명, 매물 개수 입니다. 

### 5. 매물 확인

* 황금부동산 매물중 매매, 전세 중 100평방미터 이상의 매물을 금액 오름차순으로 출력하세요.
* 출력 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 주소, 금액, 면적 입니다. 





