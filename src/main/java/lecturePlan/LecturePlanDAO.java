package lecturePlan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import util.DatabaseUtil;

public class LecturePlanDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getNext() {
		String SQL = "SELECT classCode FROM lecturePlan";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String className, String professorName, String phoneNumber, String laboratory, String credit,
					String course, String lectureOverview, String note) {
		String SQL = "INSERT INTO lecturePlan VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, className);
			pstmt.setString(3, professorName);
			pstmt.setString(4, phoneNumber);
			pstmt.setString(5, laboratory);
			pstmt.setString(6, credit);
			pstmt.setString(7, course);
			pstmt.setString(8, lectureOverview);
			pstmt.setString(9, note);
			pstmt.setInt(10, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<LecturePlan> getList(int pageNumber){
		String SQL = "SELECT * FROM lecturePlan WHERE bbsAvailable = 1 ORDER BY classCode DESC LIMIT 10";
		ArrayList<LecturePlan> list = new ArrayList<LecturePlan>();
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			/* pstmt.setInt(1, getNext() - (pageNumber -1) * 10); */
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LecturePlan lecturePlan = new LecturePlan();
				lecturePlan.setClassCode(rs.getInt(1));
				lecturePlan.setClassName(rs.getString(2));
				lecturePlan.setProfessorName(rs.getString(3));
				lecturePlan.setPhoneNumber(rs.getString(4));
				lecturePlan.setLaboratory(rs.getString(5));
				lecturePlan.setCredit(rs.getString(6));
				lecturePlan.setCourse(rs.getString(7));
				lecturePlan.setLectureOverview(rs.getString(8));
				lecturePlan.setNote(rs.getString(9));
				lecturePlan.setBbsAvailable(rs.getInt(10));
				list.add(lecturePlan);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM lecturePlan WHERE classCode < ? AND bbsAvailable = 1";
		try {
			conn = DatabaseUtil.getConnection(); 
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public LecturePlan getLecturePlan(int classCode) {
		String SQL = "SELECT * FROM lecturePlan WHERE classCode = ?";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, classCode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				LecturePlan lecturePlan = new LecturePlan();
				lecturePlan.setClassCode(rs.getInt(1));
				lecturePlan.setClassName(rs.getString(2));
				lecturePlan.setProfessorName(rs.getString(3));
				lecturePlan.setPhoneNumber(rs.getString(4));
				lecturePlan.setLaboratory(rs.getString(5));
				lecturePlan.setCredit(rs.getString(6));
				lecturePlan.setCourse(rs.getString(7));
				lecturePlan.setLectureOverview(rs.getString(8));
				lecturePlan.setNote(rs.getString(9));
				lecturePlan.setBbsAvailable(rs.getInt(10));
				return lecturePlan;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int classCode, String className, String professorName, String phoneNumber, 
						String laboratory, String credit, String course, String lectureOverview, String note) {
		String SQL = "UPDATE lecturePlan SET className = ?, professorName = ?, phoneNumber = ?, laboratory = ?, credit = ?, course = ?, lectureOverview = ?, note = ? WHERE classCode = ?";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, classCode);
			pstmt.setString(2, className);
			pstmt.setString(3, professorName);
			pstmt.setString(4, phoneNumber);
			pstmt.setString(5, laboratory);
			pstmt.setString(6, credit);
			pstmt.setString(7, course);
			pstmt.setString(8, lectureOverview);
			pstmt.setString(9, note);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
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
