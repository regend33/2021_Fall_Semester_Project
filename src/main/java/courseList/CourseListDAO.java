package courseList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import lecturePlan.LecturePlan;
import util.DatabaseUtil;

public class CourseListDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


    public int getNext() {
        String SQL = "SELECT classCode FROM courseList ORDER BY classCode DESC";
        try {
        	conn = DatabaseUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

	public int success(LecturePlan lecturePlan) {
		String SQL_FOR_CHECK = "SELECT * FROM courseList WHERE classCode = ?";
        String SQL_FOR_INSERT = "INSERT courseList VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
        	conn = DatabaseUtil.getConnection();
        	PreparedStatement stmtForCheck = conn.prepareStatement(SQL_FOR_CHECK);
        	stmtForCheck.setInt(1, lecturePlan.getClassCode());
        	
        	ResultSet check = stmtForCheck.executeQuery();
      
        	if (!check.next()) {
                PreparedStatement pstmt = conn.prepareStatement(SQL_FOR_INSERT);
                
                pstmt.setInt(1, lecturePlan.getClassCode());
                pstmt.setString(2, lecturePlan.getClassName());
                pstmt.setString(3, lecturePlan.getProfessorName());
                pstmt.setString(4, lecturePlan.getPhoneNumber());
                pstmt.setString(5, lecturePlan.getLaboratory());
                pstmt.setString(6, lecturePlan.getCredit());
                pstmt.setString(7, lecturePlan.getCourse());
                pstmt.setString(8, lecturePlan.getLectureOverview());
                pstmt.setString(9, lecturePlan.getNote());
                pstmt.setString(10, lecturePlan.getUserCode());
                pstmt.setInt(11, lecturePlan.getBbsAvailable());
                
                pstmt.executeUpdate();
                pstmt.close();
                
        		return 1;
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<CourseList> getList(int pageNumber) {
        String SQL = "SELECT * FROM courseList WHERE classCode < ? AND bbsAvailable = 1 ORDER BY classCode DESC LIMIT 10";
        ArrayList<CourseList> list3 = new ArrayList<CourseList>();
        try {
        	conn = DatabaseUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CourseList courseList = new CourseList();
                courseList.setClassCode(rs.getInt(1));
                courseList.setClassName(rs.getString(2));
                courseList.setProfessorName(rs.getString(3));
                courseList.setPhoneNumber(rs.getString(4));
                courseList.setLaboratory(rs.getString(5));
                courseList.setCredit(rs.getString(6));
                courseList.setCourse(rs.getString(7));
                courseList.setLectureOverview(rs.getString(8));
                courseList.setNote(rs.getString(9));
                courseList.setBbsAvailable(rs.getInt(10));
                list3.add(courseList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list3;
    }

    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM courseList WHERE classCode < ? AND bbsAvailable = 1";
        try {
        	conn = DatabaseUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public CourseList getCourseList(int classCode) {
        String SQL = "SELECT * FROM courseList WHERE classCode = ?";
        try {
        	conn = DatabaseUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, classCode);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                CourseList courseList = new CourseList();
                courseList.setClassCode(rs.getInt(1));
                courseList.setClassName(rs.getString(2));
                courseList.setProfessorName(rs.getString(3));
                courseList.setPhoneNumber(rs.getString(4));
                courseList.setLaboratory(rs.getString(5));
                courseList.setCredit(rs.getString(6));
                courseList.setCourse(rs.getString(7));
                courseList.setLectureOverview(rs.getString(8));
                courseList.setNote(rs.getString(9));
                courseList.setBbsAvailable(rs.getInt(10));
                return courseList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int delete(int classCode) {
        String SQL = "DELETE FROM courseList WHERE classCode = ?";
        try {
        	conn = DatabaseUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, classCode);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
