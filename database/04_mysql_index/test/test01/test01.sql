> 성적관리 테이블을 이용해서 아래 문제를 풀어 보세요. 

### 1. 실행 계획 확인

explain 
SELECT `name` FROM `score` 
WHERE 
    `year` = 2020 
    AND  `semester` = 1 
    AND `type` = '중간고사'  
    AND `subject`= '수학'
    AND `score` >= 90; 

explain 
SELECT `subject` FROM `score` 
WHERE 
    `year` = 2020 
    AND `semester` = 1 
    AND `type` = '중간고사' 
    AND `name`= '조세호' 
    AND `score` > 90;


### 2. index 설정

* 해당 쿼리의 성능 향상을 위한 index 를 설정하고, 실행 계획을 통해서 결과를 확인해 보세요. 

