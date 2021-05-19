<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리</title>
</head>
<body>

	<h2>조건문 (c:choose, c:when, c:otherwise)</h2>
	<%-- 70 이하면 치킨 80 이하면 샐러드 그게 아니면 굶 --%>
	<c:set var="weight" value="78" />
	
	<c:choose>
		<c:when test="${weight <= 70 }">
			치킨 먹자 <br>
		</c:when>
		
		<c:when test="${weight <= 80 }">
			샐러드 먹자 <br>
		</c:when>
		
		<c:otherwise>
			굶어<br>
		</c:otherwise>
	</c:choose>
	
	<h2>반복문 (c:forEach)</h2>
	<%-- 0 ~ 4 5번 반복 --%>
	<c:forEach var="i" begin="0" end="4" step="1">
		${i} <br>
	</c:forEach>
	<br>
	<%-- 16 ~ 20: 5번 --%>
	<c:forEach var="val2" begin="16" end="20" step="1" varStatus="status">
		${val2} ${status.current} ${status.first} ${status.last} ${status.count} ${status.index}<br>
	</c:forEach>
	<br>
	
	<%-- model로 전달 받은 List --%>
	<c:forEach var="fruit" items="${fruits}" varStatus="status">
		${fruit} ::::: ${status.count } ${status.index }<br>
	</c:forEach>
	<br>
	
	<%-- model로 전달 받은 List<Map> --%>
	<c:forEach var="user" items="${users}" varStatus="status">
		<h4>${status.count}번째 사람 정보</h4>
		
		이름 : ${user.name}<br>
		나이 : ${user.age }<br>
		취미 : ${user.hobby } <br>
	</c:forEach>
	
	<br>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>취미</th>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${user.name }</td>
					<td>${user.age }</td>
					<td>${user.hobby }</td>
				</tr>
			</c:forEach>
		</tbody>
	
	</table>
</body>
</html>