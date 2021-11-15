<%@page import="dao.BoardDAO"%>
<%@page import="dao.BoardObj"%>
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
	<div class="alert alert-secondary" role="alert">
		<h1 class="display-3">게시판</h1>
	</div>
	<div class="bd-example">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>

				<%
					ArrayList<BoardObj> boards = (new BoardDAO()).getList();

				for (BoardObj board : boards) {
					int i = boards.size();
				%>

				<tr>
					<th scope="row"><%=i%></th>
					<td><a href="detailBoard.jsp?id=<%=board.getId()%>"><%=board.getTitle()%></a></td>
					<td><%=board.getMember()%></td>
					<td><%=board.getDate()%></td>
				</tr>


				<%
					}
				%>

			</tbody>
		</table>
		<button type="button" class="btn btn-outline-secondary btn-sm">
			<a href="/board/addBoard.jsp">글쓰기</a>
		</button>
	</div>
	<%@ include file="/footer.jsp"%>

</body>
</html>