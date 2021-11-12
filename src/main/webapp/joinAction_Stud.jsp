<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userCode" />
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userMajor" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPhoneNumber" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<%
		String userCode = null;
		if(session.getAttribute("userCode") != null){
			userCode = (String) session.getAttribute("userCode");
		}
		if(userCode != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다..')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if (user.getUserCode() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserAddress() == null|| user.getMajor() == null || user.getUserEmail() == null 
			|| user.getUserPhoneNumber() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join_Stud(user);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입이 완료되었습니다.')");
				script.println("</script>");
				if(result == -1){
					script.println("<script>");
					script.println("alert('이미 가입되어 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					session.setAttribute("userCode", user.getUserCode());
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
			}
	%>
</body>
</body>
</html>