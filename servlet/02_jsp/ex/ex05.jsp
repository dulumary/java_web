<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
</head>
<body>
<%
	//<<@= 자바 문법이므로 검색 시 자바 calendar 사용법으로 검색하면 됨 =@>>
	Calendar today = Calendar.getInstance();
	out.println(today);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
	out.println("오늘 날짜:" + format.format(today.getTime()) + "<br>");  // Calendar -> Date 객체로 변환 후 format 적용
	
	// 어제 날짜
	SimpleDateFormat format2 = new SimpleDateFormat("yyyy년 MM월 dd일");
	Calendar yesterday = Calendar.getInstance();
	yesterday.add(Calendar.DATE, -1); // 하루 전
	//yesterday.add(Calendar.MONTH, -1); // 한달 전
	//yesterday.add(Calendar.YEAR, -1); // 1년 전
	out.println("어제 날짜:" + format2.format(yesterday.getTime()) + "<br>");
	
	// 두 날짜 비교
	int result = today.compareTo(yesterday); // 기준값(today)이 크면 1, 같으면 0, 기준값이 작으면 -1
	if (result > 0) {
		out.print("today가 더 크다.");
	} else if (result == 0) {
		out.print("두 날짜는 같다.");
	} else {
		out.print("yesterday가 더 크다.");
	}
%>
</body>
</html>