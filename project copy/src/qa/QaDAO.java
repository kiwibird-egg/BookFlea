package qa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class QaDAO {
	
	public int upPost(String postWriter,String postSubject,String postContent) {
		String SQL="INSERT INTO "
				+ "QA(POST_ID, SUBJECT, WRITER, POST_DATE, CONTENT,AVAILABLE) "
				+ "VALUES(QA_SEQ.NEXTVAL,?,?,SYSDATE,?,1)";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, postSubject);
			pstmt.setString(2, postWriter);
			pstmt.setString(3, postContent);
			return pstmt.executeUpdate(); //반영된 레코드건수 반환
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
	
	public int deletePost(int postID) {
		String SQL="UPDATE qa SET AVAILABLE=0 WHERE POST_ID=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postID);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -1; 
	}
	
	
	public int editPost(String postSbj,String postContent,int postID) {
		String SQL="UPDATE qa SET subject=?, content=? WHERE post_id=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, postSbj);
			pstmt.setString(2, postContent);
			pstmt.setInt(3, postID);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -1; 
	}
	
	public ArrayList<QaDTO> getList(){
		String SQL = "SELECT * from QA WHERE available=1 ORDER BY POST_ID DESC";
		ArrayList<QaDTO> list = new ArrayList<QaDTO>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QaDTO qadto = new QaDTO();
				qadto.setPostID(rs.getInt(1));
				qadto.setPostSbj(rs.getString(2));
				qadto.setPostWriter(rs.getString(3));
				qadto.setPostDate(rs.getString(4));
				qadto.setPostContent(rs.getString(5));
				qadto.setPostAvailable(rs.getInt(6));
				list.add(qadto);
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public QaDTO getPost(int postID){
		String SQL = "SELECT * from QA WHERE POST_ID=? ORDER BY POST_ID DESC";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QaDTO qadto = new QaDTO();
				qadto.setPostID(rs.getInt(1));
				qadto.setPostSbj(rs.getString(2));
				qadto.setPostWriter(rs.getString(3));
				qadto.setPostDate(rs.getString(4));
				qadto.setPostContent(rs.getString(5));
				qadto.setPostAvailable(rs.getInt(6));
				return qadto;
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
