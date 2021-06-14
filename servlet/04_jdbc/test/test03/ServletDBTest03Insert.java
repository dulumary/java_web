package com.test.servlet.db;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/test03/insert")
public class ServletDBTest03Insert extends HttpServlet{
	
	
	@Override 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String sellerId = request.getParameter("sellerId");
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		String imageUrl = request.getParameter("imageUrl");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connection();
		
		String query = "INSERT INTO `used_goods` (`title`, `price`,`description`,  `picture`, `sellerId`)"
				+ " VALUES ('" + title + "', '" + price + "', '" + description + "', '" + imageUrl + "', '" + sellerId + "')";
		
		try {
			mysqlService.update(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/db/test03/test03_1.jsp");
		
	}
	

}
