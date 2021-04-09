# JSP에서 Template 구성하기

## Templat 구성하기

![레이아웃](/material/images/marobiana/jsp/layout.png)  

각 영역을 각각 다른 jsp로 구성하여 하나의 페이지로 합치는 것(jsp 페이지의 모듈화)  
- 한 페이지에 많은 내용이 들어가면 복잡하므로 구역을 나눈다.
- 공통으로 사용되는 코드를 하나의 페이지에만 정의하기 위해 사용한다.(예: 부트스트랩 사용, 공통 함수 사용 등)

## (1) 정적(static) 방식 - JSP Include Directive
```
<%@ include file="date.jsp" %>
```

### 사용 예제
> result.jsp
```
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
생략...
<body>
    현재 시간은?
    <%@ include file="date.jsp">
</body>
```

> date.jsp
```
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<p>현재 시간: <%= java.util.Calendar.getInstance().getTime() %></p>
```

* `date.jsp`에 있는 내용 jsp 코드 자체가 `result.jsp`에 복사되는 형태
* 아래 코드와 같은 형태로 만들어 진 후 컴파일 된다.
* 하나의 파일로 인식하므로 **여러 jsp에서 같은 변수로 정의하는 경우 중복 에러**가 발생한다.
```
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
생략...
<body>
    현재 시간은?
    <%@ page import="java.util.Calendar" %>
    <p>현재 시간: <%= java.util.Calendar.getInstance().getTime() %></p>
</body>
```

## (2) 동적 방식 - Action Tag
```
<jsp:include page="date.jsp" flush="true">
```

### 사용 예제
> result.jsp
```
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
생략...
<body>
    현재 시간은?
    <jsp:include page="date.jsp" flush="true">
</body>
```

> date.jsp
```
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar,java.text.*" %>
<p>현재 시간: <%= java.util.Calendar.getInstance().getTime() %></p>
```

* `date.jsp`와 `result.jsp`는 독립적으로 각각 컴파일 된다.
* 각각 jsp로 컴파일 되어야 하므로 `date.jsp`에도 상단에 page 정보를 입력해야 한다.
* 각각 컴파일 된 HTML 결과 자체가 include 된다.