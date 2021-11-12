package creditCount;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class CreditCountDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public CreditCountDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?useSSL=false&serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
			String dbID = "BBS";
			String dbPassword = "1111";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 여기다가 DB에 저장되어있는 졸업요구조건 학점을 학과코드를 구별해서 가져오는
	// 방법을 생각해보자
	
}
