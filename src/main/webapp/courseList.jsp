<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="lecturePlan.LecturePlan" %>
<%@ page import="lecturePlan.LecturePlanDAO" %>
<%@ page import="courseList.CourseList" %>
<%@ page import="courseList.CourseListDAO" %>
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
   	 			<li class="active"><a href="courseList.jsp">신청목록</a>
    			<li><a href="lecturePlan.jsp">강의개설</a></li>
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
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">교필</th>
                        <th style="background-color: #eeeeee; text-align: center;">교선</th>
                        <th style="background-color: #eeeeee; text-align: center;">전필</th>
                        <th style="background-color: #eeeeee; text-align: center;">전선</th>
                        <th style="background-color: #eeeeee; text-align: center;">공학기초</th>
                        <th style="background-color: #eeeeee; text-align: center;">합계</th> 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>11</td>
                        <td>6</td>
                        <td>33</td>
                        <td>39</td>
                        <td>30</td>
                        <td>132</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px-solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">강의코드</th>
						<th style="background-color: #eeeeee; text-align: center;">강의명</th>
						<th style="background-color: #eeeeee; text-align: center;">교수명</th>
						<th style="background-color: #eeeeee; text-align: center;">이수구분</th>
						<th style="background-color: #eeeeee; text-align: center;">학점</th>
						<th style="background-color: #eeeeee; text-align: center;">수강취소</th>
					</tr>
				</thead>
				<tbody>
					<%
						CourseListDAO courseListDAO = new CourseListDAO();
						ArrayList<CourseList> list3 = courseListDAO.getList(pageNumber);
						for(int i = 0; i < list3.size(); i++){							
					%>
					<tr>
						<!-- 주석처리 부분은 페이지 해킹 방지용 간단한 코드
						.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")  --> 
						<td><%= list3.get(i).getClassCode() %></td>
						<td><a href="view.jsp?classCode=<%= list3.get(i).getClassCode() %>"><%=list3.get(i).getClassName() %></a></td>
						<td><%= list3.get(i).getProfessorName() %></td>
						<td><%= list3.get(i).getCourse() %></td>
						<td><%= list3.get(i).getCredit() %></td>
						<td><a href="dropCourse.jsp?classCode=<%= list3.get(i).getClassCode() %>" class="btn btn-primary center">수강취소</a></td>
					</tr>					
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(courseListDAO.nextPage(pageNumber + 1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
		</div>
		<div class="row">
			<p style="font-size:15px; color: red;"> * 강의명을 클릭하면 강의 정보를 확인하실 수 있습니다.
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
</body>
</html>