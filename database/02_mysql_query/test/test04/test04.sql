# 1. 별점 조건

SELECT * FROM `review` WHERE `point` <= 3.0;

# 2. 복합 조건

SELECT `menu`, `review`, `point` FROM `review` WHERE `store` = '교촌치킨' AND `review` is not NULL;


# 3. 개수 세기

SELECT count(*) FROM `review` WHERE `userName` = '전지현' AND `store` = 'BHC';


# 4. 날짜 조건

SELECT * FROM `review` WHERE `userName` = '강동원' AND `createdAt` >= '2025-03-11 00:00:00';

# 5. 복합 조건

SELECT * FROM `review` WHERE `userName` = '이정재' AND (`review` is not NULL  OR `point` >= 4.5) ;