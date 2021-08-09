# 1. 도메인 정의

### [메모게시판 기획서](https://ovenapp.io/project/3L1ftoR8I88YuaglCuhxWKaCsJVPvkh5#teOop)

데이터를 insert 하게되는 화면이 어디있는지와, 그 데이터를 어떻게 조회하는지를 살펴본다.(객체 관점으로 생각)

## 1) 회원 도메인
### 입력 항목
- 로그인 아이디
- 비밀번호
- 이름
- 이메일 주소

## 2) 메모 게시판 도메인

회원이 글을 쓰는 것이므로 **회원 도메인과 연결**된다.

- (글쓴 사람의 정보) -> 회원의 PK를 저장한다.
- 제목
- 글 내용
- 이미지 첨부(이미지의 경로 URL)


# 2. 스키마 명세

1번에서 만든 도메인 항목에 RDB에 관련된 컬럼들을 추가한다.  
데이터 타입과 NULL 허용 여부, Auto Increment 여부 등 DB 속성도 정의한다.

## 데이터베이스명: `memo`

## 1) 회원 테이블
### 테이블명: `user`
  
|컬럼명|타입|NULL 가능 여부|Auto Increment|설명|
|---|---|---|---|---|
|id|	int|	N|	Y|	pk|
|loginId|	varchar(15)|	N|	N	|로그인을 위한 유저 아이디|
|password|	varchar(128)|	N|	N	|비밀번호|
|name|	varchar(20)|	N|	N	|이름|
|email|	varchar(128)|	N|	N	|이메일 주소|
|createdAt|	timestamp|	N|	N	|생성 날짜|
|updatedAt|	timestamp	|N|	N	|수정 날짜|
  
## 2) 메모 게시판 테이블
### 테이블명: `post`

|컬럼명|타입|NULL 가능 여부|Auto Increment|설명|
|---|---|---|---|---|
|id|	int|	N|	Y|	pk|
|userId|	int|	N|	N|	글쓴이의 user 테이블의 id(pk)|
|subject|	varchar(255)|	N|	N|	제목|
|content|	text|	N|	N|	글 내용|
|imagePath|	varchar(255)|	Y|	N|	업로드 된 이미지 경로|
|createdAt|	timestamp|	N|	N|	생성 날짜|
|updatedAt|	timestamp|	N|	N|	수정 날짜|

