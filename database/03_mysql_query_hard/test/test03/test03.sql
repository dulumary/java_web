# 1. 그룹별 개수 세기

SELECT `userName`, count(*) FROM `review` GROUP BY `userName`;

# 2. 그룹별 평균 구하기

SELECT `store`, AVG(point) FROM `review` GROUP BY `store`;

# 3. 그룹 조건 

SELECT `userName` FROM `review` GROUP BY `userName` HAVING count(*) >= 4;

# 4. 학생별 평균

SELECT `name`, AVG(score) FROM `score` 
WHERE `year` = 2020 AND `semester` = 1 AND `type` = '기말고사'
GROUP BY `name`; 

# 5. 성적별 평균

SELECT `subject`, AVG(score) FROM `score` 
WHERE `year` = 2020
GROUP BY `subject` ;

# 6. 석차 구하기

SELECT `name`, AVG(score) FROM `score` 
WHERE `year` = 2020
GROUP BY `name` ORDER BY AVG(score) DESC;