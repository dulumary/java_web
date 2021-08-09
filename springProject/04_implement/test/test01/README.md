# 환경세팅 및 형상관리

## 1. 환경세팅

**환경세팅 메뉴**를 참조하세요.

* STS 플러그인 설치
* 글자 인코딩 설정
* 프로젝트 만들기

### 문제 1) 기본 동작 확인

> `com.xxx.test.TestController` 컨트롤러를 만들어 구현하세요.  

`http://localhost.com:8080/test1`로 접속하면 "Hello world"가 브라우저에 출력되도록 하세요.

## 2. 형상관리

**형상관리 메뉴**를 참조하세요.

* 깃허브 서버에 Repository 공간을 만들기
* SourceTree 프로그램으로 로컬 프로젝트를 git 초기화
* `.gitignore` 파일 확인 후 모든 파일 커밋
* 원격 서버(깃허브 서버)와 연결 후 push

## 3. DB 연동

**DB 연동 메뉴**를 참조하세요.

* 설정 클래스 추가
* DB 접속 정보 추가 
  * `.properties` 대신 `.yml` 파일로 변경
* logback 설정을 통해 쿼리를 로그로 출력하도록 세팅
* MyBatis 연동 잘되는지 테스트 DAO, 테스트 Mapper 만들어서 테스트
* 쿼리를 로그로 볼 수 있도록 logback 설정을 추가한다.

### 문제 2) DB 연동 확인

> `com.xxx.test.TestController` 컨트롤러에 구현하세요.
  
`http://localhost.com:8080/test2`로 접속하면 like 테이블의 내용이(임시로 채우기) `List<Map<String, Object>>` 형태로 브라우저에서 JSON 형태로 출력되도록 하세요.

## 4. JSP 연동

### 1) `application.yml`에 jsp를 위한 mvc 설정을 추가한다.

```
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/memo?serverTimezone=UTC&characterEncoding=UTF-8
    username: root
    password: root
  mvc:
    static-path-pattern: /static/**
    view:
      prefix: /WEB-INF/jsp/
      suffix: .jsp
```

### 2) gradle에 jsp를 위한 디펜던시 추가

반드시 **gradle Refresh**를 해야한다.

```
dependencies {
  ...
	implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
	implementation 'javax.servlet:jstl:1.2'
}
```

### 3) jsp 디렉토리 만들기

```
src/main/webapp/WEB-INF/jsp
```

### 문제 3) JSP 동작 확인

> `com.xxx.test.TestController` 컨트롤러에 구현하세요.  

`http://localhost.com:8080/test3`으로 접속해서 JSP 화면을 나타내보세요.(아무 태그를 작성해보세요.)