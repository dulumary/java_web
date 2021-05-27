# insert 

INSERT INTO `score` 
(`name`, `year`,`semester`,`term`,`subject`, `score`,`createdAt`,`updatedAt`)
VALUES
('이광수',2020,1, '중간고사','국어',80, now(),now()),
('이광수',2020,1, '중간고사','영어',90, now(),now()),
('이광수',2020,1, '중간고사','수학',85, now(),now()),

('조세호',2020,1, '기말고사','국어',70, now(),now()),
('조세호',2020,1, '기말고사','영어',80, now(),now()),
('조세호',2020,1, '기말고사','수학',60, now(),now()),

('유재석',2020,1, '기말고사','국어',90, now(),now()),
('유재석',2020,1, '기말고사','영어',100, now(),now()),
('유재석',2020,1, '기말고사','수학',95, now(),now()),

('이광수',2020,1, '기말고사','국어',80, now(),now()),
('이광수',2020,1, '기말고사','영어',75, now(),now()),
('이광수',2020,1, '기말고사','수학',90, now(),now()),

('조세호',2019,2, '기말고사','국어',85, now(),now()),
('조세호',2019,2, '기말고사','영어',80, now(),now()),
('조세호',2019,2, '기말고사','수학',70, now(),now()),

('유재석',2019,2, '기말고사','국어',95, now(),now()),
('유재석',2019,2, '기말고사','영어',90, now(),now()),
('유재석',2019,2, '기말고사','수학',80, now(),now()),

('이광수',2019,2, '기말고사','국어',75, now(),now()),
('이광수',2019,2, '기말고사','영어',80, now(),now()),
('이광수',2019,2, '기말고사','수학',100, now(),now());

# 1. 전체 성적 출력

SELECT * FROM `score`;

# 2. 컬럼명 붙이기 

SELECT `name` AS '이름', `subject` AS '과목', `score` AS '성적' FROM `score`;

# 3. 특정 학생 성적

SELECT `year`, `semester`, `term`, `subject`, `score` FROM `score` WHERE `name` = '유재석';

# 4. 연도 조건

SELECT * FROM `score` WHERE `year` >= 2020;

# 5. 복합 조건 

SELECT * FROM `score` WHERE `year` = 2020 AND `semester` = 1 AND `term` = '중간고사';

# 6. 개수 세기 

SELECT count(*) FROM `score` WHERE `name`= '유재석' AND `score` >= 90;
