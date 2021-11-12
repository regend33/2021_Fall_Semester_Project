package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int login(String userCode, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userCode = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 틀림
				}
				return -1; // 없는 아이디
				} catch (Exception e) {
					e.printStackTrace();
				} 
			return -2; // 데이터베이스 오류
		}
	

	public int join_Prof(User user) { // 교수 회원가입
		String SQL = "INSERT INTO USER VALUES (? ,? ,? ,? ,?, ?, ?, ?)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserCode());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserAddress());
			pstmt.setString(5, user.getMajor());
			pstmt.setString(6, user.getUserEmail());
			pstmt.setString(7, user.getUserPhoneNumber());
			pstmt.setString(8, "A");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int join_Stud(User user) { // 학생 회원가입
		String SQL = "INSERT INTO USER VALUES (? ,? ,? ,? ,?, ?, ?, ?)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserCode());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserAddress());
			pstmt.setString(5, user.getMajor());
			pstmt.setString(6, user.getUserEmail());
			pstmt.setString(7, user.getUserPhoneNumber());
			pstmt.setString(8, "B");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
	