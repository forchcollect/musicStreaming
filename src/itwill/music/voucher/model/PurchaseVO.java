package itwill.music.voucher.model;

import java.sql.Timestamp;

public class PurchaseVO {
	private int no;
	private Timestamp regdate;
	private Timestamp exRegdate;
	private String userid;
	private int price;
	private String voucherName;
	
	
	public PurchaseVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PurchaseVO(int no, Timestamp regdate, Timestamp exRegdate, String userid, int price, String voucherName) {
		super();
		this.no = no;
		this.regdate = regdate;
		this.exRegdate = exRegdate;
		this.userid = userid;
		this.price = price;
		this.voucherName = voucherName;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public Timestamp getExRegdate() {
		return exRegdate;
	}


	public void setExRegdate(Timestamp exRegdate) {
		this.exRegdate = exRegdate;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getVoucherName() {
		return voucherName;
	}


	public void setVoucherName(String voucherName) {
		this.voucherName = voucherName;
	}


	@Override
	public String toString() {
		return "PurchaseVO [no=" + no + ", regdate=" + regdate + ", exRegdate=" + exRegdate + ", userid=" + userid
				+ ", price=" + price + ", voucherName=" + voucherName + "]";
	}
	
	
	
	
}
