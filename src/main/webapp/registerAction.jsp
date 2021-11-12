<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="lecturePlan.LecturePlan" %>
<%@ page import="lecturePlan.LecturePlanDAO" %>
<%@ page import="courseList.CourseList" %>
<%@ page import="courseList.CourseListDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Enumeration"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="courseList" class="courseList.CourseList" scope="page" />
<jsp:setProperty name="courseList" property="classCode" />
<jsp:setProperty name="courseList" property="className" />
<jsp:setProperty name="courseList" property="professorName" />
<jsp:setProperty name="courseList" property="phoneNumber" />
<jsp:setProperty name="courseList" property="laboratory" />
<jsp:setProperty name="courseList" property="credit" />
<jsp:setProperty name="courseList" property="course" />
<jsp:setProperty name="courseList" property="lectureOverview" />
<jsp:setProperty name="courseList" property="note" />

<jsp:useBean id="lecturePlan" class="lecturePlan.LecturePlan" scope="page" />
<jsp:setProperty name="lecturePlan" property="classCode" />
<jsp:setProperty name="lecturePlan" property="className" />
<jsp:setProperty name="lecturePlan" property="professorName" />
<jsp:setProperty name="lecturePlan" property="phoneNumber" />
<jsp:setProperty name="lecturePlan" property="laboratory" />
<jsp:setProperty name="lecturePlan" property="credit" />
<jsp:setProperty name="lecturePlan" property="course" />
<jsp:setProperty name="lecturePlan" property="lectureOverview" />
<jsp:setProperty name="lecturePlan" property="note" />
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
				LecturePlanDAO lecturePlanDAO = new LecturePlanDAO();
								
				LecturePlan lecture = lecturePlanDAO.getLecturePlan(classCode);
				
				int result = courseListDAO.success(lecture);

				PrintWriter script = response.getWriter();
				if(lecture == null){
					script.println("<script>");
					script.println("alert('수강신청에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else if (result == -1) {
					script.println("<script>");
					script.println("alert('이미 수강 완료된 과목입니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println("alert('수강신청 완료되었습니다.')");
					script.println("location.href= 'registerCourse.jsp'");
					script.println("</script>");
				}
			} catch (Exception e) {
	            e.printStackTrace();
			}
		}
    }
	%>
</body>
</html>