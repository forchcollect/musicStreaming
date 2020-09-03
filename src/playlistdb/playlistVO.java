package playlistdb;

public class playlistVO {
	private int userno;
	private int songno;
	private int playlistno;
	private int playtime;
	private String play;
	private String cart;
	private String mv;
	
	public playlistVO() {
		
	}

	public playlistVO(int userno, int songno, int playlistno, int playtime, String play, String cart, String mv) {
		super();
		this.userno = userno;
		this.songno = songno;
		this.playlistno = playlistno;
		this.playtime = playtime;
		this.play = play;
		this.cart = cart;
		this.mv = mv;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getSongno() {
		return songno;
	}

	public void setSongno(int songno) {
		this.songno = songno;
	}

	public int getPlaylistno() {
		return playlistno;
	}

	public void setPlaylistno(int playlistno) {
		this.playlistno = playlistno;
	}

	public int getPlaytiem() {
		return playtime;
	}

	public void setPlaytime(int playtime) {
		this.playtime = playtime;
	}

	public String getPlay() {
		return play;
	}

	public void setPlay(String play) {
		this.play = play;
	}

	public String getCart() {
		return cart;
	}

	public void setCart(String cart) {
		this.cart = cart;
	}

	public String getMv() {
		return mv;
	}

	public void setMv(String mv) {
		this.mv = mv;
	}

	@Override
	public String toString() {
		return "playlistVO [userno=" + userno + ", songno=" + songno + ", playlistno=" + playlistno + ", playtime="
				+ playtime + ", play=" + play + ", cart=" + cart + ", mv=" + mv + "]";
	}
}
