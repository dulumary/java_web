# DB 연동

## 1. DB 서버 세팅

* MySQL을 다운로드 하여 Local 환경에 DB를 세팅한다.(Local을 DB 서버로 만든다.) - DB 강의 환경세팅 참고

## 2. 이클립스에서 DB를 사용할 수 있도록 연결

### 1) DB 연결 및 쿼리를 수행할 수 있는 라이브러리 추가

* `mysql-connector-java-8.x.xx.jar`를 다운받아 Libraries에 옮긴다.
  * `환경세팅 메뉴`의 5번 설명을 참조한다.

### 2) 라이브러리를 사용하여 DB 연결 정보를 코드에 작성

아래 코드를 작성한다.

```
package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	private static MysqlService mysqlService = null;
	
	private String url = "jdbc:mysql://localhost:3306/test";   // 도메인 뒤에 접속할 DB명까지 적는다.
	private String id = "root";
	private String pw = "marobiana"; // 본인이 설정한 비밀번호를 작성한다.

	private Connection conn = null;
	private Statement statement;
	private ResultSet res;
	
	// Singleton 패턴: MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인 패턴(DB 연결을 여러 객체에서 하지 않도록)
	public static MysqlService getInstance() {
		if (mysqlService == null) {
			mysqlService =  new MysqlService();
		}
		return mysqlService;
	}

	public void connection() {
		try {
			// 1. 드라이버 메모리에 로딩
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());

			// 2. DB connection
			conn = DriverManager.getConnection(this.url, this.id, this.pw);
			
			// 3. statement: DB와 쿼리를 실행하기 위한 준비
			statement = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			// 연결 끊기
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ResultSet select(String query) throws SQLException {
		res = statement.executeQuery(query);
		return res;
	}
	
	public void update(String query) throws SQLException {
		statement.executeUpdate(query);
	}
}
```

### 3) 연동이 잘 되었는지 테스트

```
@WebServlet("/db/test")
public class DatabaseConnectTest extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
	
		MysqlService mysqlService = MysqlService.getInstance(); // DB 연결을 위한 객체 생성(싱글턴이라 한개만 생성됨)
		mysqlService.connection(); // DB 연결
		
		//-- 쿼리 수행
		// select
		String selectQuery = "select * from used_goods";
		
		PrintWriter out = response.getWriter();
		ResultSet resultSet;
		try {
			resultSet = mysqlService.select(selectQuery);
			while (resultSet.next()) {  // 결과 행이 있는 동안 수행
				out.println(resultSet.getInt("id"));
				out.println(resultSet.getString("title"));
				out.println(resultSet.getInt("price"));
				out.println(resultSet.getString("description"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//-- 쿼리 끝
		
		mysqlService.disconnect(); // DB 연결 해제
	}
}
```

> 웹페이지 결과 화면
  
![db_connect](/material/images/marobiana/servlet/db_result.png)