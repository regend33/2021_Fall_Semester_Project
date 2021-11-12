<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="//cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
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
            <form method="post" action="writeAction.jsp">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                    <thead>
                        <tr>
                            <th colspan="2" style="background-color: #eeeeee; text-align: center;">강의 개설</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="강의명" name="className" maxlength="50"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="교수명" name="professorName" maxlength="50"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="휴대전화" name="phoneNumber" maxlength="50"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="연구실" name="laboratory" maxlength="50"></td>
                        </tr>
                         <tr>
                            <td>
                            	<select name="credit" class="form-control">
                            		<option value="false">학점 선택(필수)</option>
                            		<option value="2">2</option>
                            		<option value="3">3</option>
                            		<option value="P">P</option>
                            	</select>
                            </td>
                        </tr>
                        <!-- 이 사이에 전필/전선 선택목록 만들기 -->
                        <tr>
                            <td>
                            	<select name="course" class="form-control">
                            		<option value="false">이수 구분(필수)</option>
                            		<option value="전필">전필</option>
                            		<option value="전선">전선</option>
                            		<option value="교필">교필</option>
                            		<option value="교선">교선</option>
                            		<option value="MSC">MSC</option>
                            	</select>
                            </td>
                        </tr>
                        <!-- 이 사이에 전필/전선 선택목록 만들기 -->
                        <tr>
                            <td><textarea class="form-control" contenteditable="true" placeholder="강의 개요" name="lectureOverview" maxlength="2048" style="height: 350px;"></textarea>
                            <script type="text/javascript">
                            	CKEDITOR.replace('lectureOverview', {height: 500});
                            	CKEDITOR.replace('#editor', {extraPlugins: 'confighelper'});
                            </script>
                            </td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="form-control" placeholder="비고" name="note" maxlength="100"></td>
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