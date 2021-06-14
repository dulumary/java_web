# 예시용 테이블 생성과 데이터 삽입

-- 테이블 생성
CREATE TABLE `entrant` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `name` varchar(10) NOT NULL,
    `license` varchar(20) NOT NULL,
    `score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 데이터 삽입
insert into `entrant` (`name`, `license`, `score`)
values
('김인규', '정보처리기사', 87),
('김바다', '컴퓨터활용능력', 95),
('김태형', '정보처리기사', 99),
('박지민', '컴퓨터활용능력', 68),
('김인규', '컴퓨터활용능력', 78),
('김남준', '정보처리산업기사', 40),
('정호석', '컴퓨터활용능력', 99),
('민윤기', '컴퓨터활용능력', 100),
('김바다', '정보처리산업기사', 78),
('김바다', '정보처리기사', 82);

# GROUP BY - 그룹화
-- 동명이인들을 그룹으로 묶는다.(중복 제거된 효과)
select `name` from entrant
group by `name`;

# DISTINCT - 중복제거
-- 동명이인이 있을 경우 한사람만 남기고 제거한다.(진짜 중복 제거)
select distinct `name` from entrant;


# 자격증 종류(중복 제거)
select `license` from entrant group by `license`;

-- 사람 별 응시 시험 개수 구하기 (행 자체가 응시 시험 종류이다.)
select `name`, COUNT(1) from entrant
group by `name`;

-- 자격증 종류별 점수 합계 구하기
select license, SUM(score) from entrant 
group by license;

-- 자격증 종류별 점수 평균 구하기
select license, AVG(score) from entrant 
group by license;


# HAVING - GROUP BY된 결과에 조건 붙이기
-- 자격증 시험을 2개 이상 응시한 사람의 이름 출력
  -- 1단계: 사람 별(name) 그룹핑
  -- 2단계: 그 중 개수가 2개 이상인 조건 구하기
select `name` from entrant
group by `name`
having count(*) >= 2;

-- 자격증 종류별 평균 점수가 80이 넘는 자격증을 출력
  -- 1단계: 자격증 종류별로 그룹핑 
  -- 2단계: 그 중 평균 80점이 넘는 자격증 조건 구하기
select `license` from entrant
group by `license`
having AVG(`score`) >= 80;