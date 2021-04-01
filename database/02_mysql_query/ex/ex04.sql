/*
    id가 1인 데이터 삭제하기
    - 위험하므로 select문으로 삭제할 데이터를 조회하여 검증 후 DELETE 문으로 변경하여 사용한다.
*/
SELECT * FROM `user` WHERE id = 1;

DELETE FROM `user` WHERE id = 1;


/*
    테이블 내용 전체 삭제
    - 위험한 쿼리이므로 workbench에서 옵션을 변경해야 삭제 가능
    - edit > Preferences > SQL Editor 맨 아래 Safe Updates 체크 해제 후 프로그램 닫았다 켜기
*/
DELETE FROM `user`;   


/*
    다시 인서트 후 id값 확인해보면 마지막으로 설정됐던 id의 이후 값부터 저장된다.
*/
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
    '신보람',
    '19991108',
    '독서,노래,영화',
    '안녕하세요.\n저는 누구일까요?',
    now(),
    now(),
    'sbr@kakao.com'
);



/* 
    테이블 내용 전체 삭제 
    - 테이블 전체 내용 삭제하면서 초기화 하고 싶을 때
    - 내부적으로 DROP 테이블을 한 후 테이블을 새로 생성한다.
*/
TRUNCATE TABLE `user`;


/*
    다시 인서트 후 id값 확인해보면 마지막으로 설정됐던 id의 이후 값부터 저장된다.
*/
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
    '신보람',
    '19991108',
    '독서,노래,영화',
    '안녕하세요.\n저는 누구일까요?',
    now(),
    now(),
    'sbr@kakao.com'
);