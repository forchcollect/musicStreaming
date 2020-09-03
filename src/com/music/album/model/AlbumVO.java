package com.music.album.model;

import java.sql.Timestamp;

public class AlbumVO {
	int albumno;
	String title;
	String singer;
	String genre;
	Timestamp releasedDate;
	String releasedCompany;
	String agency;
	String Domestic;
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Timestamp getReleasedDate() {
		return releasedDate;
	}
	public void setReleasedDate(Timestamp releasedDate) {
		this.releasedDate = releasedDate;
	}
	public String getReleasedCompany() {
		return releasedCompany;
	}
	public void setReleasedCompany(String releasedCompany) {
		this.releasedCompany = releasedCompany;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public String getDomestic() {
		return Domestic;
	}
	public void setDomestic(String domestic) {
		Domestic = domestic;
	}
	@Override
	public String toString() {
		return "AlbumVO [albumno=" + albumno + ", title=" + title + ", singer=" + singer + ", genre=" + genre
				+ ", releasedDate=" + releasedDate + ", releasedCompany=" + releasedCompany + ", agency=" + agency
				+ ", Domestic=" + Domestic + "]";
	}
	
	
}
