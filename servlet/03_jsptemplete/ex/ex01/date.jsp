<%@ page pageEncoding="UTF-8"%> <%-- pageEncoding: 현재 jsp page의 인코딩 방식 지정 --%>
<%@ page import="java.util.Calendar" %>
<p>
	현재 시간: <%= Calendar.getInstance().getTime() %>
</p>