# JSP(Java Server Page)

## JSP(Java Server Page)란?
HTML 코드에 Java 코드를 넣어 동적인 웹페이지를 구성할 수 있는 도구
- 뷰(HTML) + 서버(Java)
- JSP 실행시 **Servlet(.java)** 으로 변환된다.

## JSP 주석
```
<%-- 주석 내용 %-->
```

## JSP 스크립트 요소
JSP에서 자바 코드를 사용할 수 있는 영역

### (1) 스크립틀릿(Scriptlet)  `<% %>`
- 자바 코드를 작성할 수 있는 영역
- 이곳에서 선언된 변수는 **지역변수**가 된다.
<<@= - main 함수 같은 느낌 =@>>
> 스크립틀릿 사용 예제
```
int sum = 0;
for (int i = 1; i <= 10; i++) {
    sum += i;
}
```

### (2) 선언문 `<%! %>`
- JSP에서 멤버 변수와 메소드를 선언하는 용도
<<@= 일반 클래스 같은 느낌 =@>>
> 선언문 사용 예제
```
<%!
    // 필드
    private int num = 10;

    // 메소드
    public String getHelloWorld() {
        return "Hello World";
    }
%>
```

### (3) 표현식(Expression) `<%= %>`
- 스크립틀릿이나 선언문에 선언된 **변수 값**이나 메소드의 **리턴값**을 **출력**한다.
- 세미콜론(;)은 쓰지 않는다.
> 표현식 사용 예제
```
<body>
    <%= getHelloWorld() %> 
    <br>
    <%= sum %>
</body>
```
> 출력 결과
```
Hello World
55
```

## JSP 내장 객체
선언하지 않아도 사용 가능한 객체들

> `request, response, out, session, pageContext, application, config, page, exception`

