package model;

public class NoticeVO {
	private int bdno;// 공지사항번호
	private int bdtitle;  // 공지제목
	private int bdcontent;//  공지내용
	private int btattach;  // 공지첨부파일
	private int bdsize;  // 파일사이즈
	private int bdoriginalname;  // 원본파일명
	private int hits;  // 조회수
	private int regdate;  // 작성일
	private int bddelflag;  // 삭제여부
	private int userno;  // 회원번호

	
	
	public NoticeVO() {
		super();
	}



	public NoticeVO(int bdno, int bdtitle, int bdcontent, int btattach, int bdsize, int bdoriginalname, int hits,
			int regdate, int bddelflag, int userno) {
		super();
		this.bdno = bdno;
		this.bdtitle = bdtitle;
		this.bdcontent = bdcontent;
		this.btattach = btattach;
		this.bdsize = bdsize;
		this.bdoriginalname = bdoriginalname;
		this.hits = hits;
		this.regdate = regdate;
		this.bddelflag = bddelflag;
		this.userno = userno;
	}



	public int getBdno() {
		return bdno;
	}



	public void setBdno(int bdno) {
		this.bdno = bdno;
	}



	public int getBdtitle() {
		return bdtitle;
	}



	public void setBdtitle(int bdtitle) {
		this.bdtitle = bdtitle;
	}



	public int getBdcontent() {
		return bdcontent;
	}



	public void setBdcontent(int bdcontent) {
		this.bdcontent = bdcontent;
	}



	public int getBtattach() {
		return btattach;
	}



	public void setBtattach(int btattach) {
		this.btattach = btattach;
	}



	public int getBdsize() {
		return bdsize;
	}



	public void setBdsize(int bdsize) {
		this.bdsize = bdsize;
	}



	public int getBdoriginalname() {
		return bdoriginalname;
	}



	public void setBdoriginalname(int bdoriginalname) {
		this.bdoriginalname = bdoriginalname;
	}



	public int getHits() {
		return hits;
	}



	public void setHits(int hits) {
		this.hits = hits;
	}



	public int getRegdate() {
		return regdate;
	}



	public void setRegdate(int regdate) {
		this.regdate = regdate;
	}



	public int getBddelflag() {
		return bddelflag;
	}



	public void setBddelflag(int bddelflag) {
		this.bddelflag = bddelflag;
	}



	public int getUserno() {
		return userno;
	}



	public void setUserno(int userno) {
		this.userno = userno;
	}

}
