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
	String mysqlURL ="jdbc:mysql://localhost:3306/world";
	String user ="root";
	String pass = "1234";
	String sql="select * from board";
	ResultSet rs;
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		String name="";
		String contents="";
		String date="";
//		String myresult="";
		
		JSONArray arr = new JSONArray();
		while( rs.next()){
			JSONObject jo = new JSONObject();
			
			name = rs.getString("name");
			contents = rs.getString("contents");
			date = rs.getString("date");	
			
			jo.put("name",name);
			jo.put("contents",contents);
			jo.put("date",date);
			arr.add(jo);	
		}
		rs.close();
		out.print(arr.toJSONString());
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>
