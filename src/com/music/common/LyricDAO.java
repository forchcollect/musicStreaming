package com.music.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.music.chart.model.ChartVO;
import com.music.db.ConnectionPoolMgr2;

public class LyricDAO {
	public int inserLyric (int no, String lyric) throws SQLException{
		ConnectionPoolMgr2 pool=new ConnectionPoolMgr2();
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
				String sql="update song" + 
						" set lyric=?"
						+ "where songno=?";
				ps=con.prepareStatement(sql);
				
				ps.setString(1, lyric);
				ps.setInt(2, no);
				int cnt=ps.executeUpdate();
				
				System.out.println("���� �Է� ��� no="+no+", lyric="+lyric);
			
			return cnt;

		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	
	public List<ChartVO> selectLyricNull () throws SQLException{
		ConnectionPoolMgr2 pool=new ConnectionPoolMgr2();
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select singer, title, songno from song" + 
					" order by singer, title";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			List<ChartVO> list=new ArrayList<ChartVO>();
			while(rs.next()) {
				ChartVO vo=new ChartVO();
				vo.setS_singer(rs.getString(1));
				vo.setS_title(rs.getString(2));
				vo.setSongno(rs.getInt(3));
				
				list.add(vo);
			}
			
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	
	

}
