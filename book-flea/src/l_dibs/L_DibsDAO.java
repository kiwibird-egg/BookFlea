package l_dibs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import l_dibs.L_DibsDTO;
import util.DatabaseUtil;

public class L_DibsDAO {
	
	public int addDibs(String userId, int bookNo) {
		String SQL = "INSERT INTO L_DIBS VALUES(?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.setInt(2, bookNo);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public int deleteDibs(String userId, int bookNo) {
		String SQL = "DELETE FROM L_DIBS WHERE BOOK_NO=? AND USER_ID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bookNo);
			pstmt.setString(2, userId);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	
	public ArrayList<L_DibsDTO> getBookNo(String userId) {
		String SQL = "SELECT BOOK_NO FROM L_DIBS WHERE USER_ID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<L_DibsDTO> list = new ArrayList<L_DibsDTO>();
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					L_DibsDTO DTO = new L_DibsDTO();
					DTO.setBookNo(rs.getInt(1));
					list.add(DTO);
				}
				return list;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return null;
	}
}
