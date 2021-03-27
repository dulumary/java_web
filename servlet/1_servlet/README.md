# Servlet

## Servlet
- 클라이언트의 **요청(Request)** 을 처리하고 **응답(Response)** 으로 돌려주는 자바 Web 프로그램

## Servlet Container
- Servlet을 관리하고, 생명주기(Cycle)을 가지고, 소켓(Socket) 통신을 해주는 역할
- Tomcat이 그 역할을 해준다.

## Servlet과 Servlet Container
![servlet](/material/images/dulumary/web/servlet/servlet.png)

## HTTP METHOD 종류
일반적으로는 **GET, POST**를 가장 많이 사용한다.

|종류|설명|
|----|-----|
|`GET`|서버의 데이터를 **조회할 때** 사용<br>요청시 Query Parameter를 붙인다.<br>예) http://marondal.com/lecture?id=1003&page=3|
|`POST`|서버에 데이터를 **보낼 때** 사용<br>주로 form 데이터를 submit할 때 사용|
|`PUT`|서버에 데이터를 **저장**할 때 사용|
|`DELETE`|서버에 데이터를 **삭제**하도록 요청|

## 한글 깨짐 방지
한글이 ??? 로 나올 때 => 문자열 인코딩을 해주어야 한다.
```
public void doGet(HttpServletRequest request, HttpServletResponse) {
	// 아래 코드는 반드시 메소드의 가장 위쪽에 위치해야 한다!!!
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/plain");
}
```

## Date 객체
`java.util.Date` 객체를 만들면 오늘 날짜로 된 Date 객체가 만들어진다.
```
Date now = new Date();
```

## 날짜 출력하기
`java.text.SimpleDateFormat` 객체를 사용하여 여러형태로 날짜와 시간을 출력할 수 있다.  
### > [자바 레퍼런스 사이트](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html)
```
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
out.print(format.format(now));
```
> 출력 결과
```
2021-03-16 15:00:34
```

## JSON(Javascript Object Nation)
서버와 클라이언트 간의 데이터를 전송하기 위한 **데이터 구성 형식**

- 자바스크립트의 dict와 같은 형식으로 구성되어 있다.
-  `{ key : value }` 쌍으로 이루어져 있다.

> JSON 예제
```
{
  "employees": [
    {
      "name": "Surim",
      "lastName": "Son"
    },
    {
      "name": "Someone",
      "lastName": "Huh"
    },
    {
      "name": "Someone else",
      "lastName": "Kim"
    } 
  ]
}
```

### > [JSON 설명하는 블로그 참조](https://velog.io/@surim014/JSON%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80)

## Filter
- servlet의 실행 전, 후에 특정 작업을 수행한다.
- 반드시 추가하지 않아도 된다.
- servlet 마다 적용할 코드를 filter에서 수행하도록 하면 간편해진다.  

> 필터의 수행 과정
```
request -> filter -> servlet -> filter -> response
```

> 필터 적용 방법 (1) - web.xml
```
<web-app>  
   ...생략...
	
	<!-- 한글 깨짐을 방지하기 위한 인코딩 필터 추가 -->
	<filter>
  		<filter-name>characterEncodingFilter</filter-name>
  		<filter-class>com.test.filter.CharacterEncodingFilter</filter-class>
	</filter>

	<filter-mapping>
		<filter-name>characterEncodingFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
</web-app>
```

> 필터 적용 방법 (2) - annotation
```
@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 필터를 통과할 때 인코딩 설정
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}
}
```