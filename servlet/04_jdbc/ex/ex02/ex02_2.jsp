<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 리스트</title>
</head>
<body>

<%
	//db 연결
	MysqlService mysqlService = MysqlService.getInstance();
	mysqlService.connection();
	
	String query = "select * from `new_user`";
	
	ResultSet resultSet = mysqlService.select(query);
%>

	<form method="post" action="/db/ex02_insert">
		<p>
			<strong>이름</strong>
			<input type="text" name="name"><br>
		</p>
		
		<p>
			<strong>생년월일</strong>
			<input type="text" name="yyyymmdd"><br>
		</p>
		
		<p>
			<strong>자기소개</strong><br>
			<textarea rows="5" cols="50" name="introduce"></textarea><br>
		</p>
		
		<p>
			<strong>이메일</strong>
			<input type="text" name="email"><br>
		</p>
		
		<p>
			<input type="submit" value="추가">
		</p>
	</form>

</body>
</html>