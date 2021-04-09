package com.test.servlet.get;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class ServletEx03 extends HttpServlet {
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		
		response.setCharacterEncoding("utf-8");
		
//		response.setContentType("text/html");
		
		response.setContentType("application/json");
		
		String id = (String) request.getParameter("user_id");
		String name = (String) request.getParameter("name");
		Integer age = Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
//		out.println("<html><head><title>get url</title></head> <body>");
//		out.println("<h1>user_id: " + id + "</h1>");
//		out.println("<h2>name: " + name + "</h2>");
//		out.println("<h3>age: " + age + "</h3>");
//		out.println("</body></html>");
		
		// JSON(JavaScript Object Notation)으로 response 구성하기
		// {"user_id":"marobiana", "name":"신보람", "age":25}
		
		// 크롬 브라우저 확장프로그램 JSONView 설치
		out.print("{\"user_id\":\"" + id + "\", \"name\":\"" + name + "\", \"age\":" + age + "}");
	}
}