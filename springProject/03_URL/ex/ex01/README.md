## 1. MEMO 게시판 화면 URL

|화면|URL path|비고|
|---|---|---|
|게시판 목록|`/post/post_list_view`|자신이 작성한 글 목록만 보이도록 한다.<br>로그인이 된 상태에서만 접근 가능|
|글쓰기|`/post/post_create_view`|로그인이 된 상태에서만 접근 가능|
|글 내용 상세|`/post/post_detail_view`|게시판 목록에서 게시글을 클릭하면 상세 화면에서 내용을 보여준다.<br>로그인이 된 상태에서만 접근 가능<br>post의 id값이 파라미터로 필요|
|로그인|`/user/sign_in_view`||
|회원가입|`/user/sign_up_view`||

## 2. MEMO 게시판 API				

### 1) 글쓰기 후 저장

### URL: /post/create				

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|subject|	string|	N|	제목|
|content|	String|	Y|	내용|
|file|	MultipartFile|	Y|	이미지 파일|

### 응답값
```
{"result":"success"}			
```

### 2) 글 수정

### URL: /post/update?postId={postId}		

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|postId|	int|	N|	글번호|
|subject|	string|	Y|	제목|
|content|	String|	Y|	내용|
|file|	MultipartFile|	Y|	이미지 파일|

### 응답값
```
{"result":"success"}			
```

### 3) 글 삭제

### URL: /post/delete?postId={postId}				

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|postId|	int|	N|	글번호|

### 응답값
```
{"result":"success"}			
```


### 4) 회원가입

### URL: /user/sign_up						

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|loginId|	String|	N|	유저 아이디|
|password|	String|	N|	비밀번호|
|name|	String|	N|	이름|
|email|	String|	N|	이메일|

### 응답값
```
{"result":"success"}			
```

### 5) 로그인

### URL: /user/sign_in									

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|loginId|	String|	N|	유저 아이디|
|password|	String|	N|	비밀번호|

### 응답값
```
{"result":"success"}			
```

### 6) 로그아웃

### URL: /user/sign_out									

### 입력값

없음

### 응답값

없음

### 7) 아이디 중복확인

### URL: `/user/is_duplicated_id`

### 입력값
|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|loginId|	String|	N|	유저 아이디|

### 응답값
> 중복
  
```
{"result":true}			
```

> 사용 가능
  
```
{"result":false}			
```


## 실패시 응답 공통
```
{"result":"error"}
```