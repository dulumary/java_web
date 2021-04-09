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

@WebServlet("/db/test01")
public class ServletDBTest01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connection();
		
		String query = "insert into `real_estate` (`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`, `createdAt`, `updatedAt`)" 
				+ "(3, 헤라펠리스 101동 5305호, 350, 매매,1500000, NULL, now(), now())";
		
		try {
			mysqlService.update(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		query = "select * from `real_estate` order by id desc limit 10;";
		
		
		try {
			ResultSet result = mysqlService.select(query);
			
			while(result.next()) {
				out.print("매물 주소 : " + result.getString("address"));
				out.print(", 면적 : " + result.getInt("area"));
				out.println(", 타입 : " + result.getString("type"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	

}
