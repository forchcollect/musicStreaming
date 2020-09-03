package com.music.common;

public class RandomNum {
	public int getRandomNum(int no, int likeno1, int likeno2) {
		
		int randomLikeNo=(int)(Math.random()*(likeno2-likeno1+1)+likeno1); 
			System.out.println("no 번호: "+ no+", 생성된 좋아요 수: "+randomLikeNo);
		
		return randomLikeNo;
	}
}
