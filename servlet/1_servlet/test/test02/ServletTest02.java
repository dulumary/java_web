package com.test.servlet.urlmapping1;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletTest02 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 현재 시간은 15시 5분 23초 입니다. 
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("현재시간은 H시 m분 s초 입니다.");
		
		String dateString = formatter.format(now);
		
		out.print(dateString);
		
	}

}
