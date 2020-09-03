package com.music.songlikeno.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.music.db.ConnectionPoolMgr2;

public class SongLikeNoDAO {
	ConnectionPoolMgr2 pool;

	public SongLikeNoDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public SongLikeNoVO selectSongBySongno(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select * from songlikeno where songno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			
			SongLikeNoVO vo=new SongLikeNoVO();
			while(rs.next()) {
				int likeno=rs.getInt("likeno");
				vo.setLikeno(likeno);
			}
			System.out.println("차트 조회 성공! SongLikeNo vo="+vo);
			return vo;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
}
