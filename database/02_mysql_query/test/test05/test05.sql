# 1. 점수 업데이트 

UPDATE `score`
SET
    `score` = 100
WHERE 
    id = 5;

# 2. 점수 업데이트 

UPDATE `score`
SET
    `score` = 85
WHERE 
    `name` = '이광수' AND `year` = 2019 AND `semester`= 2 AND `subject` = '수학';

* 리뷰 관리 테이블을 이용해서 아래 문제를 풀어 보세요. 

# 3. 리뷰내용 추가 

UPDATE `review`
SET
    `review` = '역시 치킨은 BBQ 인정!'
WHERE 
    `id` = 10;

# 4. 일괄 변경

UPDATE `review`
SET
    `point` = 4.5,
    `review` = '식어도 맛있어요!!'
WHERE 
    `id` = 8;
