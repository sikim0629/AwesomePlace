<%@page import="dao.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	PrintWriter writer = response.getWriter();
	String userId = null;
	
	if (session.getAttribute("id") != null) {
		userId = (String) session.getAttribute("id");
	}
	String cid = request.getParameter("id");
	String cpass = request.getParameter("pass");
	MemberDAO dao = new MemberDAO();
	int code = dao.login(cid, cpass);
	
	if(code == 1){
		writer.println("<script type='text/javascript'>");
		writer.println("alert('아이디가 존재하지 않습니다');");
		writer.println("location.href='main.jsp'");
		writer.println("</script>");
		response.sendRedirect("/member/Join.jsp");
		
	}else if(code == 2){
		writer.println("<script type='text/javascript'>");
		writer.println("alert('패스워드가 일치하지 않습니다');");
		writer.println("history.back();");
		writer.println("</script>");
		writer.flush();
		return;
	}else{
		session.setAttribute("id", cid);
		response.sendRedirect("/main.jsp");
	}

%>