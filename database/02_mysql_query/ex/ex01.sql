-- 한 행 추가
INSERT INTO `user`
(
    /*`id`,   auto increment이므로 추가하지 않는다.*/
    `name`,
    `yyyymmdd`,
    `hobby`,
    `introduce`, /* null 허용 컬럼은 꼭 넣지 않아도 된다. */
    `createdAt`, /* 기본값이 current timestamp이면 넣지 않아도 현재시간이 들어감 */
    `updatedAt`,
    `email`
)
VALUE
(
    '김인규',
    '19991108',
    '독서,노래,영화',
    '안녕하세요.\n저는 누구일까요?',
    now(),
    now(),
    'lecture@hagulu.com'
);

-- 한번에 여러행 추가
INSERT INTO `user`
(
    /*`id`,   auto increment이므로 추가하지 않는다.*/
    `name`,
    `yyyymmdd`,
    `hobby`,
    `introduce`,
    `createdAt`, /* 기본값이 current timestamp이면 넣지 않아도 현재시간이 들어감 */
    `updatedAt`,
    `email`
)
VALUES
(
    '김꾸꾸',
    '20000105',
    '멍때리기, 바다한테 장난치기',
    '멍~~~',
    now(),
    now(),
    'kkk@gmail.com'
),
(
    '김바다',
    '20191115',
    '사냥하기',
    '나랑 놀아줄 집사를 모집합니다',
    now(),
    now(),
    'hagulu@naver.com'
),
(
    '김바다',
    '20190708',
    '컴퓨터',
    '할말이 없구먼',
    now(),
    now(),
    'hagulu@kakao.com'
);


TRUNCATE TABLE `user`;