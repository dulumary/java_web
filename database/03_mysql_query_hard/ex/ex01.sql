-- sakila DB 선택

# LIMIT
-- 처음부터 50개만 가져오기 
select * from city limit 50;

-- 처음부터 50개만 가져오기
select * from city limit 0, 50;

-- 101번째부터 50개 가져오기
select * from city limit 100, 50;


# LIKE(대소문자 구별 없음)
-- C로 시작하는 도시명 찾기
select * from city where city like 'C%';

-- C로 끝나는 도시명 찾기(권장 안함 - table full scan)
select * from city where city like '%C';

-- C가 들어가는 도시명 찾기(권장 안함 - table full scan)
select * from city where city like '%C%';

# LIKE(대소문자 구별) - BINARY 함수 사용
-- C가 들어가는 도시명 찾기
select * from city where city like BINARY('%C%');


# ORDER BY 
-- 오름차순 정렬하기
select * from city order by country_id;

-- 내림차순 정렬하기
select * from city order by country_id DESC;


# 내림차순 정렬하고 10개만 가져오기
select * from city order by country_id DESC LIMIT 10;


# CONCAT 함수
select CONCAT('hello ', 'world!!!');
select CONCAT('hello ', 'world!!!') AS str;

-- 제목:OOO, 설명:OOOOO 문자열로 결과 구성하기
select CONCAT("제목:", `title`, ", 설명:", `description`) as result from film;