<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%
	List<Map<String, String>> list = new ArrayList<>();

	Map<String, String> map = new HashMap<String, String>() {
		{ 
			put("id", "1000");
			put("title", "아몬드"); 
			put("author", "손원평"); 
			put("publisher", "창비");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/267/x9788936434267.jpg");
		} 
	};
	list.add(map);
	
	map = new HashMap<String, String>() {
		{ 
			put("id", "1001");
			put("title", "사피엔스"); 
			put("author", "유발 하라리"); 
			put("publisher", "김영사");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/464/x9788934972464.jpg");
		} 
	};
	list.add(map);
	
	map = new HashMap<String, String>() {
		{ 
			put("id", "1002");
			put("title", "코스모스"); 
			put("author", "칼 세이건"); 
			put("publisher", "사이언스북");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/892/x9788983711892.jpg");
		} 
	};
	list.add(map);
	
	map = new HashMap<String, String>() {
		{ 
			put("id", "1003");
			put("title", "나미야 잡화점의 기적"); 
			put("author", "히가시노 게이고"); 
			put("publisher", "현대문학");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/194/x9788972756194.jpg");
		} 
	};
	list.add(map);
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
  
	<title>교포 문고</title>
	
</head>
<body>
	<div class="container">
		<h1 class="text-center mt-4"> 책 목록 </h1>
		<table class="table text-center" style="height: 100px;">
			<thead>
				<tr class="row">
					<th class="col-1">id</th>
					<th class="col-2">표지</th>
					<th class="col-9">제목</th>
				</tr>
			</thead>
			<tbody>
		<%
			for(Map<String, String> item : list) {
				
		%>
		<tr class="row">
			<td class="col-1"><%=item.get("id") %></td>
			<td class="col-2"><img src="<%=item.get("image") %>" width=100></td>
			<td class="col-9 display-4"><a class="text-decoration-none" href="/jsp/test08_2.jsp?id=<%=item.get("id") %>"><%=item.get("title") %></a></td>
		</tr>
		<%
			}
		%>
			</tbody>
		</table>
	</div>

</body>
</html>