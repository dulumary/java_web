# SpringBoot 환경세팅

![구조도](/material/images/dulumary/web/develop/develop.png)

* `IDE 프로그램`: 프로그램을 작성할 수 있는 프로그램
* IDE 프로그램으로 `이클립스`를 사용해도 되고, `STS`(Spring Tool Suite)를 사용해도 된다.
  * 이클립스: 스프링 프레임워크를 사용하기 위한 부가적인 플러그인을 따로 설치해야 한다.

# 1. 프로그램 다운로드

### 1) STS(Spring Tool Suite) 다운로드

### [STS 다운로드 링크](https://spring.io/tools)

* jar 파일 다운로드 후 아래와 같은 아이콘을 더블클릭한다.
  * 만약 컴퓨터에 알집 프로그램이 설치된 경우 jar 파일이 압축 모양으로 나올 수 있다. 알집을 제거 후 수행한다.  
  ![jar](/material/images/marobiana/spring/jar.png)
* jar 파일 수행 후 압축이 풀린 sts 폴더가 생성된다.
* 폴더를 원하는 위치에 옮겨둔다.  
* `SpringToolSuite4.exe` 프로그램을 수행하면 된다.  
  ![jar](/material/images/marobiana/spring/exe.png)

# 2. JDK 다운로드

### [JDK 다운로드 링크](https://www.oracle.com/kr/java/technologies/javase-jdk15-downloads.html)

* 이번에는 높은 버전인 15를 설치해본다.
* 자바 9버전부터 JRE와 JDK가 통합되어 JDK만 다운로드 받아도 된다.
* 다운로드 후 jdk exe 파일 수행

### 자바 버전 확인하기

cmd(명령 프롬프트 수행) 후 아래 명령어 수행하고 자바 버전이 15가 맞는지 확인

```
java --version
```

만약 15버전이 아닌 경우 자바 path를 잡아주어야 한다.([환경변수 설정 하기](https://marobiana.tistory.com/163))

# 3. STS 열고 테스트 해보기

## 1) 플러그인 설치

새로운 STS에서는 jsp를 지원하지 않으므로 이클립스 플러그인이 필요하다.  

* `Help > Eclipse Marketplace...` 창에서 **Java and Web** 검색 후 install  
![plugin](/material/images/marobiana/spring/eclipse_plugin.png)  

## 2) 글자 인코딩 설정

설정하지 않으면 프로그램에서 한글이 깨질 수 있다.  
  
* Window > Preferences 설정창을 띄운다.  
  * General > Workspace 에서 좌측 하단 `Text file encoding`을 Othre 선택 > UTF-8로 변경
  * Web > CSS Files 에서 인코딩 **ISO 10646/Unicode(UTF-8)** 선택
  * Web > HTML Files 에서 인코딩 **ISO 10646/Unicode(UTF-8)** 선택
  * Web > JSP Files 에서 인코딩 **ISO 10646/Unicode(UTF-8)** 선택

## 3) 프로젝트 만들기

* 좌측 `Create New Spring Starter Projct` 또는 `File > New > Spring Starter Project` 선택   

### (1) 프로젝트 기본 설정

![project](/material/images/marobiana/spring/project.png)

* Name: 프로젝트 이름을 정한다. 
  * 앞으로 예제와 퀴즈를 다른 프로젝트에서 진행할 예정
  * SpringExample 또는 SpringQuiz
* Type: 빌드 방식 `Gradle` 선택
  * gradle이 maven보다 속도가 10~100배 빠르고 gradle로 변경되는 추세.
* Group: 만들 사이트의 URL의 도메인 주소(예: http://marondal.com) 설정하는 곳
  * 관례적으로 도메인으로 만든다.
  * `com.` 뒤에 자주 사용하는 id를 넣으면 된다.
* Package: `도메인 거꾸로.기본 패키지명` 형식으로 짓는다.

### (2) 필요한 Dependencies 설정
필요한 라이브러리들을 프로젝트에 연결시킨다.(build.gradle 파일에 라이브러리가 연결됨)
  
![dependency1](/material/images/marobiana/spring/dependency1.png)

* `Spring Boot DevTools`: 서버를 껐다켜지 않아도 변경된 내용을 브라우저에서 즉시 볼 수 있다.
* `Spring Configuration Processor`: 설정 파일(properties나 yml)에서 자동완성 되도록 도와준다.
* `Lombok`: 데이터를 저장하기 위한 모델 객체의 Getter, Setter를 어노테이션으로 쉽게 만들 수 있다.
  
  
![dependency2](/material/images/marobiana/spring/dependency2.png)

* `MyBatis Framework`: DB 데이터를 xml 형식에 쿼리를 만들어 쉽게 접근할 수 있도록 도와주는 프레임워크
* `MySQL Driver`: MySQL DB와 프로젝트의 연동을 돕는 드라이버
  
  
![dependency3](/material/images/marobiana/spring/dependency3.png)
  
* `Spring Web`: Tomcat을 컨테이너로 세팅해주고 Spring MVC 구조로 사용할 수 있도록 해준다.

### (3) 코드 동작 시키기

* `com.hagulu.ex.hello` package를 만든다. 
* TestController 클래스를 만든다.
* 아래 코드를 추가하고 서버를 켠다.
* http://localhost:8080/hello 로 접속한다.

```
@Controller
public class HelloController {
	@ResponseBody
	@RequestMapping("/hello")
	public String helloWorld() {
		return "Hello World!!";
	}
}
```

## 에러 잡기
### (1) debug 에러
`To display the conditions report re-run your application with 'debug' enabled.`

로컬 서버 > open configure 에서 arguments 탭 Program argument 영역에 **--debug** 파라미터 추가

### (2) DB 설정 에러
`Failed to determine a suitable driver class`
SpringExampleApplication.java에서 클래스명 위에 어노테이션 추가(디비 연동전에 임시로 넣는 코드)

```
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
```