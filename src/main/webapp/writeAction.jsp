<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lecturePlan.LecturePlan" %>
<%@ page import="lecturePlan.LecturePlanDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Enumeration"%>
<% request.setCharacterEncoding("UTF-8"); %>

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
<title>JSP 게시판 웹사이트</title>
</head>
<body>

	<%
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
			if(lecturePlan.getClassName() == null || lecturePlan.getProfessorName() == null
					|| lecturePlan.getPhoneNumber() == null || lecturePlan.getLaboratory() == null
					|| lecturePlan.getCredit() == null || lecturePlan.getCourse() == null
					|| lecturePlan.getLectureOverview() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				LecturePlanDAO lecturePlanDAO = new LecturePlanDAO();
				int result = lecturePlanDAO.write(lecturePlan.getClassName(), lecturePlan.getProfessorName()
						, lecturePlan.getPhoneNumber(), lecturePlan.getLaboratory(), lecturePlan.getCredit()
						, lecturePlan.getCourse(), lecturePlan.getLectureOverview(), lecturePlan.getNote());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'lecturePlan.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>