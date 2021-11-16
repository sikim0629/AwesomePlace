package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class MenuDAO {
//  예비용 insert	
//	public boolean insert (String title, String name, String price, String description, String filename) throws NamingException, SQLException{
//		Connection conn = null;
//		PreparedStatement stmt = null;
//		
//		try {
//			String sql = "INSERT INTO menu(mtitle, mname, mprice, mdescription, mfile) VALUES(?,?,?,?)";
//			
//			conn = ConnectionPool.get();
//			stmt = conn.prepareStatement(sql);
//				stmt.setString(1, title);
//				stmt.setString(2, name);
//				stmt.setNString(3, price);
//				stmt.setString(3, description);
//				stmt.setString(4, filename);
//			int count = stmt.executeUpdate();
//			
//			return (count == 1)? true : false;
//		}finally {
//			if(stmt != null) stmt.close();
//			if(conn != null) conn.close();
//		}		
//	}
	
	public ArrayList<MenuObj> getList(String title) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM menu WHERE mtitle=?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setString(1, title);
			rs = stmt.executeQuery();
		
			ArrayList<MenuObj> menus = new ArrayList<MenuObj>();
			
			while (rs.next()) {
				menus.add(new MenuObj(rs.getString("mtitle"),rs.getString("mname"),rs.getString("mprice"),rs.getString("mdescription"),rs.getString("mfile")));
			}
			return menus;
		}finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}		
	}
	
	
	
	
	
}