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


## 웹서버의 흐름 구조도
웹 서버(Web Application Server: WAS)  

![5](/material/images/dulumary/web/servlet/servlet_was.png)

* **Dispatcher Servlet**: Request 요청을 처음 처리하는 곳
* **URL Mapping**: Request로 넘어온 정보 중 **path** 정보와 일치하는 코드를 찾아 매핑한다.
* **Contoller**: **path** 정보와 일치하는 코드 
  * Request 요청을 수행한다.
  * 데이터를 가공한다. (DB나 Cache 등을 연동해서 데이터를 저장하거나 꺼내오기도 한다.)
  * Response(응답)을 만들어 낸다.
    * **파일**
    * **JSON String**  예) `{"name": "신보람", "나이":25, "성별":"여"}`
    * **View**
      * **HTML**: HTML로 구성된 마크업 페이지
      * **JSP(Java Server Page)**   
        자바 문법을 HTML과 함께 사용할 수 있는 마크업 페이지  
        HTML 마크업과 DB에서 가져온 내용을 페이지에 구성하는 용도로 사용
      * 데이터를 넣는 동안에는 JSP 문법을 사용하여 구현하고, 그 결과물은 데이터가 들어있는 `HTML`이 된다.  
      * 브라우저는 서버가 구성한 `HTML` 내용을 해석하여 화면에 예쁘게 뿌려진다.

## MVC 패턴 구조
* 예전에는 Controller와 View의 개념을 혼합하여 사용했다.(jsp 화면에서 DB를 바로 연동하여 사용)
* MVC 디자인 패턴
  * 각 영역을 분리하여 유지보수를 독립적으로 수행할 수 있게 한다.  

![6](/material/images/dulumary/web/servlet/servlet_mvc.png)

* **Model(Domain)**: DB에서 가져온 객체 데이터  
  예) User 객체
* **View**: 마크업  
  예) HTML, JSP
* **Controller**  
  - Model과 View 사이에서 흐름을 제어   
  1. Request 요청 정보를 받음
  2. 데이터 가공 (Model 사용)
  3. Response(응답)을 만들어 돌려줌 (View 사용)