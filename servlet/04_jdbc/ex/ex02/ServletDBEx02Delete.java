package com.test.servlet.db;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/ex02_delete")
public class ServletDBEx02Delete extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String deleteIdString = request.getParameter("id");
		
		int deleteId = Integer.parseInt(deleteIdString);
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connection();
		
		String query = "delete from `new_user` where id=" + deleteId + ";";
		
		try {
			mysqlService.update(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		mysqlService.disconnect();
		
		response.sendRedirect("/db/ex02_1.jsp");
	}

}
