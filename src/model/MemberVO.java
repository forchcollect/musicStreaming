package model;

import java.sql.Timestamp;

public class MemberVO {
	private int userno;
	private int adminno;
	private String id;
	private String pwd;
	private String hp;
	private String email;
	private Timestamp regdate;
	private Timestamp leavedate;
	
	
	
	public MemberVO() {
		super();
	}
	
	
	public MemberVO(int userno, int adminno, String id, String pwd, String hp, String email, Timestamp regdate,
			Timestamp leavedate) {
		super();
		this.userno = userno;
		this.adminno = adminno;
		this.id = id;
		this.pwd = pwd;
		this.hp = hp;
		this.email = email;
		this.regdate = regdate;
		this.leavedate = leavedate;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getAdminno() {
		return adminno;
	}
	public void setAdminno(int adminno) {
		this.adminno = adminno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getLeavedate() {
		return leavedate;
	}
	public void setLeavedate(Timestamp leavedate) {
		this.leavedate = leavedate;
	}

	
}
