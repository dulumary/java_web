# 요청/응답 Life Cycle

## 1. 자바 빈(Java Bean) VS 스프링 빈(Spring Bean)

### 자바 빈(Java Bean)

JAVA에서 `new 클래스()`로 생성된 **일반 자바 객체**

### 스프링 빈(Spring Bean)

* 자바 빈 처럼 직접 `new 클래스()`로 만들지 않고, 스프링 어노테이션 등을 사용해서 만들어진 **스프링 객체**
* 스프링 프레임워크에서 스프링 빈의 생명주기와 객체간의 관계를 제어한다.

## 2. 설정 클래스

자바의 main 메소드를 통해 첫 진입한다.

> SpringExampleApplication.java

```
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class}) // DB 설정 안보겠다
@ComponentScan(basePackages = "com.marobiana")   // com.marobiana 패키지 아래에 있는 스프링빈들 탐색
@SpringBootApplication    // 스프링 구동을 위한 필수 어노테이션
public class SpringExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringExampleApplication.class, args);
	}

}

```
- `@SpringBootApplication` 어노테이션은 필수이며 아래 세 어노테이션을 붙인 것과 같은 기능이다.
```
@Configuration            	// 스프링 설정
@EnableAutoConfiguration    // 스프링 동작을 위한 많은 빈들의 목록을 등록
@ComponentScan			 	// (우리가 만든) 스프링 빈들을 탐색
```

## 3. 빌드 툴
Maven 또는 Gradle을 주로 사용한다.  
스프링 프레임워크에 필요한 라이브러리들을 연동시켜 쉽게 사용할 수 있다.
  
Maven을 사용하는 경우 `pom.xml`에 설정이 있다.  
Gradle을 사용하는 경우 `build.gradle`에 설정이 있다.  
  
> build.gradle의 dependencies 부분
```
dependencies {
	implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.1.4'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'mysql:mysql-connector-java'
	annotationProcessor 'org.springframework.boot:spring-boot-configuration-processor'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
}
```

필요한 라이브러리들을 검색해서 dependencies에 코드를 추가하고,  
**build.gradle 우측 마우스 클릭 > Gradle > Gradle Refresh Project** 를 누르면 적용된다.

# 어노테이션(Annotation) 종류

## 요청을 받는 어노테이션
### @Controller

* 요청이 들어오는 **스프링 빈**
* Dispatcher Servlet에서 @Controller 들을 스캔하고,   

**@RequestMapping** 을 참조하여 **주소의 path와 일치하는 메소드가 수행**된다.

* Class명 위에 위치한다.
  

### @RequestMapping("/경로")

* 클라이언트가 요청한 URL path와 일치하는 메소드가 수행된다.
* Class명 또는 메소드명 위에 위치한다. 
  * Class명과 메소드명 모두 위치한 경우 `/클래스명 경로/메소드명 경로`가 된다.
  

## 데이터를 돌려주는 어노테이션

*웹 주소로 요청하면, 웹사이트 View 화면이 아닌 `json 같은 데이터를 응답값`으로 보내준다.  
*이러한 요청을 **API(Application Programming Interface)** 라고 한다.
  
아래 어노테이션이 사용되면 `HttpMessageConverter`가 동작하여  
메소드의 리턴값에 따라 String 또는 Json으로 변환된다.
  
### @ResponseBody

* 컨트롤러 메소드의 리턴값이 데이터가 되어, Response 응답값의 body 영역에 넣어 보낸다.
* 만약 String을 리턴한 경우 텍스트 기반 HTML 형식으로 response body에 나타난다.
* 만약 **Jackson 라이브러리**가 설정된 경우  
컨트롤러 메소드에서 **Map이 리턴되면 JSON**으로 변환되어 response body에 나타난다.
* 메소드명 위에 위치, 또는 메소드의 리턴값 옆에 위치
  

### @RestController

* `@Controller + @ResponseBody`가 합쳐진 어노테이션이다.
* **@ResponseBody**를 생략해도 메소드에서 리턴된 데이터가 response body 영역에 넣어 보내진다.
* API 형태로 데이터를 리턴할 경우 자주 사용한다.
  

### 참고: ResponseEntity로 리턴하기

* Response의 Header 값이나 Status Code를 개발자가 세밀하게 제어할 수 있다.  

[HTTP STATUS CODE 레퍼런스](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)

  
# JSP View 연동하기
  
## dependency 추가

`build.gradle`에 디펜던시를 추가한다.  
  
필요한 라이브러리들을 검색해서 dependencies에 코드를 추가하고,  
**build.gradle 우측 마우스 클릭 > Gradle > Gradle Refresh Project** 를 누르면 적용된다.

> 반드시 **build refresh** 할 것!!! (안하면 404의 늪에 빠진다.)

```
compile('org.apache.tomcat.embed:tomcat-embed-jasper')
compile('javax.servlet:jstl:1.2')
``` 

## application.properties 추가

```
server.port=80
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
```

* server.port: 포트 변경

## jsp 추가 
* 톰캣 기반 웹 어플리케이션은 WEB-INF 아래 위치시키면 URL로 직접 접근을 막는다.(보안!)  

```
src/main/webapp/WEB-INF/jsp/lesson01/ex02.jsp
```

![jsp_path](/material/images/marobiana/spring/jsp_path.png)

  
## 컨트롤러 추가

* `@Controller`만 붙은 클래스의 메소드에서 String을 리턴하면 String 경로의 view를 찾는다.

```
@Controller 
public class Ex02Controller {
	@RequestMapping("/lesson01/ex02/1")
	public String ex02() {  
		return "lesson01/ex02"; 
	}
}
```

## 요청해보기
```
http://localhost/lesson01/ex02
```