<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import= "user.User" %>
<%@ page import= "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css?ver=1">
<link rel="stylesheet" href="css/custom.css?ver=1">
<title>교육 시스템 웹 사이트</title>
</head>
<body>
	<%
		String userCode = null;
		if(session.getAttribute("userCode") != null){
			userCode = (String) session.getAttribute("userCode");
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
   	 			<li><a href="courseList.jsp">신청목록</a>
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
		<div class="jumbotron">
			<div class="container">
				<h1>교육 시스템 웹 사이트</h1>
				<p>융합컴퓨터미디어학부
				<p>
				<!-- 일단 주석처리
				<p><a class="btn btn-primary btn-pull" href="#" role="button">예시</a></p>
				-->
			</div>
		</div>
	</div>
<!-- 일단 주석처리(이미지 관련)
<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/mainImage.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>