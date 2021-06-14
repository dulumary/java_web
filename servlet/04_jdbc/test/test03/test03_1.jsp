<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멜롱-아이유</title>
		
		<link rel="stylesheet" href="style.css" type="text/css">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</head>
	<body>
	
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connection();
		
		// 모든 셀러 불러오기 
		String query = "SELECT seller.nickName, used_goods.title, used_goods.price, used_goods.picture"
						+ " FROM `seller` JOIN `used_goods` ON seller.id = used_goods.sellerId";
		ResultSet result = mysqlService.select(query);
	%>

	<div id="wrap">
		<jsp:include page="header.jsp" />
		
		<section class="mt-4 d-flex justify-content-center">
	        <div class="d-flex flex-wrap justify-content-between">
	        	<% while(result.next()) { %>
	            <div class="goods-box mb-3 ">
	                <div class="goods-image-box">
	                	<%if(result.getString("used_goods.picture") == null || result.getString("used_goods.picture").equals("")) { %>
	                	<div class="d-flex h-100 justify-content-center align-items-center">
                            <h4 class="text-secondary">이미지 없음</h4>
                        </div>
                        <% } else { %>
	                    <img class="w-100" src="<%= result.getString("used_goods.picture") %>">
	                    <% } %>
	                </div>
	                <div class="title mt-1"><%= result.getString("used_goods.title") %></div>
	                <div class="price mt-1"><%= result.getString("used_goods.price") %>원</div>
	                <div class="seller mt-1"><%= result.getString("seller.nickName") %></div>
	            </div>

	          <% } %>
	        </div>
        </section>
		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>