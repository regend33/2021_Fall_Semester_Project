<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">교육 시스템 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
  	  			<li><a href="registerCourse.jsp">수강신청</a></li>
   	 			<li><a href="courseList.jsp">신청목록</a>
    			<li><a href="lecturePlan.jsp">강의개설</a></li>
    			<li><a href="#">문제풀이</a></li>
    			<li><a href="#">결과확인</a></li>    			
    			<li><a href="makeQuestion.jsp">문제개설</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="joinSelect.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction_Prof.jsp">
					<h3 style="text-align: center;">회원가입(교수)</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="사번" name="userCode" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소" name="userAddress" maxlength="80">
					</div>
					<div class="form-group">
						<select name="major" class="form-control">
							<option value="false">학과를 선택해주세요.</option>
							<option value="0x0111">컴퓨터공학과</option>
							<option value="0x0112">도시공학과</option>
							<option value="0x0113">건축학과</option>
							<option value="0x0114">전자공학과</option>
						</select>
					</div>					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="휴대전화" name="userPhoneNumber" maxlength="50">
					</div>	
					<div class="form-group" style="text-align: center;">
						<input type="submit" class="btn btn-primary form-group" value="회원가입"> <input class="btn btn-primary form-group" onClick="history.back()" value="돌아가기"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>