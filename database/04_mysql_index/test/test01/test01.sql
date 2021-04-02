> 리뷰 관리 테이블을 이용해서 아래 문제를 풀어 보세요. 

### 1. 실행 계획 확인

explain SELECT `userName`, `review` FROM `review` WHERE `userName` = '이정재';

explain SELECT `userName`, `point` FROM `review` WHERE `userName` = '이병헌' AND `point` <= 3.0;

explain SELECT `store`, `point`, `review` FROM `review` WHERE `store` = '교촌치킨' AND `review` is not NULL;

explain SELECT `store`,  avg(`point`) FROM `review` GROUP BY `store`;


### 2. index 설정

* 해당 쿼리의 성능 향상을 위한 index 를 설정하고, 실행 계획을 통해서 결과를 확인해 보세요. 

ALTER TABLE `review` ADD INDEX `idx_userName` (`userName`);
ALTER TABLE `review` ADD INDEX `idx_store` (`store`);