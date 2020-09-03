package com.music.chart.model;

public class ChartVO {
	private int albumno;
	private int songno;
	private String s_title;
	private String s_singer;
	private String a_title;
	private int s_likeno;
	
	private int rank;
	
	public ChartVO() {
		super();
	}

	public int getAlbumno() {
		return albumno;
	}

	public int getSongno() {
		return songno;
	}

	public String getS_title() {
		return s_title;
	}

	public String getS_singer() {
		return s_singer;
	}

	public String getA_title() {
		return a_title;
	}

	public int getS_likeno() {
		return s_likeno;
	}

	public void setAlbumno(int albumno) {
		this.albumno = albumno;
	}

	public void setSongno(int songno) {
		this.songno = songno;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public void setS_singer(String s_singer) {
		this.s_singer = s_singer;
	}

	public void setA_title(String a_title) {
		this.a_title = a_title;
	}

	public void setS_likeno(int s_likeno) {
		this.s_likeno = s_likeno;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "ChartVO [albumno=" + albumno + ", songno=" + songno + ", s_title=" + s_title + ", s_singer=" + s_singer
				+ ", a_title=" + a_title + ", s_likeno=" + s_likeno + ", rank=" + rank + "]";
	}
	
	
}
