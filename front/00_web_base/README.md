# Web의 흐름 

## 클라이언트와 서버
![1](/material/images/dulumary/web/front/server_client.png)

### 클라이언트(Client)
- 정보를 요청하는 곳
- HTTP 프로토콜 규약에 따른 **요청(Request) 문서**로 정보를 요청한다.

### 서버(Server)
- 정보를 주는 곳
- 요청 받은 **Request 문서**의 내용을 기반으로 HTTP 프로토콜 규약에 따른 **응답(Response) 문서**를 돌려준다.

### Request의 구조
> HTTP 규약에 따른 Request 문서의 구조

||||
|----|---|---|
|Start Line(요청 라인)|URL 정보, 프로토콜 버전 정보, 포트번호|예) GET /sign/in HTTP/1.1|
|Header|이름과 값의 key value 쌍(생략 가능)|예)<br> Host: marondal.com:80<br>User-agent: Mozilla/5.0 (Windows NT 10.0;....) |
|Blank Line|header와 Body를 구분하는 빈 줄||
|Body|파일 전송 또는 JSON 데이터(생략 가능)|예) JSON인 경우<br>{"userId":"marobiana",  "email":"sbr@kakao.com"}|

> Request의 예

![request example](/material/images/marobiana/web_flow/request.png)

### Response의 구조
HTTP 규약에 따른 Response 문서의 구조
||||
|----|---|----|
|Status Line(상태 라인)|프로토콜 버전 정보, 성공 여부 상태 코드와 상태 메시지|예) HTTP/1.1 200 OK|
|Header|이름과 값의 key value 쌍(생략 가능)|예) <br>Content-Length: 235892<br>Content-Type:text/html|
|Blank Line|header와 Body를 구분하는 빈 줄||
|Body|응답 데이터. HTML 또는 JSON 데이터 또는 File 등(생략 가능)||

> Response의 예

![response example](/material/images/marobiana/web_flow/response.png)

## 다양한 클라이언트의 요청
![2](/material/images/dulumary/web/front/server_client2.png)

### 클라이언트(Client)의 종류
- 웹 브라우저
- 안드로이드 Application
- IOS Application

## 서버와 데이터베이스의 통신
![3](/material/images/dulumary/web/front/server_db.png)
