<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>jsp test01</title>
</head>
<body>



<%!

/*
	1에서부터 합 구하기 함수 
*/
public int allSum(int number) {
	int sum = 0; 
	for(int i = 1; i <= number; i++) {
		sum += i;	
	}
	return sum;
}
%>

<% 

/* 
	평균 구하기 
*/

	int[] scores = {80, 90, 100, 95, 80};

	int sum = 0;
	for(int i = 0; i < 5; i++) {
		sum += scores[i];
	}


/*
	리스트 점수 구하기 
*/

	List<String> scoring = Arrays.asList(new String[]{ "X", "O", "O", "O", "X", "O", "O", "O",  "X", "O"});

	int scoringSum = 0;
	for(String score : scoring) {
		if(score.equals("O")) {
			scoringSum += 10;
		}
	}
		

/*
    생년월일을 기준으로 나이 구하기 
*/

	String birthDay = "20010820";
	
	String yearString = birthDay.substring(0, 4);
	
	int year = Integer.parseInt(yearString);
	
	int age = 2021 - year + 1;

%>

	<h1>점수 평균은 <%=sum/5.0%> 입니다.</h1>
	
	<h1>체점 결과는 <%=scoringSum %>점 입니다.</h1>
	
	<h1>1에서 50까지의 합은 <%=allSum(30)%> </h1>

	<h1><%=birthDay%> 의 나이는 <%=age %>살 입니다.  </h1>
	
	
</body>
</html>