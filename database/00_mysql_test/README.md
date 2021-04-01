# MySQL 맛보기(Windows)

## 1. 콘솔에서 DB 사용하기

### 1) Database 접속

* `MySQL 8.x Command Line CLient` 프로그램 실행  
* 설정한 비밀번호를 입력한다.  
![console1](/material/images/marobiana/db/mysql_console_1.png)  

### 2) DB 목록 보기

```
show databases;
```

### 3) DB 선택
`use 데이터베이스명;`  
  
> sakila database 선택

```
use sakila;
```

### 4) 테이블들의 목록 보기

```
show tables;
```

### 5) 테이블 스키마(설계 정보 조회)

> film 테이블 스키마 보기

```
desc film;
```

### 6) 테이블 내용 보기

> film 테이블 내용 10개 보기

```
select * from film limit 10;
```

## 2. Workbench 프로그램 사용법

### 1) Database 접속

* 로컬 서버에 세팅된 `127.0.0.1:3306` 서버에 접속한다.

![workbench](/material/images/marobiana/db/workbench.png)  

### 2) DB 선택

* 좌측 Navigator에 스키마가 정의 되어 있는데 그 중 sample DB인 `sakila`를 선택한다.(더블 클릭)
* 테이블의 목록이 보인다.

![workbench](/material/images/marobiana/db/db_select.png)  

### 3) 테이블 스키마(설계 정보) 조회

* `film` 테이블의 스키마(Schema)를 조회해보자.
* 아래 쿼리를 블록 잡고 번개 모양 또는 `Ctrl + Enter`

```
desc `film`;
```

### 4) 테이블 데이터 조회

* `film` 테이블의 내용을 조회해보자.
* 아래 쿼리를 블록 잡고 번개 모양 또는 `Ctrl + Enter`

```
select * from `film`;
```