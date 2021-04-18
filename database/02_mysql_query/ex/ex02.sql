/* 
    테이블 전체 조회: 데이터가 많을 때 위험!!!
*/
SELECT * FROM `user`;

SELECT `id`, `name`, `yyyymmdd`, `hobby`, `introduce`, `createdAt`, `updatedAt`, `email`
FROM `user`;

/*<<@= 조회시 바뀌어 보이는것은 없음 =@>>*/
-- 테이블명에 별칭 붙이기
SELECT * FROM `user` AS `person`;

-- 컬럼명에 별칭 붙이기: 조회 후 컬럼명이 변경됨
SELECT `id`, `name`, `yyyymmdd` AS `birth`, `hobby`, `introduce`, `createdAt`, `updatedAt`, `email`
FROM `user`;

-- 특정 컬럼 중복값 제거 - 예) 동명이인 제거
SELECT DISTINCT `name` FROM `user`;

-- 데이터 개수 조회
SELECT count(*) FROM `user`;  
SELECT count(1) FROM `user`;  


-- 조건에 일치하는 데이터 조회
# id가 3번인 데이터 조회 
SELECT * FROM `user` WHERE `id` = 3;

# 이름이 `신바다`인 사용자의 생년월일 조회
SELECT `yyyymmdd` FROM `user` WHERE `name` = '신바다'; 

# 이름이 `신바다`가 아닌 사용자의 데이터 조회
SELECT * FROM `user` WHERE `name` != '신바다';

# 데이터의 생성일이 특정일 이후인 데이터들 조회 
SELECT * FROM `user` WHERE `createdAt` > '2021-03-25 00:00:00';

# 이름이 신바다인 데이터의 개수 조회
SELECT count(*) FROM `user` WHERE `name` = '신바다';

# 자기소개가 없는(NULL인) 데이터 조회
SELECT * FROM `user` WHERE `introduce` is null;

# 자기소개가 없는(NULL이 아닌) 데이터 조회
SELECT * FROM `user` WHERE `introduce` is not null;

# id가 3, 4, 5, 6번인 데이터 조회
SELECT * FROM `user`
WHERE `id` in (3, 4, 5, 6);


-- 조건이 여러가지인 경우 - 논리 연산자 사용
# id가 3번이거나 4번인 데이터 조회
SELECT * FROM `user` WHERE `id` = 3 OR `id` = 4;

# 이름이 `신바다`이면서 취미가 `사냥하기`인 데이터 조회
SELECT * FROM `user` WHERE `name` = '신바다' AND `hobby` = '사냥하기';