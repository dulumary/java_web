package com.test.servlet.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/ex01")
public class ServletDBEx01 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connection();
		
		String query = "insert into `used_goods` (`title`, `price`, `description`, `storeId`)"
				+ "values ('고양이 간식 팝니다.', 2000, '저희 고양이가 입맛이 까다로워서 잘 안먹어요 ㅠ', 5)";
		
		
		try {
			mysqlService.update(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// select
		
		query = "select * from `used_goods`";
		
		try {
			ResultSet resultSet = mysqlService.select(query);
			
			PrintWriter out = response.getWriter();
			
			while(resultSet.next()) {
				out.println(resultSet.getInt("id"));
				out.println(resultSet.getString("title"));
				out.println(resultSet.getInt("price"));
				out.println(resultSet.getString("description"));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		mysqlService.disconnect();
	}

}
