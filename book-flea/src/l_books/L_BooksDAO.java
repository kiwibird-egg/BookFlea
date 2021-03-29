package l_books;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import l_books.L_BooksDTO;
import s_users.S_UsersDTO;
import util.DatabaseUtil;

public class L_BooksDAO {

	public ArrayList<L_BooksDTO> getList(){
		String SQL = "SELECT * FROM L_BOOKS ORDER BY BOOK_NO DESC";
		ArrayList<L_BooksDTO> list = new ArrayList<L_BooksDTO>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				L_BooksDTO DTO = new L_BooksDTO();
				DTO.setBookNo(rs.getInt(1));
				DTO.setTitle(rs.getString(2));
				DTO.setAuthor(rs.getString(3));
				DTO.setPublisher(rs.getString(4));
				DTO.setPrice(rs.getInt(5));
				DTO.setImage(rs.getString(6));
				list.add(DTO);
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public L_BooksDTO getBookInfo(int bookNo){
		String SQL = "SELECT * FROM L_BOOKS WHERE BOOK_NO=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bookNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				L_BooksDTO DTO = new L_BooksDTO();
				DTO.setBookNo(rs.getInt(1));
				DTO.setTitle(rs.getString(2));
				DTO.setAuthor(rs.getString(3));
				DTO.setPublisher(rs.getString(4));
				DTO.setPrice(rs.getInt(5));
				DTO.setImage(rs.getString(6));
				return DTO;
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int addBookInfo(String title, String author,String publisher, int price) {
		String SQL="INSERT INTO L_BOOKS(title, author, publisher, price) VALUES(?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, publisher);
			pstmt.setInt(4, price);
			return pstmt.executeUpdate(); //�ݿ��� ���ڵ�Ǽ� ��ȯ
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
	
	
	public int updateBookInfo(int bookNo, String title, String author,String publisher, int price) {
		String SQL="UPDATE L_BOOKS SET title=?, author=?, publisher=?, price=? WHERE BOOK_NO=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, publisher);
			pstmt.setInt(4, price);
			pstmt.setInt(5, bookNo);
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
	
	public int deleteBookInfo(int bookNo) {
		String SQL="DELETE FROM L_Books WHERE BOOK_NO=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bookNo);
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
}
