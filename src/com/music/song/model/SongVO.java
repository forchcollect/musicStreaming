package com.music.song.model;

public class SongVO {
	private int songno;
	private int albumno;
	private String title;
	private String singer;
	private String lyricWriter;
	private String songWriter;
	private String songEditer;
	private String lyric;
	public int getSongno() {
		return songno;
	}
	public void setSongno(int songno) {
		this.songno = songno;
	}
	public int getAlbumno() {
		return albumno;
	}
	public void setAlbumno(int albumno) {
		this.albumno = albumno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getLyricWriter() {
		return lyricWriter;
	}
	public void setLyricWriter(String lyricWriter) {
		this.lyricWriter = lyricWriter;
	}
	public String getSongWriter() {
		return songWriter;
	}
	public void setSongWriter(String songWriter) {
		this.songWriter = songWriter;
	}
	public String getSongEditer() {
		return songEditer;
	}
	public void setSongEditer(String songEditer) {
		this.songEditer = songEditer;
	}
	public String getLyric() {
		return lyric;
	}
	public void setLyric(String lyric) {
		this.lyric = lyric;
	}
	@Override
	public String toString() {
		return "SongVO [songno=" + songno + ", albumno=" + albumno + ", title=" + title + ", singer=" + singer
				+ ", lyricWriter=" + lyricWriter + ", songWriter=" + songWriter + ", songEditer=" + songEditer
				+ ", lyric=" + lyric + "]";
	}
	
	
}
