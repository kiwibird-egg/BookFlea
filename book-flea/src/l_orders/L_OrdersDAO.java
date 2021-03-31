package l_orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class L_OrdersDAO {

	public ArrayList<L_OrdersDTO> getUnreviewedList(){
		String SQL ="SELECT a.ORDER_NO, a.seller_id, b.title, a.price FROM L_ORDERS A, L_BOOKS B WHERE ORDER_STATE=02001 AND A.BOOK_NO = B.BOOK_NO";
		// SELLER_ID, TITLE, condition, PRICE(int)
		ArrayList<L_OrdersDTO> list = new ArrayList<L_OrdersDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					L_OrdersDTO DTO = new L_OrdersDTO();
					DTO.setOrderNo(rs.getInt(1));
					DTO.setSellerId(rs.getString(2));
					DTO.setBookTitle(rs.getString(3));
					DTO.setPrice(rs.getInt(4));
					list.add(DTO);
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return list;
		
	}
	
	public L_OrdersDTO getUnreviewedInfo(int orderNo){
		String SQL = "SELECT a.seller_id, b.title, c.name, a.price FROM L_ORDERS A, L_BOOKS B, S_CODE C WHERE ORDER_STATE=02001 AND A.BOOK_NO = B.BOOK_NO AND a.book_condition=c.code AND ORDER_NO=?";
		// SELLER_ID, TITLE, condition, PRICE(int)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, orderNo);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					L_OrdersDTO DTO = new L_OrdersDTO();
					DTO.setSellerId(rs.getString(1));
					DTO.setBookTitle(rs.getString(2));
					DTO.setBookCondition(rs.getString(3));
					DTO.setPrice(rs.getInt(4));
					return DTO;
				}
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
	
	public int allowOrder(int orderId) {
		String SQL="UPDATE L_ORDERS SET ORDER_STATE='02002' WHERE ORDER_NO=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, orderId);
			
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
	
	public int deniedOrder(int orderId) {
		String SQL="UPDATE L_ORDERS SET ORDER_STATE='02000' WHERE ORDER_NO=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, orderId);
			
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
	
	
	public ArrayList<L_OrdersDTO> getSellingList(){
		String SQL ="SELECT a.ORDER_NO, a.seller_id, b.title, a.price FROM L_ORDERS A, L_BOOKS B WHERE ORDER_STATE=02002 AND A.BOOK_NO = B.BOOK_NO";
		// SELLER_ID, TITLE, condition, PRICE(int)
		ArrayList<L_OrdersDTO> list = new ArrayList<L_OrdersDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					L_OrdersDTO DTO = new L_OrdersDTO();
					DTO.setOrderNo(rs.getInt(1));
					DTO.setSellerId(rs.getString(2));
					DTO.setBookTitle(rs.getString(3));
					DTO.setPrice(rs.getInt(4));
					list.add(DTO);
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return list;
		
	}
	
	public L_OrdersDTO getSellingInfo(int orderNo){
		String SQL = "SELECT a.seller_id, b.title, c.name, a.price FROM L_ORDERS A, L_BOOKS B, S_CODE C WHERE ORDER_STATE=02002 AND A.BOOK_NO = B.BOOK_NO AND a.book_condition=c.code AND ORDER_NO=?";
		// SELLER_ID, TITLE, condition, PRICE(int)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, orderNo);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					L_OrdersDTO DTO = new L_OrdersDTO();
					DTO.setSellerId(rs.getString(1));
					DTO.setBookTitle(rs.getString(2));
					DTO.setBookCondition(rs.getString(3));
					DTO.setPrice(rs.getInt(4));
					return DTO;
				}
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
	
	public ArrayList<L_OrdersDTO> getSoldList(){
		String SQL ="SELECT a.ORDER_NO, a.seller_id, b.title, a.price FROM L_ORDERS A, L_BOOKS B WHERE ORDER_STATE=02003 AND A.BOOK_NO = B.BOOK_NO";
		// SELLER_ID, TITLE, condition, PRICE(int)
		ArrayList<L_OrdersDTO> list = new ArrayList<L_OrdersDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					L_OrdersDTO DTO = new L_OrdersDTO();
					DTO.setOrderNo(rs.getInt(1));
					DTO.setSellerId(rs.getString(2));
					DTO.setBookTitle(rs.getString(3));
					DTO.setPrice(rs.getInt(4));
					list.add(DTO);
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn !=null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt !=null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return list;
		
	}
	
	public L_OrdersDTO getSoldInfo(int orderNo){
		String SQL = "SELECT A.seller_id, B.title, c.name, a.price, a.buyer_id, TO_CHAR(a.sold_date,'yyyy-mm-dd')  FROM L_ORDERS A, L_BOOKS B, S_CODE C WHERE A.book_no=b.book_no AND A.book_condition=c.code AND ORDER_NO = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, orderNo);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					L_OrdersDTO DTO = new L_OrdersDTO();
					DTO.setSellerId(rs.getString(1));
					DTO.setBookTitle(rs.getString(2));
					DTO.setBookCondition(rs.getString(3));
					DTO.setPrice(rs.getInt(4));
					DTO.setBuyerId(rs.getString(5));
					DTO.setSoldDate(rs.getString(6));
					return DTO;
				}
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
	public int getPriceFromOrderNo(int orderNo) {
		String SQL = "SELECT A.PRICE FROM L_BOOKS A, L_ORDERS B WHERE ORDER_NO=? AND B.BOOK_NO=A.BOOK_NO";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, orderNo);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					return rs.getInt(1);
				}
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
