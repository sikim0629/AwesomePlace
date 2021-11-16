<%@ page import="dao.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>awesome coffee</title>
</head>
<body>
<!-- header -->

<jsp:include page = "/header.jsp" />

<!-- title로 넘겨받아서 뿌려줍니다. 커피는 mtitle 1 -->
<%
	ArrayList<MenuObj> menus = (new MenuDAO()).getList("1");
%>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">AWESOME COFFEE</h1>
      </div>
    </div>
        <br>
      <img src="/resource/images/menu/coffee/coffee.jpg">
  </section>

  <div class="album py-5 bg-light" align="center">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<%
				for (MenuObj menu : menus){
			%>
        <div class="col">
 			<div class="card" style="width: 20rem;">
			  <img src="/resource/images/menu/coffee/<%=menu.getMfile() %>" class="card-img-top">
			  <div class="card-body">
  		    	 <ul class="list-group list-group-flush">
			    	<h2 class="card-title" align="center"><%=menu.getMname() %></h2>

	    	     	<li class="list-group-item"><%=menu.getMdescription() %></li>
			     	<li class="list-group-item" align="right"><%=menu.getMprice() %> 원</li>
				 </ul>
			</div>
          </div>
        </div>
        <%} %>

        
      </div>
    </div>
   </div>
<%@ include file = "/footer.jsp" %>
</body>
</html>