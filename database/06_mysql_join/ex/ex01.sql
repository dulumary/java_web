# JOIN하지 않는 경우
-- 하구루의 판매 물품 리스트 가져오기
select * from `seller` where nickname = '하구루';
select * from `used_goods` where `sellerId` = 1;

# JOIN 
-- 하구루의 판매 물품 리스트 가져오기 : 결과 2행
select seller.*, used_goods.* 
from seller 
join used_goods
on seller.id = used_goods.sellerId
where 
seller.nickname = '하구루';

-- 테이블 별명 붙이기
select A.*, B.* 
from seller AS A
join used_goods AS B
on A.id = B.sellerId
where 
A.nickname = '하구루';

-- 하구루의 판매 물품 리스트 가져오기 : 결과 0행
select A.*, B.*
from seller as A
join used_goods as B
on A.id = B.sellerId
where
A.nickname = "하구루";


# INNER JOIN: 테이블들의 교집합
-- 하구루의 판매 물품 리스트 가져오기 : 결과 2행
select A.*, B.* 
from seller AS A
inner join used_goods AS B
on A.id = B.sellerId
where 
A.nickname = '하구루';

-- 하구루의 판매 물품 리스트 가져오기 : 결과 0행 => seller는 있으나 used_goods에 없어서 0행
select A.*, B.* 
from seller AS A
inner join used_goods AS B
on A.id = B.sellerId
where 
A.nickname = '하구루';



# LEFT JOIN(OUTER): 좌측 테이블 전체 - 우측 테이블 NULL 허용
-- 하구루의 판매 물품 리스트 가져오기 : 결과 2행
select A.*, B.* 
from seller AS A
left join used_goods AS B
on A.id = B.sellerId
where 
A.nickname = '하구루';

-- 하구루의 판매 물품 리스트 가져오기 : 결과 1행 => seller는 있으나 used_goods에 없어서 우측테이블이 NULL 값
select A.*, B.* 
from seller AS A
left join used_goods AS B
on A.id = B.sellerId
where 
A.nickname = '하구루';


# RIGHT JOIN(OUTER): 좌측 테이블 NULL 허용 - 우측 테이블 전체
-- 하구루의 판매 물품 리스트 가져오기 : 결과 1행 => seller는 있으나 used_goods에 없어서 좌측테이블이 NULL 값
select A.*, B.* 
from used_goods AS A
right join seller AS B
on A.sellerId = B.id
where 
B.nickname = '하구루';

-- 제목이 바퀴벌레로 시작하는 글을 올린 사람의 닉네임과 매너온도 확인하기
select A.nickname, A.temperature
from seller AS A
left join used_goods AS B -- inner join이나 left join이나 차이 없는 조건이다.
on A.id = B.sellerId
where 
    B.title like '바퀴벌레%';