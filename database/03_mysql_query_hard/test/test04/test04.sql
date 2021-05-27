# 1. 테이블 생성

CREATE TABLE `weatherhistory` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `date` timestamp NOT NULL, 
    `weather`varchar(8) NOT NULL,
    `temperatures` decimal(3, 1) NOT NULL, 
    `precipitation`decimal(4, 1) NOT NULL, 
    `microDust`varchar(3) NOT NULL, 
    `windSpeed`decimal(4, 1) NOT NULL,
    `createdAt`timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. 데이터 입력

INSERT INTO `weatherhistory` (`date`, `weather`, `temperatures`, `precipitation`, `microDust`, `windSpeed`, `createdAt`, `updatedAt`)
VALUES ('2015-07-01', '비', 21.9, 83.5, '보통', 2.9, now(), now()),
('2015-07-02', '비', 22.6, 59.5, '보통', 2.5, now(), now()), 
('2015-07-03', '흐림', 27.4, 0.0, '좋음', 2.9, now(), now()), 
('2015-07-04', '맑음', 27.3, 0.0, '좋음', 6.1, now(), now()), 
('2015-07-05', '구름조금', 25.3, 0.0, '나쁨', 4.3, now(), now()),
('2015-07-06', '맑음', 23.9, 0.0, '나쁨', 6.5, now(), now()),
('2015-07-07', '맑음', 23.7, 0.0, '좋음', 5.8, now(), now()), 
('2015-07-08', '흐림', 23.3, 0.0, '좋음', 5.4, now(), now()), 
('2015-07-09', '비', 20.8, 14.0, '보통', 4.0, now(), now()), 
('2015-07-10', '비', 23.7, 16.5, '보통', 2.5, now(), now()), 
('2015-07-11', '비', 26.8, 3.0, '좋음', 4.7, now(), now()), 
('2015-07-12', '비', 26.6, 1.0, '나쁨', 5.4, now(), now()), 
('2015-07-13', '구름조금', 27.3, 0.0, '최악', 6.5, now(), now()), 
('2015-07-14', '맑음', 27.9, 0.0, '보통', 6.8, now(), now());

# 3. 가장 높은 기온

SELECT `date`, `weather`, `temperatures` FROM `weatherhistory`
ORDER BY `temperatures`DESC LIMIT 1;

### 4. 날씨 카운트 

SELECT `weather`, count(*) as count FROM `weatherhistory`
GROUP BY `weather` ORDER BY count DESC;


# 5. 미세먼지와 강수량 

SELECT `microDust`, AVG(precipitation) as precipitation FROM `weatherhistory`
GROUP BY `microDust` HAVING precipitation > 0;

### 6. 미세먼지 와 풍속  
* 미세먼지 상태 별로 평균 풍속을 구하고 평균 풍속이 높은 순으로 출력하세요. 
* 단, 평균 풍속이 4.0km/h 이상인 정보만 출력 하세요. 
* 출력 컬럼은 아래 출력 예시를 참조하세요. 

SELECT `microDust`, AVG(windSpeed) as windSpeed FROM `weatherhistory`
GROUP BY `microDust` HAVING windSpeed > 4.0 ORDER BY windSpeed DESC;
