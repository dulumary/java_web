# 1. 도메인 정의

## 1) 회원 도메인
### 입력 항목
- 로그인 아이디
- 비밀번호
- 이름
- 이메일 주소

## 2) 글 도메인

회원이 글을 쓰는 것이므로 **회원 도메인과 연결**된다.

### 입력 항목
- (글쓴 사람의 정보) -> 회원의 PK, 이름을 저장한다.
- 제목
- 글 내용
- 이미지 첨부(이미지의 경로 URL)
- 좋아요 수

## 3) 댓글 도메인
- (어느 글에 달린 댓글인지 정보) -> 글의 PK, 이름을 저장한다.
- (댓글쓴 사람의 정보) -> 회원의 PK를 저장한다.
- 댓글 내용

# 2. 스키마 명세

## 1) 데이터베이스명: `marondalgram`

## 2) 테이블 정의 및 스키마 명세

### 회원 테이블: `user`

|컬럼명|타입|NULL 가능 여부|Auto Increment|설명|
|---|---|---|---|---|
|id|	int|	N|	Y|	pk|
|loginId|	varchar(15)|	N|	N	|로그인을 위한 유저 아이디|
|password|	varchar(128)|	N|	N	|비밀번호|
|name|	varchar(20)|	N|	N	|이름|
|email|	varchar(128)|	N|	N	|이메일 주소|
|createdAt|	timestamp|	N|	N	|생성 날짜|
|updatedAt|	timestamp	|N|	N	|수정 날짜|


### 글 테이블: `post`

|컬럼명|타입|NULL 가능 여부|Auto Increment|설명|
|---|---|---|---|---|
|id|	int|	N|	Y|	pk|
|userId|	int|	N|	N|	글쓴이의 user 테이블의 id(pk)|
|userName|	varchar(20)|	N|	N|	댓글쓴이 user 테이블의 이름|
|content|	text|	N|	N|	글 내용|
|imagePath|	var(255)|	Y|	N|	업로드 된 이미지 경로|
|createdAt|	timestamp|	N|	N|	생성 날짜|
|updatedAt|	timestamp|	N|	N|	수정 날짜|

### 댓글 테이블: `comment`

|컬럼명|타입|NULL 가능 여부|Auto Increment|설명|
|---|---|---|---|---|
|id|	int|	N|	Y|	pk|
|postId|	int|	N|	N|	글 테이블의 id(pk)|
|userId|	int|	N|	N|	댓글쓴이 user 테이블의 id(pk)|
|userName|	varchar(20)|	N|	N|	댓글쓴이 user 테이블의 이름|
|content|	varchar(255)|	N|	N|	댓글 내용|
|createdAt|	timestamp|	N|	N|	생성 날짜|
|updatedAt|	timestamp|	N|	N|	수정 날짜|

### 좋아요 테이블: `like`

> postId 별 카운트가 필요하므로 postId에는 반드시 Index 설정이 필요하다.

|컬럼명|타입|NULL 가능 여부|Auto Increment|설명|
|---|---|---|---|---|
|id|	int|	N|	Y|	pk|
|userId|	int|	N|	N|	User 테이블의 id(pk)|
|postId|	int|	N|	N|	글 테이블의 id(pk)|
|createdAt|	timestamp|	N|	N|	생성 날짜|



post 테이블에 좋아요 수 카운트를 갖도록 설계할 수 있으나 like 테이블을 따로 분리하였다.  
대규모 서비스의 경우 글 테이블의 사이즈가 방대하고,  
좋아요 수를 위한 조회가 여러 행에 빈번하게 이루어져야 하므로 post 테이블에 부하를 일으킬 수 있다.  

post 테이블의 하나의 row를 계속해서 접근하는 것보다  
별도 테이블에서 row를 쌓아서 조회하는 것이 성능면에서 훨씬 낫다.

좋아요가 취소되면 flag 컬럼을 두어 off로 할 수도 있고, row를 삭제하도록 설계할 수 있는데  
이번 예에서는 삭제하도록 설계하여 updatedAt이 없다.
