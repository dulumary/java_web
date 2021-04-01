/*
    id가 4인 데이터의 email 주소를 'paritea@gmail.com'로 변경하기
*/
UPDATE `user`
SET
    `email` = 'paritea@gmail.com'
WHERE
    id = 4;


/*
    id가 2인 데이터의 
        취미를 '맛집탐방'으로 변경하기
        자기소개를 '강남 맛집 전문가' 라고 바꾸기
*/
UPDATE `user`
SET
    `hobby` = '맛집탐방',
    `introduce` = '강남 맛집 전문가'
    `updatedAt` = NOW()
WHERE
    id = 5;