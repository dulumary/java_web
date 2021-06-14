<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

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
<%@ include file="data.jsp" %>
<%	
	Map <String, Object> target = null;
	
	if(request.getParameter("id") != null) {
		Integer parameterId = Integer.parseInt(request.getParameter("id"));
		for(Map<String, Object> item : musicList) {
			Integer id = (Integer)item.get("id");
			if(id.equals(parameterId)) {
				target = item;
				break;
			}
		}
	}
	
	if(request.getParameter("search") != null) {
		String parameterSearch = request.getParameter("search");
		for(Map<String, Object> item : musicList) {
			String title = (String)item.get("title");
			if(title.equals(parameterSearch)) {
				target = item;
				break;
			}
		}
	}
%>

	<div id="wrap">
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />

        <%
       		if(target != null) {
        		Integer time = (Integer)target.get("time");
        %>
		
		<section class="mt-3 mb-5">
			<h4>곡 정보</h4>
            <div class="d-flex  border border-success p-3">
                <div class="music-info">
                    <img class="album-size" src="<%=target.get("thumbnail")%>">                
                </div>
                <div class="ml-4">
                    <div class="display-4"><%=target.get("title") %></div>
                    <div class="font-weight-bold text-success"><%=target.get("singer") %></div>
                    <div class="d-flex mt-3 music-info">
                        <div class="text-dark">
                            앨범 <br>
                            재생시간 <br>
                            작곡가 <br>
                            작사가
                        </div>
                        <div class="ml-4">
                            <%=target.get("album") %> <br>
                            <%=time / 60 %> : <%=time % 60 %><br>
                            <%=target.get("composer") %> <br>
                            <%=target.get("lyricist") %>
                        </div>
                    </div>
                </div>
            </div>
            <h4 class="mt-5">가사 </h4>
            <hr>
            <div>가사 정보 없음</div>
		</section>
		
		<% } else { %>
		<section class="mt-3 mb-5">
			<h1>정보 없음</h1>
		</section>
		<% } %>
		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>