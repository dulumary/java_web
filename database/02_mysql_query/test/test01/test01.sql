# 1. 개인 성적 입력

INSERT INTO `score` (
    `name`, 
    `year`, 
    `semester`,
    `term`, 
    `subject`,
    `score`, 
    `createdAt`,
    `updatedAt`
) VALUE (
    '유재석', 
    2020,
    1, 
    '중간고사',
    '국어',
    80, 
    now(),
    now()
);

INSERT INTO `score` (
    `name`, 
    `year`, 
    `semester`,
    `term`, 
    `subject`,
    `score`, 
    `createdAt`,
    `updatedAt`
) VALUE (
    '유재석', 
    2020,
    1, 
    '중간고사',
    '영어',
    90, 
    now(),
    now()
);

INSERT INTO `score` (
    `name`, 
    `year`, 
    `semester`,
    `term`, 
    `subject`,
    `score`, 
    `createdAt`,
    `updatedAt`
) VALUE (
    '유재석', 
    2020,
    1, 
    '중간고사',
    '수학',
    95, 
    now(),
    now()
);

# 2. 성적 입력 다량 

INSERT INTO `score` (
    `name`, 
    `year`, 
    `semester`,
    `term`, 
    `subject`,
    `score`, 
    `createdAt`,
    `updatedAt`
) VALUES (
    '조세호', 
    2020,
    1, 
    '중간고사',
    '국어',
    75, 
    now(),
    now()
), 
(
    '조세호', 
    2020,
    1, 
    '중간고사',
    '영어',
    80, 
    now(),
    now()
) ,
(
    '조세호', 
    2020,
    1, 
    '중간고사',
    '수학',
    95, 
    now(),
    now()
);
