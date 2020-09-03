package com.music.chart.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.music.db.ConnectionPoolMgr2;

public class ChartDAO {
	ConnectionPoolMgr2 pool;

	public ChartDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public List<ChartVO> searchMonthChart() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select mc.* from" + 
				" (select count(songno) as likeno, s_title, s_singer, a_title, albumno, songno from" + 
				" (select trunc(months_between(sysdate, s_likedate)) as month, c.*" + 
				" from chart c)" + 
				" where month < 1" + 
				" group by songno, s_title, s_singer, a_title, albumno, songno" + 
				" order by likeno desc)mc" + 
				" where rownum <= 10";
			
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			List<ChartVO> list=new ArrayList<>();
			while(rs.next()) {
				ChartVO vo=new ChartVO();
				int likeno=rs.getInt("likeno");
				String s_title=rs.getString("s_title");
				String a_title=rs.getString("a_title");
				String s_singer=rs.getString("s_singer");
				int albumno=rs.getInt("albumno");
				int songno=rs.getInt("songno");
				
				vo.setA_title(a_title);
				vo.setS_title(s_title);
				vo.setS_likeno(likeno);
				vo.setS_singer(s_singer);
				vo.setAlbumno(albumno);
				vo.setSongno(songno);
				
				list.add(vo);
			}
			System.out.println("월간 top10 차트 조회 성공! list.size()="+list.size());
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
	
	public List<ChartVO> selectTodayChart() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select mc.* from" + 
					" (select count(songno) as likeno, s_title, s_singer, a_title, albumno, songno from" + 
					" (select trunc(sysdate - s_likedate) as day, c.*" + 
					" from chart c)" + 
					" where day < 2" + 
					" group by songno, s_title, s_singer, a_title, albumno, songno" + 
					" order by likeno desc)mc\r\n" + 
					" where rownum <= 10";
			
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			List<ChartVO> list=new ArrayList<>();
			while(rs.next()) {
				ChartVO vo=new ChartVO();
				int likeno=rs.getInt("likeno");
				String s_title=rs.getString("s_title");
				String a_title=rs.getString("a_title");
				String s_singer=rs.getString("s_singer");
				int albumno=rs.getInt("albumno");
				int songno=rs.getInt("songno");
				
				vo.setA_title(a_title);
				vo.setS_title(s_title);
				vo.setS_likeno(likeno);
				vo.setS_singer(s_singer);
				vo.setAlbumno(albumno);
				vo.setSongno(songno);
				
				list.add(vo);
			}
			System.out.println("Today top10 차트 조회 성공! list.size()="+list.size());
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
	
	public List<ChartVO> selectWeekChart() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select mc.* from" + 
					" (select count(songno) as likeno, s_title, s_singer, a_title, albumno, songno from" + 
					" (select trunc(sysdate - s_likedate) as day, c.*" + 
					" from chart c)" + 
					" where day = 7" + 
					" group by songno, s_title, s_singer, a_title, albumno, songno" + 
					" order by likeno desc)mc" + 
					" where rownum <= 10";
			
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			List<ChartVO> list=new ArrayList<>();
			while(rs.next()) {
				ChartVO vo=new ChartVO();
				int likeno=rs.getInt("likeno");
				String s_title=rs.getString("s_title");
				String a_title=rs.getString("a_title");
				String s_singer=rs.getString("s_singer");
				int albumno=rs.getInt("albumno");
				int songno=rs.getInt("songno");
				
				vo.setA_title(a_title);
				vo.setS_title(s_title);
				vo.setS_likeno(likeno);
				vo.setS_singer(s_singer);
				vo.setAlbumno(albumno);
				vo.setSongno(songno);
				
				list.add(vo);
			}
			System.out.println("주간 top10 차트 조회 성공! list.size()="+list.size());
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
	
	
	public List<ChartVO> selectTotalChart() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select mc.* from" + 
					" (select count(songno) as likeno, s_title, s_singer, a_title, albumno, songno from" + 
					" (select trunc(months_between(sysdate, s_likedate)) as month, c.*" + 
					" from chart c)" + 
					" group by songno, s_title, s_singer, a_title, albumno, songno " + 
					" order by likeno desc)mc " + 
					" where rownum <= 10";
			
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			List<ChartVO> list=new ArrayList<>();
			while(rs.next()) {
				ChartVO vo=new ChartVO();
				int likeno=rs.getInt("likeno");
				String s_title=rs.getString("s_title");
				String a_title=rs.getString("a_title");
				String s_singer=rs.getString("s_singer");
				int albumno=rs.getInt("albumno");
				int songno=rs.getInt("songno");
				
				vo.setA_title(a_title);
				vo.setS_title(s_title);
				vo.setS_likeno(likeno);
				vo.setS_singer(s_singer);
				vo.setAlbumno(albumno);
				vo.setSongno(songno);
				
				list.add(vo);
			}
			System.out.println("3년 이상 지난 top10 차트 조회 성공! list.size()="+list.size());
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
	
	}
	
	
}

