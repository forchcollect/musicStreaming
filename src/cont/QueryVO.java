package cont;

import java.sql.Timestamp;

public class QueryVO {
	private int no;
	private String id;	
	private String pwd;
	private String subject;
	private Timestamp regdate;
	private int readcount;
	private String message;
	
	//답변형 게시판 추가
	private int groupNo;
	private int step; 
	private int sortNo;

	
	
	
	public QueryVO() {
		super();
	}




	public QueryVO(int no, String id, String pwd, String subject, Timestamp regdate, int readcount, String message,
			int groupNo, int step, int sortNo) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.subject = subject;
		this.regdate = regdate;
		this.readcount = readcount;
		this.message = message;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
	}




	public int getNo() {
		return no;
	}




	public void setNo(int no) {
		this.no = no;
	}




	public String getid() {
		return id;
	}




	public void setid(String id) {
		this.id = id;
	}




	public String getPwd() {
		return pwd;
	}




	public void setPwd(String pwd) {
		this.pwd = pwd;
	}




	public String getSubject() {
		return subject;
	}




	public void setSubject(String subject) {
		this.subject = subject;
	}




	public Timestamp getRegdate() {
		return regdate;
	}




	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}




	public int getReadcount() {
		return readcount;
	}




	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}




	public String getMessage() {
		return message;
	}




	public void setMessage(String message) {
		this.message = message;
	}




	public int getGroupNo() {
		return groupNo;
	}




	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}




	public int getStep() {
		return step;
	}




	public void setStep(int step) {
		this.step = step;
	}




	public int getSortNo() {
		return sortNo;
	}




	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}




	@Override
	public String toString() {
		return "QueryVO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", subject=" + subject + ", regdate=" + regdate
				+ ", readcount=" + readcount + ", message=" + message + ", groupNo=" + groupNo + ", step=" + step
				+ ", sortNo=" + sortNo + "]";
	}
	
	
	
	
}



