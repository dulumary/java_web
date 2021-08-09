# DB 설계

<<@=
- 설계 중에 가장 중요한 부분이고 핵심이다.
- 옛날에 자바로 객체지향으로 클래스들을 설계하고 만들었었다. 
- 그런 객체가 되는 것들을 정의하는 단계인데, 그런 객체 개념을 도메인(Domain)이라고 부른다.
- 그래서 도메인을 잘 정의하는게 이 단계의 핵심이다. 
- 이것을 잘 정의하는게 개발자의 역할이다.
- 만약, 글을 저장할거면, 글 클래스에 무슨 필드를 넣을것이냐의 관점으로 생각하라. 
- 요즘은 객체 자체를 바로 DB화 해서 저장할 수 있는 기술이 있을 정도로 도메인은 객체다.
- 그 객체 내용을 DB에 저장할 뿐이다.

## 진행 과정
* 예제는 ovenapp 기획서를 보면서 구글 스프레드시트에 메모 설계 스키마를 만든다.
* 문제는 md로 표 만들고, create문은 sql에 넣는다.

## 예제
### [메모 게시판 기획서 링크](https://ovenapp.io/project/3L1ftoR8I88YuaglCuhxWKaCsJVPvkh5#teOop)

### [스프레드 시트 예제]https://docs.google.com/spreadsheets/d/1IW-RaytKcfTu97P5yBBuXTeCHvRfNDG321NZwWW8dJY/edit?usp=sharing)

=@>>

# DB 설계 단계

## 1. 도메인 정의하는 법

입력되는 내용들을 기반으로 도메인(객체)를 구성해본다.  
어떤 내용이 DB에 저장이 되어야 하는지 객체 단위로 정의해본다.

### 회원가입
* 이름
* 이메일
* 비밀번호 

여기에 더해서 Database의 Primary Key(id)나 생성일, 수정일 등의 정보를 추가한다.

* 데이터의 중복이 생기는 경우에는 테이블을 적절히 나누어야 한다.
* 이 과정에서 다른 테이블의 데이터들과의 연결이 필요하다면 연결할 테이블의 key 값을 저장한다.  
  ![fk](/material/images/marobiana/db/fk.png)

## 2. 스키마 작성

필드의 특성을 고려하여 데이터 타입을 정의한다.  
Create SQL 문을 만든다.  

만약 빠뜨린 부분이 있거나 추가 사항이 있으면 컬럼을 추가하거나, 첫 개발 단계면 테이블을 다시 만든다.

> TIP
```
PK 이외의 컬럼을 기준으로 데이터를 자주 조회 하는지에 따라 인덱스 추가도 필요하다.
```