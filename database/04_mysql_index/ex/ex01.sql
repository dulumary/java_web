-- 테이블 생성하며 인덱스 등록하기
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(4) NOT NULL,
  `address` varchar(50) NOT NULL,
  `department` enum('국문과','영문과','컴퓨터공학과','전자공학과','물리학과') NOT NULL,
  `introduction` text NOT NULL,
  `number` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_number` (`number`) USING BTREE,
  KEY `idx_department` (`department`),
  KEY `idx_department_address` (`department`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



drop table `student`;

-- 테이블 생성과 인덱스 등록 따로하기
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT primary key,
  `name` char(4) NOT NULL,
  `address` varchar(50) NOT NULL,
  `department` enum('국문과','영문과','컴퓨터공학과','전자공학과','물리학과') NOT NULL,
  `introduction` text NOT NULL,
  `number` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- UNIQUE KEY 추가 (number 컬럼에서는 중복값이 들어 갈수 없다.)
ALTER TABLE `student` ADD UNIQUE INDEX `index_number` (`number`) USING BTREE;

-- 일반 인덱스 추가
ALTER TABLE `student` ADD INDEX `idx_department` (`department`);

-- 일반 복합 인덱스 추가
ALTER TABLE `student` ADD INDEX `idx_department_address` (`department`, `address`);