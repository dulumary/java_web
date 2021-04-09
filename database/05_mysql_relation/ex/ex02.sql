# 홍당무 마켓
/*
    필요한 필드들
    물품: 제목, 가격, 물품설명, 물품사진, (판매자닉네임, 판매자 매너온도)      -> 물품 정보가 아닌 판매자 정보는 키만 가져온다.
    판매자 정보: 닉네임, 프로필이미지URL, 매너온도, (판매물품들)     -> 상호참조 X (판매자 아이디로 물품리스트 조회 가능하므로)
    
    물품과 판매자 정보가 연결은 pk 값으로 연결한다.
*/

# 물품 테이블 생성
create table used_goods(
    `id` int not null auto_increment primary key,
    `title` varchar(64) not null,
    `price` int not null,
    `description` text not null,
    `picture` varchar(255), -- nullable
    `sellerId` int not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 판매자 테이블 생성
create table seller(
    `id` int not null auto_increment primary key,
    `nickname` varchar(20) not null,
    `profileImageUrl` varchar(255),
    `temperature` decimal(3, 1) not null -- 36.5 ~ 99도 -> 온도가 떨어질수도 있음
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dummy data 추가
# 판매자 테이블 생성 - 물품 테이블이 판매자 PK를 참조하므로 먼저 생성
insert into seller
(`nickname`, `profileImageUrl`, `temperature`)
values
('마로비', 'https://cdn.pixabay.com/photo/2015/04/23/21/59/tree-736877__340.jpg', 36.5),
('아메리카노', NULL, 48.2),
('최준', 'https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804__340.jpg', 29.0),
('빠다', NULL, 36.5),
('하구루', 'https://cdn.pixabay.com/photo/2015/04/23/21/59/tree-736877__340.jpg', 36.5);


# 물품 테이블 생성
insert into used_goods
(`title`, `price`, `description`, `picture`, `sellerId`)
values
('플스4 팝니다', 100000, '쿨거래 하실분들 연락주세요.', 'https://cdn.pixabay.com/photo/2016/11/21/15/08/computer-1845880__340.jpg', 5),
('원피스 팝니다', 20000, '살이 빠져서 사이즈가 커져서 못입습니다.', 'https://cdn.pixabay.com/photo/2020/06/10/01/55/transboundary-5280644__340.jpg', 5),
('후라다 여성지갑 팝니다', 200000, '오늘 선물하려 했는데 헤어졌어요', NULL, 3),
('바퀴벌레좀 잡아주세요.', 5000, '제발 잡아주세요. 못들어가고 있어요..', NULL, 2);


-- 하구루의 판매 물품 리스트 가져오기
select * from `seller` where nickname = '하구루';

select * from `used_goods` where `sellerId` = 5;

-- 바퀴벌레를 잡아달라는 사람의 닉네임과 매너온도 확인하기
select * from `used_goods` where `title` like '바퀴벌레%';

select nickname, temperature from `seller` where id = 2;