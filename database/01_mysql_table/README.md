# 테이블 생성/삭제/수정

## 자주 쓰는 MySQL 자료형(Data Type) 종류

|자료형|설명|
|----|-----|
|int| 정수(4 Byte)|
|int unsigned| **unsigned**는 속성값으로, 양수(음수의 범위만큼 양수의 범위로 더 사용할 수 있다.) |
|tinyint|정수(1 Byte)|
|bigint|정수(8 Byte)|
|float|실수(4 Byte) 부동 소스점|
|double|실수(8 Byte) 부동 소수점 |
|decimal(n1, n2)|고정 소수점 <br> n1 : 전체 자리수 n2 : 소수점 자리수  <br> ex > 3.14  - decimal(3, 2)| 
|char(n)|고정형 문자. n은 글자수를 의미. 최대 255까지 가능<br>사이즈를 아는 고정된 문자를 저장할 때 사용<br>저장된 글자수가 n 보다 작으면 공백을 채운다.|
|varchar(n)|가변형 문자. n은 글자수를 의미. 최대 65,535까지 가능<br>집주소처럼 변화가 있는 값을 저장하는데 사용|
|text|가변형 큰 문자 데이터 저장<br>검색을 위한 **인덱스**가 제공되지 않음|
|bool 또는 boolean|true 또는 false 값 저장<br>데이터는 `0(false)과 1(true)`로 들어간다.|
|datetime|날짜 저장. 타임존 지원 안함<br>1000-01-01 00:00:00 ~ 9999-12-31 23:59:59|
|timestamp|날짜 저장. 타임존 지원<br>1970-01-01 00:00:01 ~ 2038-01-19 03:14:07|
|json|JSON 데이터를 저장|
|enum(값1, 값2...)|정의한 값만 저장할 수 있는 타입|

## 1. DB 생성하기
> 쿼리문
```
CREATE database 데이터베이스명;
```

> workbench
  
![create_db](/material/images/marobiana/db/createdb.png)


## 2. 테이블 생성하기

* 테이블의 스키마를 정의한다.

```
CREATE TABLE `lectureList` (
    `id` int NOT NULL AUTO_INCREMENT primary key,
    `lectureId` int NOT NULL,
    `order` int NULL DEFAULT 0,
    `subject` varchar(255) NOT NULL,
    `userId` int NOT NULL,
    `author` char(20) NOT NULL,
    `md` text,                        /* NULL 가능 */
    `onlyMaterial` boolean NOT NULL,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT AUTO_INCREMENT=10 CHARSET=utf8mb4;
```

## 테이블 생성문 용어 정리

### 1) `AUTO_INCREMENT`

* row의 **primary key**를 만드는데 주로 사용된다.(행의 번호)
* row가 추가될 때마다 1씩 증가하는 수가 자동으로 저장된다.
* 맨 아래 영역에 AUTO_INCREMENT의 시작값을 지정할 수 있다. `AUTO_INCREMENT=10` 

### 2) `primary key`

* row의 **주요(primary) key**로 설정한다.
* 유일한 값을 갖는다.(중복값이 들어가면 에러 발생)
* primary key로 조회할 때 속도가 빠르다.

### 3) `DEFAULT ...`
* row를 추가하면서 값을 지정하지 않았을 때, **기본값으로 무슨 값이 들어갈지 설정**

### 4) `ENGINE(Storage Engine)`
대표적인 스토리지 엔진으로 InnoDB, MyISAM 등이 있다.
* 동시성 제어나 데이터베이스의 내부 구조 제어를 담당
* MySQL 5.5 부터 기본 엔진이 **InnoDB**로 변경되었다.

### 5) `CHARSET`
* 문자열 set의 종류
* utf8mb4로 설정 시 이모지(emoji)가 저장될 수 있다.

## 3. 테이블 삭제하기

```
drop table 테이블명;
```

## 4. 테이블 수정하기

> 테이블명 변경

```
ALTER TABLE 테이블명 RENAME 변경할 테이블명;
```

> 컬럼 추가

```
ALTER TABLE 테이블명 ADD COLUMN 추가할 컬럼명 varchar(16) NULL;
```

> 컬럼 타입 수정

```
ALTER TABLE 테이블명 MODIFY COLUMN 타입 수정할 컬럼명 varchar(32) NULL;
```

> 컬럼명과 타입 수정

```
ALTER TABLE 테이블명 CHANGE COLUMN 이전컬럼명 변경할컬럼명 varchar(16);
```