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
	
	// ����ٰ� DB�� ����Ǿ��ִ� �����䱸���� ������ �а��ڵ带 �����ؼ� ��������
	// ����� �����غ���
	
}
