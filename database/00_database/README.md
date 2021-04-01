# 데이터베이스(Database)

## 데이터베이스(Database: DB)
데이터를 저장하는 저장소

## 데이터베이스의 종류
### Relation DB(RDB)
관계형 데이터베이스

* 행과 열로 구성된 테이블 형태
* 테이블 형태를 정의/설계(Scheme)하고 그 형태에 맞게 데이터를 저장한다.
  * 외부, 개념, 내부 스키마
* 여러 테이블이 서로 관계가 있는 구조일 수 있다.

> 대표적인 RDB의 예

* MySQL
* Oracle DB
* Maria DB

### No SQL
관계형 데이터베이스가 아닌 SQL

* 설계를 변경하지 않아도 동적으로 속성을 추가 가능
* 테이블 간의 연결을 통한 조회 불가
* 속도가 빠름
* 서버를 클라우드 형태로 구성한다.

> 대표적인 No SQL의 예

* Mongo DB: 데이터를 key-value의 쌍으로 저장. JSON과 같은 형태.
* HBase: BigData 저장
* Hadoop: BigData 저장

