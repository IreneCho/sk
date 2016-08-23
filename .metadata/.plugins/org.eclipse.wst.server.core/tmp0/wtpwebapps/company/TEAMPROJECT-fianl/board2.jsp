<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		out.print("driver load success");
	}catch(Exception ex){
		out.print(ex.getMessage() );
	}
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String mysqlURL ="jdbc:mysql://localhost:3306/world";
	String user ="root";
	String pass = "1234";
	//String sql="insert into student(name, age) values('ȫ�浿',30)";
	String sql="insert into board(name,contents,date) values(?,?,?)";
	
	//String mynum = request.getParameter("number");
	String myname = request.getParameter("name");
	String mycon = request.getParameter("contents");
	String mydate = request.getParameter("date");
	//int number = Integer.parseInt(mynum);
	try{
		conn = DriverManager.getConnection(mysqlURL, user, pass);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, myname);
		pstmt.setString(2, mycon);
		pstmt.setString(3, mydate);
		//stmt = conn.createStatement();
		//stmt.execute(sql);
		pstmt.execute();
		System.out.println("Insert success");
	//	out.print("insert success");
	}catch( Exception ex){
		out.print(ex.getMessage() );
	}
	conn.close();

%>












