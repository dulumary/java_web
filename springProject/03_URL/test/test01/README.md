> 스프레드시트 또는 .md 파일 또는 문서에 URL과 API를 설계하세요.

## 1. 화면 URL 설계

[SNS 기획서](https://ovenapp.io/project/MEoDuSsYW8NUBUR7wH788CN5yck53bCz#IMbQe)를 참고하여 각 화면들의 URL을 설계하세요.

> 예시
  
|화면 설명|URL path|
|---|---|
|로그인|/login|

## 2. API 설계

기획서를 참고하여 데이터를 서버와 주고받을 수 있도록 API를 설계하세요.

> 예시
  
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

### 실패시 응답값
```
{"result":"error"}	
```