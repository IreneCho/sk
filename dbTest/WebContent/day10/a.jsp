<%@ page language="java" import="org.json.simple.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String myname = request.getParameter("myname");
	String myage = request.getParameter("myage");
	
/*	JSONArray arr = new JSONArray();
	
	JSONObject jo = new JSONObject();
	jo.put("name","aaa");
	jo.put("age",30);
	
	JSONObject jo1 = new JSONObject();
	jo1.put("name","bbb");
	jo1.put("age",20);
	
	arr.add(jo);
	arr.add(jo1);
	
	out.print(arr.toJSONString());
	
 	out.print("<div>헬로</div>");  */
	out.print("<h1>" + "이름: " + myname + "나이: " + myage + "</h1>"); 
%>