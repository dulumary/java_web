# 1. 테이블 생성

CREATE TABLE `music` (
    `id` int NOT NULL AUTO_INCREMENT primary key, 
    `title` varchar(64) NOT NULL, 
    `playTime` int NOT NULL, 
    `lyricist`varchar(64) NOT NULL, 
    `composer`varchar(64) NOT NULL,
    `singerId`int NOT NULL,
    `albumId` int NOT NULL, 
    `createdAt`timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `singer` (
    `id` int NOT NULL AUTO_INCREMENT primary key, 
    `name` varchar(32) NOT NULL, 
    `debut` int NOT NULL, 
    `agency` varchar(16) NOT NULL, 
    `createdAt`timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `album` (
    `id` int NOT NULL AUTO_INCREMENT primary key, 
    `title` varchar(64) NOT NULL, 
    `releaseDate` timestamp NOT NULL, 
    `tracks` int NOT NULL, 
    `createdAt`timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 2. 데이터 저장

INSERT INTO `singer` (`name`, `debut`, `agency`, `createdAt`, `updatedAt`) 
VALUES ('성시경', 2000, '에스케이재원', now(), now()),
('AKMU', 2014, 'YG엔터테인먼트', now(), now()),
('아이유', 2008, '이담엔터테인먼트', now(), now());

INSERT INTO `album` (`title`, `releaseDate`, `tracks`, `createdAt`, `updatedAt`) 
VALUES ('The Ballads', '2006-10-10', 16, now(), now()),
('여기, 내 맘속에...', '2008-06-12', 11, now(), now()),
('항해', '2019-09-25', 10, now(), now()),
('SUMMER EPISODE', '2017-07-20', 4, now(), now()),
('Love poem', '2019-11-18', 6, now(), now()),
('Palette', '2017-04-21', 10, now(), now());

INSERT INTO `music` (`title`, `playTime`, `lyricist`, `composer`, `singerId`,`albumId`, `createdAt`, `updatedAt`)
VALUES ('거리에서',  279, '윤종신', '윤종신',  1, 1, now(), now()),
('그리운 날엔',  250, '심재희', '김형석',  1, 1, now(), now()),
('바람,그대',  250, '이미나', '하림',  1, 1, now(), now()),
('여기 내 맘속에',  250, '이미나', '유희열',  1, 2, now(), now()),
('안녕 나의 사랑',  257, '유희열', '성시경',  1, 2, now(), now()),
('어떻게 이별까지 사랑하겠어, 널 사랑하는 거지',  290, '이찬혁', '이찬혁',  2, 3, now(), now()),
('DINOSAUR',  240, '이찬혁', '이찬혁',  2, 4, now(), now()),
('MY DARLING',  225, '이찬혁', '이찬혁',  2, 4, now(), now()),
('Blueming',  217, '아이유', '이종훈',  3, 5, now(), now()),
('Love poem',  258, '아이유', '이종훈',  3, 5, now(), now()),
('밤편지',  253, '아이유', '김희원',  3, 6, now(), now()),
('팔레트',  217, '아이유', '아이유',  3, 6, now(), now());


# 3. 발매일 조건 

SELECT music.title, music.composer, album.title 
FROM `album` JOIN `music` ON album.id = music.albumId
WHERE album.releaseDate >= '2010-01-01';

# 4. 가수별 총 노래 수 

SELECT singer.name, singer.debut, count(*) as count
FROM `singer` JOIN `music` ON singer.id = music.singerId
WHERE singer.debut > 2005
GROUP BY singer.id ORDER BY count DESC;

# 5. AKMU 노래 

SELECT singer.name, music.title, music.playTime, album.title as `album title`
FROM `singer` 
JOIN `music` ON singer.id = music.singerId
JOIN `album` ON music.albumId = album.id
WHERE singer.name = 'AKMU';

# 6. 기간내의 노래 

SELECT music.title, singer.name, music.playTime, album.title as `album title`
FROM `singer` 
JOIN `music` ON singer.id = music.singerId
JOIN `album` ON music.albumId = album.id
WHERE album.releaseDate >= '2008-01-01' AND album.releaseDate < '2019-01-01' 
AND music.playTime >= 240;


# 7. 앨범별 총 재생 시간 

SELECT  singer.name, album.title, album.tracks, sum(playTime) as playTime
FROM `singer` 
JOIN `music` ON singer.id = music.singerId
JOIN `album` ON music.albumId = album.id
GROUP BY album.id, singer.name HAVING playTime > 470 ORDER BY playTime;
