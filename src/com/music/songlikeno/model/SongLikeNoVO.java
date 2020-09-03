package com.music.songlikeno.model;

public class SongLikeNoVO {
	int likeno;
	int songno;
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public int getSongno() {
		return songno;
	}
	public void setSongno(int songno) {
		this.songno = songno;
	}
	@Override
	public String toString() {
		return "SongLikeNoVO [likeno=" + likeno + ", songno=" + songno + "]";
	}
	
}
