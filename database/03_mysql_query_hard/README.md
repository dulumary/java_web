# SELECT문과 다양한 문법

## 1. 가져올 데이터의 개수 제한하기 - `LIMIT`

> 처음부터 50개만 가져오기

```
SELECT * FROM 테이블명
[WHERE 조건]
LIMIT 50
```

> 100개 이후부터(101번째 부터) 50개 가져오기

```
SELECT * FROM 테이블명
[WHERE 조건]
LIMIT 100, 50
```

## 2. 특정 문자가 들어간 데이터 찾기 - `LIKE`

* `%`로 시작되는 경우 index 조회가 아닌 `Full scan`이 되므로 사용하지 않는게 좋다.
* `A%`로 조회하면 **A로 시작하는 데이터**로 범위가 좁혀지므로 `range scan`이 된다.

> 이름이 A로 시작하는 데이터 찾기

```
SELECT * FROM 테이블명
WHERE `name` LIKE `A%`
```

> 이름에 A가 들어가는 데이터 찾기 - 권장 안함

```
SELECT * FROM 테이블명
WHERE `name` LIKE `%A%`
```

> 이름이 A로 끝나는 데이터 찾기 - 권장 안함

```
SELECT * FROM 테이블명
WHERE `name` LIKE `%A`
```

## 3. 테이블 정렬하기 - `ORDER BY`

* 테이블을 특정 컬럼 기준으로 정렬한다.

> 오름차순

```
SELECT * FROM 테이블명
ORDER BY `name`
```

> 내림차순

```
SELECT * FROM 테이블명
ORDER BY `name` DESC
```

## 4. 문자열을 합치는 함수 - `CONCAT()`

```
select concat('hello ', 'world') as str;
```

> 출력 결과
  
|str|
|---|
|hello world|

## 5. `GROUP BY`

* 컬럼명 기준으로 `같은 값의 데이터`를 **그룹화** 해서 묶는다.
* 만약 `GROUP BY name`으로 묶으면 **동명이인의 사람들이 하나의 그룹**이 되는 것이다.

```
SELECT * FROM 테이블명
GROUP BY 컬럼명
```

### GROUP BY name 결과
  
* 중복이 제거된 이름들이 결과로 나타난다.  
* 실제로는 동명이인들의 정보를 그룹화해서 가지고 있으므로 사람들의 정보로 COUNT, SUM 연산이 가능하다.   
![groupby](/material/images/dulumary/web/database/db_groupby.png)

### **SELECT DISTINCT name FROM 테이블** 결과
  
* GROUP BY 처럼 중복이 제거된 이름들이 결과로 나타난다.
* 중복이 완전히 제거되어 대표로 한 사람의 정보만 갖고 있으므로 COUNT, SUM 연산이 불가하다.  
![distinct](/material/images/dulumary/web/database/db_distinct.png)

> 예시 코드

```
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
('신보람', '정보처리기사', 87),
('김바다', '컴퓨터활용능력', 95),
('김태형', '정보처리기사', 99),
('박지민', '컴퓨터활용능력', 68),
('신보람', '컴퓨터활용능력', 78),
('김남준', '정보처리산업기사', 40),
('정호석', '컴퓨터활용능력', 99),
('민윤기', '컴퓨터활용능력', 100),
('김바다', '정보처리산업기사', 78),
('김바다', '정보처리기사', 82);
```

> 사람 별 응시시험 수 구하기  
  
각 이름마다 N행(N개의 시험)이 있는지 구한다.

```
SELECT count(*) FROM `entrant`
GROUP BY `name`
```

## 6. `HAVING`

* GROUP BY로 **그룹화 된 데이터에 조건 추가**하기

> 자격증 시험을 2개 이상 응시한 사람의 이름 출력  
> 1단계: **사람 별(name)** 그룹핑  
> 2단계: 그 중 **개수가 2개 이상인 조건** 추가

```
select `name` from entrant
group by `name`
having count(*) >= 2;
```