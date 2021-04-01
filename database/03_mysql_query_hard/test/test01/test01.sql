# 1. 개수 제한

SELECT * FROM `score` LIMIT 10;

# 2. 정렬 하기 

SELECT * FROM `score` ORDER BY `score` DESC

# 3. 조건부 정렬

SELECT * FROM `score` 
WHERE 
    `year` = 2020 AND 
    `semester`= 1 AND 
    `term` = '기말고사' AND 
    `subject` = '국어' 
ORDER BY `score` DESC 

# 4. 문자열 만들기

SELECT 
    CONCAT(`year`, '년 ', `semester` , '학기 ', `term`, ' ', `name`, ' - ', `subject`, `score`, '점') AS resutl 
FROM `score` LIMIT 5;

