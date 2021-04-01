# Query

## 1. INSERT

> 한 행 추가

```
INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3, ...)
VALUE (값1, 값2, 값3, ...)
```
또는
```
INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3, ...)
VALUES (값1, 값2, 값3, ...)
```

> 한번에 여러행 추가

```
INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3, ...)
VALUES
(값1, 값2, 값3, ...),
(값1, 값2, 값3, ...),
(값1, 값2, 값3, ...)
```

## 2. SELECT

> 테이블 전체 조회

```
SELECT *
FROM 테이블명
```

또는

```
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명
```

> 조건에 일치하는 데이터 조회

```
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명
WHERE 조건
```

> 테이블명 별칭(Alias) 지정

```
SELECT *
FROM 테이블명 AS 별칭
```

> 컬럼명 별칭(Alias) 지정

```
SELECT 컬럼명1 AS 별칭1, 컬럼명2 AS 별칭2
FROM 테이블명
```

> 특정 컬럼 중복값 제거

```
SELECT DISTINCT 컬럼명1
FROM 테이블명
```

> 데이터 전체 개수 조회

```
SELECT COUNT(*) FROM 테이블명
```

## 3. UPDATE

> **컬럼명**이 **값**인 데이터 수정

```
UPDATE 테이블명
SET 컬럼명1=값1, 컬럼명2=값2, ...
WHERE 컬럼명=값
```

## 4. DELETE

> 모든 데이터 삭제

```
DELETE 
FROM 테이블명
```

> 조건에 해당하는 데이터 삭제

```
DELETE 
FROM 테이블명
WHERE 조건
```
