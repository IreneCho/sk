<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		//out.print("driver load success");
	}catch(Exception ex){
		out.print(ex.getMessage() );
	}
	Connection conn = null;
	Statement stmt = null;
	String mysqlURL ="jdbc:mysql://localhost:3306/test";
	String user ="root";
	String pass = "1234";
	String sql="select * from student";
	ResultSet rs;
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		String name ="";
		int age=0;
		String myresult="";
		while( rs.next()){
			name = rs.getString("name");
			age = rs.getInt("age");
			myresult +="이름:"+name+" 나이:"+age;
		}
		rs.close();
		out.print( myresult );
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>
