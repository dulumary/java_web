package com.test.servlet.db;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.net.httpserver.HttpsServer;
import com.test.common.MysqlService;

@WebServlet("/db/test02_insert")
public class ServletDBTest02Insert extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connection();
		
		String query  = "insert into `favorite` (`name`, `url`, `createdAt`, `updatedAt`)"
				+ "value ('" + name + "', '" + url + "', now(), now());";
		
		try {
			mysqlService.update(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/db/test02_1.jsp");
		
	}

}
