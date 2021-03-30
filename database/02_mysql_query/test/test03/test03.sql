# 1. 전체 성적 출력

SELECT * FROM `score`;

# 2. 컬럼명 붙이기 

SELECT `name` AS '이름' `subject` AS '과목' `score` AS '성적' FROM `score`;

# 3. 특정 학생 성적

SELECT `year`, `semester`, `type`, `subject`, `score` FROM `score` WHERE `name` = '유재석';

# 4. 연도 조건

SELECT * FROM `score` WHERE `year` >= 2020;

# 5. 복합 조건 

SELECT * FROM `score` WHERE `year` >= 2020;

# 6. 개수 세기 

SELECT count(*) FROM `score` WHERE `name`= '유재석' AND `score` >= 90;
