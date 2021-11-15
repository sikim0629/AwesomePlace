package dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.*;
import util.ConnectionPool;

public class BoardDAO {

	public boolean insert(String title, String content, String filename) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String member = "admin";

		try {
			String sql = "INSERT INTO borad(btitle,bcontent,bmember,bfilename,bdate) VALUES(?,?,?,?,?)";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, member);
			stmt.setString(4, filename);
			stmt.setString(5, LocalDate.now().toString());

			int count = stmt.executeUpdate();

			return (count == 1) ? true : false;

		} finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}

	public ArrayList<BoardObj> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			ArrayList<BoardObj> board = new ArrayList<BoardObj>();

			while (rs.next()) {
				board.add(new BoardObj(rs.getString("bid"), rs.getString("btitle"), rs.getString("bcontent"),
						rs.getString("bmember"), rs.getString("bfilename"), rs.getString("bdate")));
			}

			return board;
		} finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
		}
	}

	public BoardObj getDetail(String bid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board WHERE bid = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, bid);
			rs = stmt.executeQuery();

			rs.next();

			String id = rs.getString(1);
			String title = rs.getString(2);
			String content = rs.getString(3);
			String member = rs.getString(4);
			String filename = rs.getString(5);
			String date = rs.getString(6);

			BoardObj board = new BoardObj(id, title, content, member, filename, date);

			return board;
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}

	}

}
