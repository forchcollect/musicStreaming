package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	private ConnectionPoolMgr2 pool;
	
	public MemberDAO(){
		pool=new ConnectionPoolMgr2();
	}
	// 회원가입
	public int insertUser(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into userinfo(userno, id, pwd, hp, email )" + 
					" values(userinfo_seq.nextval, ?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getHp());
			ps.setString(4, vo.getEmail());
			
			int cnt=ps.executeUpdate();
			System.out.println("회원가입 결과, cnt=" + cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	// 중복확인
	public int existornot(String id) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select count(*) from userinfo" + 
					" where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs=ps.executeQuery();			
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) {  //해당 아이디가 이미 존재
					result=MemberService.EXIST_ID;
				}else {
					result=MemberService.NON_EXIST_ID;					
				}
			}
			
			System.out.println("아이디 중복확인 결과 result="+result);
			return result;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	// 로그인처리(id && pwd 입력시 )
	public int loginCheck(String id, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select pwd from userinfo" + 
					" where id=? and leavedate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs=ps.executeQuery();
			if(rs.next()) {// 
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) { //로그인 성공
					result=MemberService.LOGIN_OK;
				}else { //비밀번호 불일치
					result=MemberService.PWD_DISAGREE;
				}
			}else {  //해당 아이디가 없는 경우
				result=MemberService.ID_NONE;
			}
			
			System.out.println("로그인 처리 결과 result="+result
					+", 매개변수 id="+id+", pwd="+pwd);
			
			return result;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	// id와 일치하는 회원정보 조회(id) >  pwd찾기 && 내정보조회  && 정보수정위한 조회
	public MemberVO selectUser(String id) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		MemberVO vo = new MemberVO();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from userinfo" + 
					" where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int userno=rs.getInt("userno");
				int adminno=rs.getInt("adminno");
				String pwd=rs.getString("pwd");
				String hp=rs.getString("hp");
				String email=rs.getString("email");
				Timestamp regdate=rs.getTimestamp("regdate");
				Timestamp leavedate=rs.getTimestamp("leavedate");
				
				vo.setUserno(userno);
				vo.setAdminno(adminno);
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setHp(hp);
				vo.setEmail(email);
				vo.setRegdate(regdate);
				vo.setLeavedate(leavedate);
				
			}
			
			System.out.println("회원정보 조회 결과 vo="+vo
					+", 매개변수 id="+id);
			
			return vo;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	// 회원정보 수정
	public int updateUser(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update userinfo"
					+ " set email=?,hp=?"
					+ " where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getHp());
			ps.setString(3, vo.getId());
			
			int cnt=ps.executeUpdate();
			System.out.println("회원정보 수정 결과, cnt=" + cnt
					+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	// 회원탈퇴처리
	public int deleteUser(String id) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update userinfo"
					+ " set leavedate=sysdate" 
					+ " where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			int cnt=ps.executeUpdate();
			System.out.println("회원탈퇴 결과, cnt=" + cnt
					+", 매개변수 id="+id);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	// 아이디찾기(email,hp)
	public MemberVO searchid(String hp, String email ) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		MemberVO vo  = new MemberVO();
		try {
			con = pool.getConnection();
			String sql ="select * from userinfo "
					+ " where email  = ? and hp = ? and  regdate is null ";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, hp);
			rs = ps.executeQuery();
		
			if(rs.next()) {
				int userno=rs.getInt("userno");
				int adminno=rs.getInt("adminno");
				String pwd=rs.getString("pwd");
				String id =rs.getString("id");
				Timestamp regdate=rs.getTimestamp("regdate");
				Timestamp leavedate=rs.getTimestamp("leavedate");
				
				vo.setUserno(userno);
				vo.setAdminno(adminno);
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setHp(hp);
				vo.setEmail(email);
				vo.setRegdate(regdate);
				vo.setLeavedate(leavedate);
				
			}
			
			System.out.println("회원정보 조회 결과 vo="+vo
					+", 매개변수 email, hp ="+email+","+ hp);
			
			return vo;
		}finally {
			pool.dbClose(con, ps, rs);
		}
				
	}
	// 비밀번호찾기		
	public MemberVO searchpwd(String id, String hp ) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		MemberVO vo  = new MemberVO();
		try {
			con = pool.getConnection();
			String sql ="select * from userinfo "
					+ " where id  = ? and hp = ? and  regdate is null ";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, hp);
			rs = ps.executeQuery();
		
			if(rs.next()) {
				int userno=rs.getInt("userno");
				int adminno=rs.getInt("adminno");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				Timestamp regdate=rs.getTimestamp("regdate");
				Timestamp leavedate=rs.getTimestamp("leavedate");
				
				vo.setUserno(userno);
				vo.setAdminno(adminno);
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setHp(hp);
				vo.setEmail(email);
				vo.setRegdate(regdate);
				vo.setLeavedate(leavedate);
				
			}
			
			System.out.println("회원정보 조회 결과 vo="+vo
					+", 매개변수 id, hp="+ id +", "+ hp);
			
			return vo;
		}finally {
			pool.dbClose(con, ps, rs);
		}
				
	}
			
			
			
		
	

	
	//회원 목록 보기(관리자)
	    public List<MemberVO> getMemberList()throws SQLException {
	         
	        Connection con= null;
	        PreparedStatement ps =null;
	        ResultSet rs= null;
	        List<MemberVO> list =new ArrayList<MemberVO>();
	        MemberVO vo=null;
	        String sql="";
	         
	        try{
	           con = pool.getConnection();
	            sql = "select * from userinfo order by userno desc";
	            ps = con.prepareStatement(sql);
	            rs=ps.executeQuery();
	             
	            vo =new MemberVO();
	            while(rs.next()){            	
	            		vo.setUserno(rs.getInt("adminno"));
	            		vo.setAdminno(rs.getInt("userno"));
	                	vo.setId(rs.getString("id"));
	                	vo.setPwd(rs.getString("pwd"));
	                	vo.setHp(rs.getString("hp"));
	                	vo.setEmail(rs.getString("email"));
	                	vo.setRegdate(rs.getTimestamp("regdate"));
	                	vo.setLeavedate(rs.getTimestamp("leavedate"));
	                	list.add(vo);
	            }           
	       
	        }finally{
	            pool.dbClose(con, ps, rs);
	        }       
	       return list;
	    }



}








