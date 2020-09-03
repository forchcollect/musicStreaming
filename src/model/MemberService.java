package model;

import java.sql.SQLException;
import java.util.List;

//db작업 이외의 비즈니스 로직을 처리하는 클래스
//jsp => Service => DAO

public class MemberService {
	//아이디 중복확인 관련 상수
	public static final int EXIST_ID=1;  //해당 아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2;  //아이디가 존재하지 않는 경우
	
	//로그인 처리 관련 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	public static final int ID_NONE=3; //아이디 존재하지 않음
		
	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao=new MemberDAO();
	}
	
	public int insertUser(MemberVO vo) throws SQLException {
		int cnt=memberDao.insertUser(vo);
		return cnt;
	}
	
	public int existornot(String id) throws SQLException {
		return memberDao.existornot(id);
	}
	
	public int loginCheck(String id, String pwd) throws SQLException {
		return memberDao.loginCheck(id, pwd);
	}

	public MemberVO selectUser(String id) throws SQLException {
		return memberDao.selectUser(id);
	}
		
	public int updateUser(MemberVO vo) throws SQLException {
		return memberDao.updateUser(vo);
	}
		
	public int deleteUser(String id) throws SQLException {
		return memberDao.deleteUser(id);
	}
		
	// 아이디찾기
	public MemberVO searchid(String hp, String email ) throws SQLException {
		return memberDao.searchid(hp, email) ;  	
	}
	
	// 비밀번호찾기		
	public MemberVO searchpwd(String id, String hp ) throws SQLException {
		return memberDao.searchpwd(id, hp);
	}

	//회원 목록 보기(관리자)
    public List<MemberVO> getMemberList()throws SQLException {
    	return memberDao.getMemberList(); 
    	
    }
	
	
	
	
	
}
