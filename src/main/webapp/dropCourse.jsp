<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="lecturePlan.LecturePlan" %>
<%@ page import="lecturePlan.LecturePlanDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="courseList.CourseList" %>
<%@ page import="courseList.CourseListDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 웹사이트</title>
</head>
<body>
	<% // 신청목록 -> 수강취소를 위한 화면
		String userCode = null;
		if(session.getAttribute("userCode") != null){
			userCode = (String) session.getAttribute("userCode");
		}
		if(userCode == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			try {
				int classCode = Integer.parseInt(request.getParameter("classCode"));
				
				CourseListDAO courseListDAO = new CourseListDAO();
				
				int result = courseListDAO.delete(classCode);
//				System.out.println(classCode);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수강 취소에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수강 취소가 완료되었습니다.')");
					script.println("location.href = 'courseList.jsp'");
					script.println("</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	%>
</body>
</body>
</html>