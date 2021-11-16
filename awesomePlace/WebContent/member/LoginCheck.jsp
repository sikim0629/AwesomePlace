<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cid = request.getParameter("id");
	String cpass = request.getParameter("pass");
	
	MemberDAO dao = new MemberDAO();
	int code = dao.login(cid, cpass);
	
	if(code == 1){
		response.sendRedirect("/Join.jsp");
	}else if(code == 2){
		response.sendRedirect("/Login.jsp");
	}else{
		Cookie user = new Cookie("id",cid);
		response.addCookie(user);
		response.sendRedirect("/main.jsp");
	}

%>