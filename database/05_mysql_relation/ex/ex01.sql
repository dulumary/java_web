# user 테이블 
select * from `user`; 
-- 취미가 독서인 사람들의 목록 정보를 모두 출력하세요. 
select * from `user` where `hobby` like '%독서%'; 

-- 1 정규화: 한 컬럼에 여러값이 들어가는 경우, 한 행에 하나의 값만 들어가도록 나눈다.
insert into `user` (`name`, `yyyymmdd`, `hobby`, `introduce`, `createdAt`, `updatedAt`, `email`)
values 
('신보람', '19991108', '독서', '안녕하세요. 저는 누구일까요?', now(), now(), 'sbr@kakao.com'),
('신보람', '19991108', '노래', '안녕하세요. 저는 누구일까요?', now(), now(), 'sbr@kakao.com'),
('신보람', '19991108', '영화', '안녕하세요. 저는 누구일까요?', now(), now(), 'sbr@kakao.com');

-- 취미만 따로 저장할 수 있는 테이블을 만드는게 좋을 것 같다!
  -- 누구의 취미인지 알 수 있어야 한다. 
      -- user 테이블은 유일한 사람들의 정보만 저장
      -- hobby 테이블은 어떤 사람(고유번호 = key)의 취미 정보 저장

create table `new_user` (
    `id` int not null auto_increment primary key,
    `name` varchar(10) not null,  -- user table의 id 필드(pk) 값
    `yyyymmdd` varchar(8) not null,  -- 하나만 저장할 것이므로 줄인다.
    `email` varchar(32),
    `introduce` text,
    `createdAt` timestamp DEFAULT current_timestamp,
    `updatedAt` timestamp DEFAULT current_timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

create table `hobby` (
    `id` int not null auto_increment primary key,
    `userId` int not null,  -- new user table의 id 필드(pk) 값
    `hobby` varchar(50),  -- 하나만 저장할 것이므로 줄인다.
    `createdAt` timestamp DEFAULT current_timestamp,
    `updatedAt` timestamp DEFAULT current_timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 데이터 입력
-- 사람 정보
insert into `new_user` 
(`name`, `yyyymmdd`,  `email`, `introduce`, `createdAt`, `updatedAt`)
values 
('신보람', '19991108', 'sbr@kakao.com', '안녕하세요. 저는 누구일까요?', now(), now()),
('김바다', '20191023', 'marobiana@naver.com', '야옹야옹~~', now(), now());

-- 취미 정보
select * from new_user;

-- dummy data 추가
insert into `hobby` 
(`userId`, `hobby`,  `createdAt`, `updatedAt`)
values
(1, '독서', now(), now()),
(1, '노래', now(), now()),
(1, '영화보기', now(), now()),
(1, '요가', now(), now()),
(2, '사냥하기', now(), now()),
(2, '그루밍', now(), now()),
(2, '스크래치', now(), now()),
(2, '노래', now(), now());