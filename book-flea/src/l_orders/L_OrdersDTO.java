package l_orders;

public class L_OrdersDTO {
	
	Integer orderNo = null;
	Integer bookNo = null;
	String orderState = null;
	String bookCondition = null;
	String sellerId = null;
	Integer price = null;
	String buyerId = null;
	String soldDate = null;
	/*=========================================*/
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	/*=========================================*/
	public Integer getBookNo() {
		return bookNo;
	}
	public void setBookNo(Integer bookNo) {
		this.bookNo = bookNo;
	}
	/*=========================================*/
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	/*=========================================*/
	public String getBookCondition() {
		return bookCondition;
	}
	public void setBookCondition(String bookCondition) {
		this.bookCondition = bookCondition;
	}
	/*=========================================*/
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	/*=========================================*/
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	/*=========================================*/
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	/*=========================================*/
	public String getSoldDate() {
		return soldDate;
	}
	public void setSoldDate(String soldDate) {
		this.soldDate = soldDate;
	}
	/*=========================================*/
	String bookTitle = null;
	
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	/*=========================================*/
	
}
