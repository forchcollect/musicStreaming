package com.music.common;


public class PagingVO { 
	private int currentPage; //占쎌겱占쎌삺占쎈읂占쎌뵠筌욑옙
	private int totalRecord; //�룯占� 占쎌쟿�굜遺얜굡占쎈땾 17
	private int pageSize; //占쎈읂占쎌뵠筌욑옙占쎈뼣 癰귣똻肉э쭪占� 占쎌쟿�굜遺얜굡占쎈땾 5
	private int totalPage; //�룯占� 占쎈읂占쎌뵠筌욑옙占쎈땾 4
	private int blockSize; //�뇡遺얠쑏占쎈뼣 癰귣똻肉э쭪占� 占쎈읂占쎌뵠筌욑옙 占쎈땾 10
	private int firstPage; //�뇡遺얠쑏占쎈뼣 占쎈뻻占쎌삂占쎈읂占쎌뵠筌욑옙 1,11,21,31...
	private int lastPage; //�뇡遺얠쑏占쎈뼣 筌띾뜆占쏙쭕占� 占쎈읂占쎌뵠筌욑옙 10,20,30,40....
	private int curPos; //占쎈읂占쎌뵠筌욑옙占쎈뼣 占쎈뻻占쎌삂 占쎌뵥占쎈쑔占쎈뮞(list 占쎄땀占쎈퓠占쎄퐣)
		//=>0, 5, 10, 15...
	private int num; // 占쎈읂占쎌뵠筌욑옙占쎈뼣 占쎈뻻占쎌삂 疫뀐옙 甕곕뜇�깈
		//=>17, 12, 7...

	public PagingVO(int currentPage, int totalRecord, int pageSize, int blockSize){  
		this.currentPage=currentPage;	  
		this.totalRecord=totalRecord;

		this.pageSize=pageSize;
		this.blockSize = blockSize;

		totalPage=(int)Math.ceil((float)totalRecord/pageSize);
		firstPage= currentPage-((currentPage-1)%blockSize);
		lastPage = firstPage+(blockSize-1);
		curPos=(currentPage-1)*pageSize;
		num=totalRecord-curPos;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	} 

	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getCurPos() {
		return curPos;
	}
	public void setCurPos(int curPos) {
		this.curPos = curPos;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	} 
}
