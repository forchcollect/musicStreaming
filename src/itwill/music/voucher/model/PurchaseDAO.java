package itwill.music.voucher.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import itwill.musicStreaming.db.ConnectionPoolMgr2;

public class PurchaseDAO {
	private ConnectionPoolMgr2 pool;
	
	public PurchaseDAO() {
		pool = new ConnectionPoolMgr2();
		
	}
	
	
	
	public int buyVoucher(PurchaseVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="insert into purchase_statement(no,EX_DATE, userid, price, voucher_name)";
				if(vo.getPrice()==5500 || vo.getPrice()==0) { //검색의 경우
					sql +=" values(purchase_statement_seq.nextval,sysdate+365,?,?,?)";
				}else {
					sql +=" values(purchase_statement_seq.nextval, sysdate+30 ,?,?,?)";
				}
				
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getUserid());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getVoucherName());
			
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	public List<PurchaseVO> showPurchase(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			String sql="select * from purchase_statement where userid=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userid);
			rs=ps.executeQuery();
			
			List<PurchaseVO> list = new ArrayList<PurchaseVO>();
			while(rs.next()) {
				PurchaseVO vo = new PurchaseVO();
				vo.setNo(rs.getInt("no"));
				vo.setRegdate(rs.getTimestamp("PUR_REGDATE"));
				vo.setExRegdate(rs.getTimestamp("EX_DATE"));
				vo.setPrice(rs.getInt("price"));
				vo.setUserid(rs.getString("userid"));
				vo.setVoucherName(rs.getString("voucher_name"));
				list.add(vo);
			}
			
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	public int deleteVoucher(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql = "delete purchase_statement where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt = ps.executeUpdate();
			return cnt;
			
		}finally {
			pool.dbClose(con, ps);
			
		}
		
	}

}
