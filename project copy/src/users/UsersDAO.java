package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UsersDAO {
	
	public int register(String userID, String userPW) {
		String SQL = "INSERT INTO USERS VALUES(?,?,1)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			return pstmt.executeUpdate();
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs !=null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		
		return -1;
	}
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT PASSWORD FROM USERS WHERE ID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; //로그인 성공
				}
				else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 아이디없음
			
		} 
		catch(Exception e) {
			e.printStackTrace();
			} 
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs !=null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -2; //DB오류
	}
	
	//public string 
}
