package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.ConnectionPool;

public class NewBoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public NewBoardDAO() {
		try {
			conn = ConnectionPool.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String sql = "SELECT NOW()";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String sql = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
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

	public int insert(String title, String userID, String content) {
		String sql = "INSERT INTO bbs VALUE (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, title); 
			pstmt.setString(3, userID); 
			pstmt.setString(4, getDate()); 
			pstmt.setString(5, content); 
			pstmt.setInt(6, 1);

			rs = pstmt.executeQuery();
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;

	}
}
