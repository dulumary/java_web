# 서버 환경세팅
![구조도](/material/images/dulumary/web/develop/develop.png)

# 1. 프로그램 다운로드
### 1) 이클립스 다운로드
- [자바 엔터프라이즈 다운로드](https://www.eclipse.org/downloads/packages)
- Java EE zip download

### 2)톰캣(tomcat) 서버 다운로드
- 웹서버를 구동시키는 역할을 하는 tomcat을 설치한다.
- [톰캣 다운로드](https://tomcat.apache.org/) - 9 버전으로 설치한다. (10버전은 안됨!!!)
- Core > zip 파일 다운로드

### 3) JDK 다운로드(최신 버전은 JRE가 포함되어 있다)
- JDK 최신 버전 다운로드(version 15)

# 2. 이클립스에서 서버 연동하기
### 1) 이클립스에 톰캣 서버 연동
- windows > Preperences > Server 메뉴 > Runtime Enviroments
  - add 버튼 > Tomcat 9 버전 선택 > Browse 버튼 > 톰캣 설치 경로 선택
  ![tomcat path](/material/images/marobiana/servlet/0_setting/tomcat.png)

### 2) Web Application을 Server와 연결(WAS)
- Server 탭에서 우측 마우스 > New > Server > 서버 선택
  - Project Explorer 탭에 Servers 폴더가 생긴다.
- 포트 번호를 변경할 거라면, server.xml에서 포트번호를 `80` 으로 변경
  - tomcat 설치 경로 > conf > server.xml에서도 바꿔야 한다.

# 3. Servlet 만들고 테스트 해보기
## 1) 글자 인코딩 설정
설정하지 않으면 프로그램에서 한글이 깨질 수 있다.  
Window > Preferences 설정창을 띄운다.  
- General > Workspace 에서 좌측 하단 `Text file encoding`을 Othre 선택 > UTF-8로 변경
- Web > CSS Files > Encoding `ISO 10646/Unicode(UTF-8)` 선택
- Web > HTML Files > `ISO 10646/Unicode(UTF-8)` 선택
- Web > JSP Files > `ISO 10646/Unicode(UTF-8)` 선택

## 2) 프로젝트 만들기
- File > New > Dynamic Web Project
  - 프로젝트 이름을 짓고, 톰캣 버전 확인 후 Next
- Next 후 `Generate web.xml... 꼭 체크` 한다!

## 3) Hello world 출력하기
### (1) mapping url 설정
- 
> 프로젝트 > WebContent > WEB-INF > web.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
  <display-name>TestServer</display-name>
  
  <servlet>
  	<servlet-name>hello</servlet-name>
  	<servlet-class>com.test.HelloController</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>hello</servlet-name>
  	<url-pattern>/hello</url-pattern>
  </servlet-mapping>
</web-app>
```

### (2) Controller 만들기
- Java Resources > src 아래에 `servlet-class`에 명시한 경로의 클래스를 만든다.
   - `com.test.HelloController 클래스` 만들기  
   ![tomcat path](/material/images/marobiana/servlet/0_setting/controller.png)
- 이 클래스는 반드시 `HttpServlet 클래스`를 **상속**받아야 한다. 
- `void doGet(HttpServletRequest request, HttpServletResponse response)` 메소드를 오버라이드 한다.
  - PrintWriter 클래스를 통해 출력할 내용을 작성한다.(아래 코드 참조)
```
package com.test;
import jakarta.servlet.http.HttpServlet;

public class HelloController extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		PrintWriter out = response.getWriter();
		out.println("hello world!!!");
	}
}
```
### (3) WAS 만들기
- Server 탭의 서버 선택 후 오른쪽 클릭 > Add and remove > `프로젝트 명` 서버를 Add해서 Configured로 이동 > finish
- 서버 탭> Start the Server 버튼 
  - 서버가 켜지며 Console 탭에서 에러 여부를 확인할 수 있다.
- 브라우저에서 `http://localhost:8080/Test/hello` 로 접속 후 확인!
  - 포트번호가 80이면 포트번호는 안붙여도 된다.
  - Test는 `프로젝트 명`이다.
- 주소에서 `/Test`를 제거하고 싶으면
  - 이클립스 Servers 탭에서 `Tomcat v9.0 Server at localhost` 더블클릭 > Modules 탭 클릭 > Path 클릭 후 Edit > Path를 / 로 변경 후 OK > 저장
  - 또는 `server.xml`에서 Context 태그의 path를 "/"로 변경한다.

### (4) jsp 주소로 바로 접근하기
> web.xml > `<web-app>` 안에 설정 추가
```
<!--The mappings for the JSP servlet -->
<servlet-mapping>
	<servlet-name>jsp</servlet-name>
	<url-pattern>*.jsp</url-pattern>
	<url-pattern>*.jspx</url-pattern>
</servlet-mapping>
```

### jsp 파일의 경로
- WebContent 폴더 밑에 jsp 파일을 만든다.
- `WebContent/test/test.jsp`  
  ![jsp path](/material/images/marobiana/servlet/0_setting/jsp.png)
- URL `http://localhost:8080/test/test.jsp`로 브라우저에서 접속

# 4. 부트스트랩 사용하기
HTML을 예쁘게 꾸며주는 부트스트랩(boot strap)을 사용해본다.  
- jquery 기능이 simple한 버전이므로 많은 기능을 사용할 때는 CDN 주소를 바꿔준다.

> head 태그에 부트스트랩 CSS, Javascript 추가
```
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
```

# 5. DB 연동
JAVA의 기본 DB 연동 방식인 JDBC(Java Data Base Connection) 드라이버를 사용한다.  

## JDBC 라이브러리 다운로드
- `mysql jdbc connector`를 검색하여 다운로드 사이트([MySql Connector/j](https://dev.mysql.com/downloads/connector/j/))에 접속한다.
- `Platform Independent`를 선택하고 zip 파일 다운로드 (No thanks, just start my download.)
- `mysql-connector-java-version.jar`를 tomcat이 설치된 경로 > lib로 이동시킨다.  
![jdbc](/material/images/marobiana/servlet/0_setting/jdbc.png)

## 이클립스에 JDBC 라이브러리 추가
- Test 프로젝트 > Java Resources > Libraries > JRE System Library 우측 클릭 > Build Path > Configure Build Path
- Libraries 탭 > module path 클릭 > Add External JARs 클릭 > 톰캣 설치된 경로/lib 밑에 있는 `mysql-connector-java-version.jar` 열기