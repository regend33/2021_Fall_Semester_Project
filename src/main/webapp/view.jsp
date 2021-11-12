<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="lecturePlan.LecturePlan" %>
<%@ page import="lecturePlan.LecturePlanDAO" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
<title>교육 시스템 웹 사이트</title>
</head>
<body>
	<%
		String userCode = null;
		if(session.getAttribute("userCode") != null){
			userCode = (String) session.getAttribute("userCode");
		}
		int classCode = 0;
		if (request.getParameter("classCode") != null){
			classCode = Integer.parseInt(request.getParameter("classCode"));
		}
		if (classCode == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href= 'lecturePlan.jsp'");
			script.println("</script>");
		}
		LecturePlan lecturePlan = new LecturePlanDAO().getLecturePlan(classCode);
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
  	  			<li class="active"><a href="registerCourse.jsp">수강신청</a></li>
   	 			<li class="active"><a href="courseList.jsp">신청목록</a>
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
						<th colspan="3" style="background-color: #eeeeee; text-align: center;"> 강의계획서 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>강의코드 </td>
						<td colspan="2"><%= lecturePlan.getClassCode() %></td>
					</tr>
					<tr>
						<td>강의명 </td>
						<td colspan="2"><%= lecturePlan.getClassName() %></td>
					</tr>
					<tr>
						<td>교수명</td>
						<td colspan="2"><%= lecturePlan.getProfessorName() %></td>
					</tr>
					<tr>
						<td>휴대 전화</td>
						<td colspan="2"><%= lecturePlan.getPhoneNumber() %></td>			
					<tr>
						<td>연구실</td>
						<td colspan="2"><%= lecturePlan.getLaboratory() %></td>
					</tr>
					<tr>
						<td>학점</td>
						<td colspan="2"><%= lecturePlan.getCredit() %></td>
					</tr>
					<tr>
						<td>이수구분</td>
						<td colspan="2"><%= lecturePlan.getCourse() %></td>
					</tr>
					<tr>
						<td>강의개요</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= lecturePlan.getLectureOverview() %></td>
					</tr>
					<tr>
						<td>비고</td>
						<td colspan="2"><%= lecturePlan.getNote() %></td>
					</tr>
				</tbody>
			</table>
			<a href="lecturePlan.jsp" class="btn btn-primary">목록</a>
			<%
				if(userCode != null){ //&& userCode.equals(lecturePlan.getUserCode())
			%>	
				<a href="update.jsp?classCode=<%= classCode %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?classCode=<%= classCode %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
</body>
</html>