<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%
	List<Map<String, String>> list = new ArrayList<>();

	Map<String, String> map = new HashMap<String, String>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", "4.3"); } };
	list.add(map);
	map = new HashMap<String, String>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", "3.8"); } };
	list.add(map);
	map = new HashMap<String, String>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", "4.1"); } };
	list.add(map);
	map = new HashMap<String, String>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", "4.5"); } };
	list.add(map);
	map = new HashMap<String, String>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", "3.8"); } };
	list.add(map);
	map = new HashMap<String, String>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", "4.2"); } };
	list.add(map);
	map = new HashMap<String, String>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", "4.3"); } };
	list.add(map);
	
	String keyword = request.getParameter("menu");
	
	boolean starPointLimit = false;
	if(request.getParameter("starPointFilter") != null) {
		starPointLimit = true;	
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
	<title>배탈의 민족</title>
	
</head>
<body>
	<div class="container">
		<h1 class="text-center mt-4"> 검색 결과  </h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>메뉴</th>
					<th>상호</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody>
		<%
			for(Map<String, String> item : list) {
				if(item.get("menu").equals(keyword)) {
					double point = Double.parseDouble(item.get("point"));
					if(starPointLimit && point < 4) {
						continue;
					}
		%>
		<tr>
			<td><%=item.get("menu") %></td>
			<td><%=item.get("name") %></td>
			<td><%=item.get("point") %></td>
		</tr>
		<%
				}
			}
		%>
			</tbody>
		</table>
	</div>

</body>
</html>