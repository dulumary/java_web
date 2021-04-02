# INDEX

## INDEX란?

* **데이터를 빠르게 조회하기 위한 Key** 개념
* WHERE 절에서 자주 조회되는 컬럼을 index로 등록하면 조회가 빨라진다.
* **특정 컬럼** 또는 **여러 컬럼**을 묶어 INDEX로 등록할 수 있다.
  - 여러 컬럼을 묶은 INDEX: **복합 INDEX** 또는 **복합키**
* 데이터가 insert 될 때, 인덱스 데이터도 따로 저장 된다.(인덱스가 너무 많으면 입력 속도 느려지고 용량 차지)

## InnoDB의 인덱스 구조

* MySQL의 스토리지 엔진인 InnoDB의 경우 **B+Tree 자료구조**로 구성되어 있다.(B-Tree의 확장 개념) 
* 균형 트리
* 복잡도: O(LogN)

## INDEX의 종류

|종류|설명|
|----|----|
|primary key(PK)|행을 대표하는 고유하고 중복되지 않는 key. 반드시 **NOT NULL**|
|key|일반 Key. 중복값 허용됨|
|unique key|중복값을 허용하지 않는 유일한 값을 갖는 키|
|foreign key|외래키. 다른 테이블과의 연결을 위한 키로, 실무에선 사용하지 않는다.|

## 인덱스는 언제 사용하는가?

* WHERE절에서 조회 조건이 빈번히 일어날 때
* NULL 값이 많은 데이터들 중 NULL이 아닌 데이터를 찾을 때 유용
* 특정 컬럼을 기준으로 데이터를 정렬할 때 index를 사용하는 것이 좋다.

## 테이블 생성하면서 INDEX 추가하기

```
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
```

## INDEX 따로 추가하기

> 일반 인덱스

```
ALTER TABLE 테이블명 ADD INDEX 인덱스명 (컬럼명1, 컬럼명2)
```

> Unique 인덱스

```
ALTER TABLE 테이블명 ADD UNIQUE INDEX 인덱스명 (컬럼명1, 컬럼명2)
```

## INDEX 삭제하기

```
ALTER TABLE 테이블명 DROP INDEX 인덱스명
```

## 실행 계획(성능) 보기

* MySQL의 `옵티마이저`가 어떻게 판단해서 쿼리를 실행하는지 정보를 본다.

* 인덱스가 여러개인 경우 **하나만 선택**된다.

```
explain 쿼리문;
```

> 성능이 안좋은 type부터 나열되어 있음
  
|type|설명|
|---|---|
|all|테이블 Full Scan(테이블 크기가 크다면 성능 개선 필수)|
|index|인덱스 Full Scan(인덱스 전체 조회. 테이블 크기가 크다면 성능 개선 필수)|
|range|인덱스를 사용한 범위 검색|
|ref|**key = value** 형태의 조회|
|eq_ref|테이블 간의 JOIN에서 PK 또는 Unique Key가 이용된 경우 |
|const| PK 또는 Unique Key로 조회된 경우. 최고의 성능.|

## 인덱스 사용시 주의할 점

* 인덱스가 여러개일 경우, **의도한 인덱스**를 타지 않을 수 있으므로 **실행 계획을** 확인할 것
* **카디널리티(Cardinality)가 낮으면** 사용하지 않는다.(중복도가 높은 경우)
  * 예) 성별 컬럼 - 남성이 80% 여성이 20%인 경우 INDEX 효과 없음
  * 예) 과목 컬럼 - 국어, 영어, 수학. 세 과목만 존재하는데 데이터가 많은 경우
* 컬럼의 값의 갱신이 자주 일어나는 경우 사용하지 않는다.
* **WHERE** 구문과 **ORDER BY**에서의 컬럼이 다른 경우 한쪽 index가 선택되므로 **실행 계획** 확인할 것

