package com.music.album.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.music.db.ConnectionPoolMgr2;

public class AlbumDAO {

	ConnectionPoolMgr2 pool;

	public AlbumDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public AlbumVO selectAlbumByAlbumno(int albumNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select * from album where albumno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, albumNo);
			
			rs=ps.executeQuery();
			
			AlbumVO vo=new AlbumVO();
			while(rs.next()) {
				String agency=rs.getString("agency");
				int albumno=rs.getInt("albumno");
				String domestic=rs.getString("domestic");
				String genre=rs.getString("genre");
				String releasedCompany=rs.getString("releasedcompany");
				Timestamp releasedDate=rs.getTimestamp("releasedDate");
				String singer=rs.getString("singer");
				String title=rs.getString("title");
				
				vo.setAgency(agency);
				vo.setAlbumno(albumno);
				vo.setDomestic(domestic);
				vo.setGenre(genre);
				vo.setReleasedCompany(releasedCompany);
				vo.setReleasedDate(releasedDate);
				vo.setSinger(singer);
				vo.setTitle(title);
			}
			System.out.println("앨범 정보 조회 성공! Album vo="+vo);
			return vo;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
		
	public List<AlbumVO> selectAlbumReleasedDate() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select * from" +
					" (select * from album" +
					" order by releaseddate desc)" +
					" where rownum <=6";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			List<AlbumVO> list=new ArrayList<>();
			
			while(rs.next()) {
				AlbumVO vo=new AlbumVO();
				String agency=rs.getString("agency");
				int albumno=rs.getInt("albumno");
				String domestic=rs.getString("domestic");
				String genre=rs.getString("genre");
				String releasedCompany=rs.getString("releasedcompany");
				Timestamp releasedDate=rs.getTimestamp("releasedDate");
				String singer=rs.getString("singer");
				String title=rs.getString("title");
				
				vo.setAgency(agency);
				vo.setAlbumno(albumno);
				vo.setDomestic(domestic);
				vo.setGenre(genre);
				vo.setReleasedCompany(releasedCompany);
				vo.setReleasedDate(releasedDate);
				vo.setSinger(singer);
				vo.setTitle(title);
				
				list.add(vo);
			}
			System.out.println("앨범 정보 조회 성공! list.size=+"+list.size());
			
			return list;
			
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	public List<AlbumVO> selectAlbumSameSinger(int songno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select * from album a" + 
					" where singer = (select singer from song where songno=?)" + 
					" and albumno != (select albumno from song where songno=?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, songno);
			ps.setInt(2, songno);
			
			rs=ps.executeQuery();
			
			List<AlbumVO> list=new ArrayList<>();
			
			while(rs.next()) {
				AlbumVO vo=new AlbumVO();
				
				int albumno=rs.getInt("albumno");
				String title=rs.getString("title");
				String singer=rs.getString("singer");
				
				vo.setAlbumno(albumno);
				vo.setSinger(singer);
				vo.setTitle(title);
				
				list.add(vo);
				

				/*String agency=rs.getString("agency");
				String domestic=rs.getString("domestic");
				String genre=rs.getString("genre");
				String releasedCompany=rs.getString("releasedcompany");
				Timestamp releasedDate=rs.getTimestamp("releasedDate");*/
				
				/*vo.setAgency(agency);
				vo.setDomestic(domestic);
				vo.setGenre(genre);
				vo.setReleasedCompany(releasedCompany);
				vo.setReleasedDate(releasedDate);*/
			}
			System.out.println("같은 가수가 부른 다른 앨범");
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		
		}
	}
}
