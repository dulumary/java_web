# 1. 문자열 찾기

SELECT * FROM `review` WHERE `review` LIKE '왈왈%';

# 2. 정렬 하기

SELECT * FROM `review` ORDER BY `createAt` DESC LIMIT 10;

# 3. 별점 높은순

SELECT * FROM `review` WHERE `store` = '교촌치킨' ORDER BY `point` DESC. 

# 4. 가장 낮은 별점

SELECT `userName`, `store` FROM `review` ORDER BY `point` LIMIT 1;
