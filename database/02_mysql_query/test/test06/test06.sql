# 1. 데이터 삭제 

SELECT * FROM `review` WHERE id = 22;
DELETE FROM `review` WHERE id = 22;

# 2. 조건 삭제

SELECT * FROM `review` WHERE `userName` = '이정재' AND point < 2;
DELETE FROM `review`WHERE `userName` = '이정재' AND point < 2; 

