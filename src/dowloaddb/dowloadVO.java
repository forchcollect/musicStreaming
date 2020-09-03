package dowloaddb;

public class dowloadVO {
	private int songno;
	private int no;
	private int down;
	private int userno;
	private String S_ATTACH;
	private String S_FILESIZE;
	private String s_ORIGINALFILENAME;
	
	public dowloadVO() {
		
	}

	public dowloadVO(int songno, int no, int down, int userno) {
		super();
		this.songno = songno;
		this.no = no;
		this.down = down;
		this.userno = userno;
	}

	public int getSongno() {
		return songno;
	}

	public void setSongno(int songno) {
		this.songno = songno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getDown() {
		return down;
	}

	public void setDown(int down) {
		this.down = down;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getS_ATTACH() {
		return S_ATTACH;
	}

	public void setS_ATTACH(String s_ATTACH) {
		S_ATTACH = s_ATTACH;
	}

	public String getS_FILESIZE() {
		return S_FILESIZE;
	}

	public void setS_FILESIZE(String s_FILESIZE) {
		S_FILESIZE = s_FILESIZE;
	}

	public String getS_ORIGINALFILENAME() {
		return s_ORIGINALFILENAME;
	}

	public void setS_ORIGINALFILENAME(String s_ORIGINALFILENAME) {
		this.s_ORIGINALFILENAME = s_ORIGINALFILENAME;
	}

	@Override
	public String toString() {
		return "dowloadVO [songno=" + songno + ", no=" + no + ", down=" + down + ", userno=" + userno + ", S_ATTACH="
				+ S_ATTACH + ", S_FILESIZE=" + S_FILESIZE + ", s_ORIGINALFILENAME=" + s_ORIGINALFILENAME + "]";
	}

	
}
