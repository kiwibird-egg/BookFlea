package l_orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class L_OrdersDAO {

	public ArrayList<L_OrdersDTO> getUnreviewdList(){
		String SQL ="SELECT a.seller_id, b.title, c.name, a.price FROM L_ORDERS A, L_BOOKS B, S_CODE C WHERE ORDER_STATE=02001 AND A.BOOK_NO = B.BOOK_NO AND a.book_condition=c.code";
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
					DTO.setSellerId(rs.getString(1));
					DTO.setBookTitle(rs.getString(2));
					DTO.setBookCondition(rs.getString(3));
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
	
}
