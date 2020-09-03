package com.music.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.music.db.ConnectionPoolMgr2;

public class InsertRandomDate {

	public int inserSongDatano(int no, int likeno, String[] date, int cur) throws SQLException{
		ConnectionPoolMgr2 pool=new ConnectionPoolMgr2();
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		
		try {
			con=pool.getConnection();
			
				String sql="insert into songdatano" + 
						" values(?, ?, ?)";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, no);
				ps.setInt(2, cur+1);
				ps.setString(3, date[cur]);
				cnt+=ps.executeUpdate();
			
				pool.dbClose(con, ps);
			
			return cnt;

		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	public String selectAlbumDateFromSongNo(int no) throws SQLException{
		ConnectionPoolMgr2 pool=new ConnectionPoolMgr2();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String dateS =null;
			
			//발매일 가져오기
			String sql="select releaseddate  from album" + 
				" where albumno=(select albumno from song" + 
				" where songno=?)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			rs=ps.executeQuery();
			
			Date date=null;
			if(rs.next()) {
				Timestamp time=rs.getTimestamp(1);
				date = new Date(time.getTime());
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			dateS=sdf.format(date);
		
		return dateS;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}

}
