## 1. 화면 URL 설계

|화면|URL path|
|---|---|
|타임라인|	`/timeline/timeline_view`|
|로그인|	`/user/sign_in_view`|
|회원가입|	`/user/sign_up_view`|

## 2. API 설계

### 1) 글쓰기 후 저장

### URL: /post/create				

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|content|	String|	N|	내용|
|file|	MultipartFile|	Y|	이미지 파일|

### 응답값
```
{"result":"success"}			
```

### 2) 글 삭제

### URL: /post/delete?postId={postId}				

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|postId|	int|	N|	글번호|

### 응답값
```
{"result":"success"}			
```

### 3) 좋아요/취소

### URL: /post/like?postId={postId}				

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|postId|	int|	N|	글번호|

### 응답값
```
{"result":"success"}			
```

### 4) 댓글 쓰기

### URL: /comment/create?postId={postId}				

### 입력값

|파라미터명|	데이터 타입|	NULL 허용 여부|	설명|
|---|---|---|---|
|postId|	int|	N|	글번호|
|content|	String|	N|	댓글 내용|

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


### 6) 회원가입

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