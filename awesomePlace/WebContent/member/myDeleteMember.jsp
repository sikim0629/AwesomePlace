<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("id");

	MemberDAO member = new MemberDAO();
		member.delete(a);
	
	int code = member.delete(a);
	Cookie user = new Cookie("id", "");
	user.setMaxAge(0);
	response.addCookie(user);//세션의 모든 속성 제거
	
	if(code == 1){
		out.print("회원탈퇴 완료");
		response.sendRedirect("/main.jsp");
	}else{
		response.sendRedirect("/main.jsp");
	}
%>