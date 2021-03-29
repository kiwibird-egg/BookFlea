package s_users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import util.DatabaseUtil;

public class S_UsersDAO {

	public int register(
			String userId, String userPw, 
			String userName, String userEmail) {
		String SQL = "INSERT INTO S_USERS VALUES(?,?,?,?,'01001')";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			pstmt.setString(3, userName);
			pstmt.setString(4, userEmail);
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
	
	public int login(String userId, String userPw) {
		String SQL = "SELECT USER_PW FROM S_USERS WHERE USER_ID=? AND GRADE=01001";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPw)) {
					return 1; // login success
				}
				else {
					return 0; // login denied
				}
			}
			return -1; // logic error
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs !=null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -2; //DB error
	}
	
	public int adminLogin(String userId, String userPw) {
		String SQL = "SELECT USER_PW FROM S_USERS WHERE USER_ID=? AND GRADE=01000";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPw)) {
					return 1; // login success
				}
				else {
					return 0; // login denied
				}
			}
			return -1; // logic error
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs !=null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -2; //DB error
	}
	
	public S_UsersDTO getUserInfo(String userId){
		String SQL = "SELECT NAME,EMAIL FROM S_USERS WHERE USER_ID=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				S_UsersDTO DTO = new S_UsersDTO();
				DTO.setUserName(rs.getString(1));
				DTO.setUserEmail(rs.getString(2));
				return DTO;
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<S_UsersDTO> getUsersList(){
		String SQL = "SELECT A.user_id, A.name, email, b.name FROM S_USERS A, S_CODE B WHERE a.grade=b.code";
		ArrayList<S_UsersDTO> list = new ArrayList<S_UsersDTO>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				S_UsersDTO DTO = new S_UsersDTO();
				DTO.setUserId(rs.getString(1));
				DTO.setUserName(rs.getString(2));
				DTO.setUserEmail(rs.getString(3));
				DTO.setUserGrade(rs.getString(4));
				list.add(DTO);
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
