<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecturePlan.LecturePlan" %>
<%@ page import="lecturePlan.LecturePlanDAO" %>
<%@ page import= "user.User" %>
<%@ page import= "user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
<title>교육 시스템 웹 사이트</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();

		String userCode = null;
		if(session.getAttribute("userCode") != null){
			userCode = (String) session.getAttribute("userCode");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
 	<nav class="navbar navbar-default">
 		<div class="navbar-header">
 			<button type="button" class="navbar-toggle collapsed" 
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
   	 	 		<span class="icon-bar"></span>
     			<span class="icon-bar"></span>
     			<span class="icon-bar"></span>
    		</button>
			<a class="navbar-brand" href="main.jsp">교육 시스템 웹 사이트</a>
  		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
  	  			<li><a href="registerCourse.jsp">수강신청</a></li>
   	 			<li><a href="courseList.jsp">신청목록</a></li>
    			<li class="active"><a href="lecturePlan.jsp">강의개설</a></li>
    			<li><a href="#">문제풀이</a></li>
    			<li><a href="#">결과확인</a></li>    			
    			<li><a href="makeQuestion.jsp">문제개설</a></li>
   			</ul>
   <%
		if(userCode == null){
   %>
   		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
      				data-toggle="dropdown" role="button" aria-haspopup="true"
      				aria-expanded="false">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="joinSelect.jsp">회원가입</a></li>
				</ul>
			</li>
		</ul>
   <%
   		} else {
   %>
   		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
      				data-toggle="dropdown" role="button" aria-haspopup="true"
      				aria-expanded="false">회원관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
			</li>
		</ul>
 		<%
 			}
   		%>
		</div> 
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px-solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">개설 목록</th>
					</tr>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">강의 코드</th>
						<th style="background-color: #eeeeee; text-align: center;">강의명</th>
						<th style="background-color: #eeeeee; text-align: center;">교수명</th>
						<th style="background-color: #eeeeee; text-align: center;">이수구분</th>
						<th style="background-color: #eeeeee; text-align: center;">학점</th>
					</tr>
				</thead>
				<tbody>
					<%
						LecturePlanDAO lecturePlanDAO = new LecturePlanDAO();
						ArrayList<LecturePlan> list = lecturePlanDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){							
					%>
					<tr>
						<td><%= list.get(i).getClassCode() %>
						<td><a href="view.jsp?classCode=<%= list.get(i).getClassCode() %>"><%= list.get(i).getClassName() %></a></td>
						<td><%= list.get(i).getProfessorName() %></td>
						<td><%= list.get(i).getCourse() %></td>
						<td><%= list.get(i).getCredit() %></td>
					</tr>					
					<%
						}	
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="lecturePlan.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(lecturePlanDAO.nextPage(pageNumber + 1)){
			%>
				<a href="lecturePlan.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			
<!-- 			<%
//			System.out.println(userJob);
//				if(userCode == null){	
			%>
			<div>
				<p style="font-size: 20px; color: black;" align="right"> * 강의를 개설하시려면 로그인을 해주세요. </p>
			</div>
			<%			
//				} if (userCode != null && userJob == 1){
			%>
				<a href="write.jsp" class="btn btn-primary pull-right">강의 개설</a>
			<%
//				} if (userCode != null && userJob == 2) {
			%>
				<p style="font-size: 20px; color: black;" align="right"> * 강의 개설은 교수님만 가능합니다. </p>
			<%
//				}
			%>
	<div class="row">
			<p style="font-size:15px; color: red;"> * 강의명을 클릭하면 강의 정보를 확인하실 수 있습니다. </p>
	</div>
	 -->
	</div>
		<a href="write.jsp" class="btn btn-primary pull-right">강의 개설</a>
</div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
</body>
</html>