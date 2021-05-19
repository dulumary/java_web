<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리</title>
</head>
<body>

	<c:set var="number" value="12345678" />
	<h2>숫자 출력</h2>
	<fmt:formatNumber value="${number }" />
	
	<h2>type</h2>
	숫자 : <fmt:formatNumber value="${number }" type="number" /> <br>
	3자리 마다 쉼표 제거 : <fmt:formatNumber value="${number }" type="number" groupingUsed="false" /> <br>
	<br>
	
	<%-- percent는 1이 100% --%>
	100% : <fmt:formatNumber value="1" type="percent" /> <br>
	40% : <fmt:formatNumber value="0.4" type="percent" /> <br>
	
	<br>
	
	통화 (원) : <fmt:formatNumber value="${number }" type="currency" /> <br>
	통화 (달러) : <fmt:formatNumber value="${number }" type="currency" currencySymbol="$" /> <br>
	
	<h2>var 저장 </h2>
	<fmt:formatNumber value="${number }" type="currency" currencySymbol="$" var="doller" />
	달러 EL태그로 출력 ${doller } <br>
	
	<h2>pattern</h2>
	3.14 : <fmt:formatNumber value="3.14" /> <br>
	3.14(0.0000) : <fmt:formatNumber value="3.14" pattern="0.0000" /> <br>
	3.14(#.####) : <fmt:formatNumber value="3.14" pattern="#.####" /> <br>
	3.14(#.####) : <fmt:formatNumber value="3.141952" pattern="#.####" /> <br>
	
	<hr>
	
	<h2>Date 객체 String형태로 출력 </h2>
	date format : <fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" /> <br>
	<fmt:formatDate var="pattern" value="${today }" pattern="yyyy/mm/ss HH:mm:ss" />
	pattern : ${pattern } <br>
	
	<h2>String을 Date 객체로 변환</h2>
	<fmt:parseDate value="${pattern }" pattern="yyyy/mm/ss HH:mm:ss" var="date2"/>
	Date 객체 : ${date2 }
	
</body>
</html>