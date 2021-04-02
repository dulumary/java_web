-- index가 없는 컬럼 LIKE: Full scan
explain select * from customer where first_name like "A%";
explain select * from customer where first_name like "%A";
explain select * from customer where first_name like "%A%";

-- index가 있는 컬럼 LIKE: range scan
explain select * from customer where last_name like "A%";  -- range scan
explain select * from customer where last_name like "%A";  -- full scan
explain select * from customer where last_name like "%A%"; -- full scan


-- PK로 값 조회: const
explain select * from customer where customer_id = 3;

-- index 없는 컬럼 값 조회: full scan
explain select * from film where length = 100;

-- index로 값 조회: ref
explain select * from customer where store_id = 10;



-- PK로 범위 조회: range
explain select * from film where film_id < 10;  -- range
explain select * from film where film_id < 1000; -- range

-- index가 없는 컬럼 범위 조회: full scan
explain select * from film where `length` < 50; 

-- `length`컬럼 index 추가하기
ALTER TABLE film ADD INDEX index_length (`length`);

-- index로 범위 조회
explain select * from film where length < 50; -- range
explain select * from film where length < 100; -- full scan --> 데이터 수가 적기때문에 옵티마이저가 풀스캔이 낫다고 판단

-- 인덱스 삭제하기
ALTER TABLE film DROP INDEX index_length;