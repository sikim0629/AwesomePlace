<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/header.jsp"%>

	<%
		ArrayList<BoardObj> boards = (new BoardDAO()).getList();
	%>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (BoardObj borad : boards) {
			%>
			<tr>
				<th scope="row"><%=borad.getBid() %></th>
				<td><%=borad.getBtitle() %></td>
				<td><%=borad.getBcontent() %></td>
				<td><%=borad.getBdate() %></td>
				<td><a href="#" role="button">상세정보 &raquo;</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<%@ include file="/footer.jsp"%>
</body>
</html>