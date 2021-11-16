package bbs;

import java.sql.*;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "tjdwls12!@";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String sql = "SELECT NOW()";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				return rs.getString(1); // 현재의 날짜 반환
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";

		try {
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

	public int write(String bbsTitle, String userID, String bbsContent) {
		String sql = "INSERT INTO BBS VALUES(?,?,?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			rs = pstmt.executeQuery();
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
