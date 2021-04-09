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

	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>자기소개</th>
				<th>이메일</th>
				<th>삭제</th>
			</tr>
			
		</thead>
		<%
			while(resultSet.next()) {
		%>
			
			<tr>
				<td><%=resultSet.getInt("id")%></td>
				<td><%=resultSet.getString("name")%></td>
				<td><%=resultSet.getString("yyyymmdd")%></td>
				<td><%=resultSet.getString("introduce")%></td>
				<td><%=resultSet.getString("email")%></td>
				<td><a href="/db/ex02_delete?id=<%=resultSet.getInt("id")%>">삭제</a></td>
			</tr>
			
		<%
			}
		%>
		
		<tbody>
			
		</tbody>
	
	</table>

</body>
</html>