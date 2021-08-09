# 기능 구현

<<@= 
- 설계한 내용을 바탕으로 실제 구현을 시작하는 단계이다.
- 지난 강의인 스프링에서는 스프링 프레임워크의 기본적인 사이클과 사용법을 배웠다면,  
이번에는 그 사이클에 살을 조금 더 붙여서 부가적인 기술들도 함께 배워볼 것이다.

## 환경세팅
### STS 
1. 프로젝트를 저장할 폴더 만들기
2. STS 압축 새로 풀고 1번 폴더에 옮기기
3. 1번 폴더에 workspace 폴더 만들고 STS 열어서 workspace 위치 설정
4. 환경세팅 보고 플러그인, 인코딩 설정 후 프로젝트 생성, 형상 관리

=@>>


# 로그 찍기

WAS를 수행할 때 Console에 찍히는 것들을 로그(log)라고 한다.  
어떤 코드를 수행했는지 정보나 에러의 원인 등을 출력하여 개발하는데 도움이 된다.  

로그 용으로 **System.out.println()** 은 절대!!! 사용하면 안된다.  
사용자의 요청마다 새로운 쓰레드로 만들어지는데 println 메소드는 Thread Safe하지 않아 메소드가 수행되는 동안 사용자에게 Lock이 걸릴 수 있다.  

## SLF4J(Simple Logging Facade For Java)

로깅 `인터페이스`로 여러 Logging 구현체들을 갖는다.  
하나의 구현체를 선택해서 사용한다.  
인터페이스이므로 로깅 라이브러리를 변경해도 코드는 변경하지 않아도 된다.

### 로그 바인딩 종류(SLF4J의 구현체)의 예
- log4j
- JCL
- logback 

Springboot에서는 기본적으로 logback을 이용한 `SLF4J`를 사용한다.

## Log Level

레벨의 단계를 지정하면 지정된 레벨의 윗 단계의 레벨만 출력한다.  
DEBUG나 INFO는 너무 많은 내용이 출력되므로,  
실제 서버에서는 INFO 또는 WARN 이상의 높은 단계로 설정하여 위험한 상황의 로그들의 정보를 통해 버그를 추적한다.

> 자주 사용하는 레벨(오름차순)  
  
|레벨|설명|
|---|---|
|DEBUG|애플리케이션의 동작 진행 상황에 대한 **디테일한 정보**를 출력한다.|
|INFO|대략적인 수준으로 동작 **진행 정보**를 출력한다.|
|WARN|문제가 될 수 있는 부분에 대한 **경고 메시지**를 출력한다. |
|ERROR|프로그램 실행 중 발생된 **에러메시지**를 출력한다.|
|FATAL|프로그램을 중단시킬 수 있는 **치명적인 에러메시지**를 출력한다.|

> 그 외 레벨  
  
|레벨|설명|
|---|---|
|ALL|모든 메시지를 출력한다. (가장 낮은 단계)|
|TRACE|DEBUG보다 더 디테일한 정보를 출력한다. (디버그보다 낮은 단계)|
|OFF|로깅을 해제한다.(가장 높은 단계)|


### 로그 사용법

일반적으로는 LoggerFactory 클래스를 사용하여 로깅을 한다.  
Lombok 라이브러리를 디펜던시 하면 `@Slf4j` 어노테이션을 사용하면 log 객체를 사용할 수 있어서 쉽게 로깅할 수 있다.

> 일반적인 사용법 예시  
  
```
@Service
public class TestBO {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public void test() {
        logger.trace("로그를 출력한다.");
        logger.debug("로그를 출력한다.");
        logger.info("로그를 출력한다.");
        logger.warn("로그를 출력한다.");
        logger.error("로그를 출력한다.");
        logger.fatal("로그를 출력한다.");
    }
}
```

> Lombok이 dependency 된 경우 예시  
  
```
@Slf4j
@Service
public class TestBO {
    public void test() {
        log.trace("로그를 출력한다.");
        log.debug("로그를 출력한다.");
        log.info("로그를 출력한다.");
        log.warn("로그를 출력한다.");
        log.error("로그를 출력한다.");
        log.fatal("로그를 출력한다.");
    }
}
```

# Static 폴더

`src/main/resources` 폴더 밑에 **static 폴더**는 정적인 파일들을 저장하는데 사용된다.  
정적인 파일이란 프로그램을 수행하는데 변하지 않는 파일들을 의미한다.

![static](/material/images/marobiana/spring_project/4/static.png)

## static 폴더에 넣는 요소들
- css (스타일시트)
- js (자바스크립트)
- image

# 쿠키(Cookie)와 세션(Session)

어떤 사용자의 요청인지 식별하기 위해 사용한다.  
사용자마다 웹페이지 정보를 다르게 보여주기 위함이다.(예: 장바구니, 개인정보 등)

**브라우저 단위**로 요청을 식별한다.  
Request의 Header에 정보가 들어있다.  

> 세션의 예
```
브라우저(사용자A) <- (session ID) -> 서버
브라우저(사용자B) <- (session ID) -> 서버
...
```

## 쿠키(Cookie)

사용자의 식별 정보를 **사용자의 브라우저**에 저장한다.  
인터넷 사용정보 삭제(쿠키 삭제)를 하면 브라우저에서 식별 정보가 사라진다.  

쿠키는 **보안에 취약**하므로 비밀번호와 같은 **인증 정보는 저장하지 않도록** 한다.

## 세션(Session)

웹페이지의 로그인 기능은 세션을 사용한다.  
로그인 정보를 **서버에서 관리**하므로 보안상 안전하다.  

세션은 쿠키를 사용하는데, 브라우저 마다 쿠키에 `JSEESIONID`라는 세션아이디를 저장하고 이것으로 **사용자를 식별**한다.  

첫 요청시에는 Session Id가 없다.  
서버는 JSESSIONID가 없는 것을 확인하면 새로 발급하여 Response에 담아 내려준다.  
이후부터는 Request 시 session id를 헤더에 담아 요청한다.

### 세션을 없애려면...
- 브라우저를 닫는다.
- 로그아웃을 한다.(서버에서 세션을 삭제)
  
> 세션 생성(Controller)

```
@RequestMapping("/sign_in")
public Map<String, Object> signIn(HttpServletRequest request) { 
    User user = userBO.getUser(loginId, password);
    ...
    HttpSession session = request.getSession();
    session.setAttribute("userName", user.getName());
}
```
- HttpSession 객체에 userName 속성을 담아둔다. 
- (개발자의 입장에서) 세션에 담긴 userName을 여러 jsp에서 바로 사용 가능하다.

> 세션 사용(jsp)

```
${userName}님 안녕하세요.
```

> 세션 삭제(Controoler)
  
```
@RequestMapping("/sign_out")
public String signOut(HttpServletRequest request) {
	// 로그아웃
	HttpSession session = request.getSession();
	session.removeAttribute("userName");
	return "redirect:/user/sign_in_view";
}
```

# 파일 업로드

file 타입의 input 태그로 파일을 받아 서버에 업로드 한다.

## 1. jsp

> 파일 업로드 태그  

```
<input type="file">
```
기본으로는 한 개의 파일만 업로드 가능

```
<input type="file" multiple>
```
`multiple` 프로퍼티를 추가하면 여러개의 파일 업로드 가능  
  
> jQuery - 파일 객체 가져오기  

```
var file = $('#file')[0].files[0];   // 파일 객체 가져오기
```
- `$('#file')[0]`: **첫번째 input file 태그**를 의미
- `files[0]`: 업로드된 파일 중 첫번째 파일을 의미

> jQuery - AJAX로 파일 업로드
```
var formData = new FormData();
formData.append("file", $('#file')[0].files[0]);

$.ajax({
	url: '/post/create',
	data: formData,
	enctype: 'multipart/form-data', // 파일 업로드를 위한 필수 설정
	processData: false, 			// 파일 업로드를 위한 필수 설정
    contentType: false 			    // 파일 업로드를 위한 필수 설정
    ...
)};
```
- 폼 태그 대신 자바스크립트로 폼 객체를 만들어 데이터를 구성 후 AJAX로 서버와 통신한다.
- 파일 업로드를 위한 필수 key 값들을 함께 보내야 한다.

## 2. Java

jsp에서 보내진 파일을 실제 업로드 한다.

### 파일 업로드 과정
- 실제 파일이 저장될 **컴퓨터(서버)의 저장 경로**를 정한다.  
  예) `d:\김인규\workspace`
- 저장 경로 밑에 파일 업로드시 마다 중복되지 않는 폴더를 새로 생성한다.  
  예) `d:\김인규\workspace\aaa_16203948175`
- 파일을 byte 단위로 업로드 하여 위의 경로에 저장한다.

### 업로드 된 파일의 URL 주소 가져오기
- 웹에서 이미지를 보려면 이미지의 URL이 필요하다.
- 업로드 된 경로에 있는 이미지를 웹의 URL로 만드는 매핑(Mapping) 설정을 한다.(WebMvcConfig 클래스)
- `도메인 + 매핑된 URL Path`이 이미지 주소가 된다.  
  예) `http://localhost/images/aaa_16203948175/sun.png`

# 필터(Filter)와 인터셉터(Interceptor)

![필터와 인터셉터](/material/images/marobiana/spring_project/4/filter_interceptor.png)  

필터(Filter)와 인터셉터(Interceptor)는 컨트롤러가 수행되기 전/후 처리를 위한 개념이다.

## Filter

필터는 Spring Context에 포함되지 않는다.  
요청 전/후에 대한 처리를 할 수 있다.  

사용 예로는 인코딩 변환이 있다.  

FilterChain 클래스를 통해 여러 필터를 적용할 수 있다.

### 메소드 종류
- init() : 필터 인스턴스 초기화
- doFilter() : 전/후 처리
- destory() : 필터 인스턴스 종료

## Interceptor

Spring 내부에 존재하며, 스프링 내의 모든 객체(Spring Bean)에 접근 가능하다.  
요청 전/후에 대한 처리를 할 수 있다.

사용 예로는 로그인 여부 확인, 권한 확인 등이 있다.  
인증체크 후 어느 컨트롤러로 매핑할 지 제어할 경우 사용하기 적합하다.  

여러 인터셉터를 적용할 수 있다.

### 메소드 종류
- preHandle() : Controller가 실행 전에 먼저 수행된다.   
  - `false` 리턴: Controller를 수행하지 않는다.
  - `true` 리턴: Controller를 수행시킨다.
- postHandle() : Controller 수행 후 수행된다. View 렌더링 전이므로 Model과 View를(ModelAndView) 가지고 있다.
  - 리턴값 없음
- afterCopletion() : View가 렌더링 된 이후 호출된다.
  - 리턴값 없음