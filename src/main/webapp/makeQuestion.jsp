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
        <div class="row">
            <form method="post" action="questionAction.jsp">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                    <thead>
                        <tr>
                            <th colspan="2" style="background-color: #eeeeee; text-align: center;">연습문제 생성</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="문제1" name="questionA" maxlength="300"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="답1" name="solutionA" maxlength="200"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="문제2" name="questionB" maxlength="300"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="답2" name="solutionB" maxlength="200"></td>
                        </tr>
                         <tr>
                            <td><input type="text" class="form-control" placeholder="문제3" name="questionC" maxlength="300"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="답3" name="solutionC" maxlength="200"></td>
                        </tr>
                       <tr>
                            <td><input type="text" class="form-control" placeholder="문제4" name="questionD" maxlength="300"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="답4" name="solutionD" maxlength="200"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="문제5" name="questionE" maxlength="300"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="답5" name="solutionE" maxlength="200"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="문제6" name="questionF" maxlength="300"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="답6" name="solutionF" maxlength="200"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="문제7" name="questionG" maxlength="300"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="답7" name="solutionG" maxlength="200"></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-primary pull-right" value="작성">
            </form>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>