package com.music.common;

public class RandomNum {
	public int getRandomNum(int no, int likeno1, int likeno2) {
		
		int randomLikeNo=(int)(Math.random()*(likeno2-likeno1+1)+likeno1); 
			System.out.println("no ��ȣ: "+ no+", ������ ���ƿ� ��: "+randomLikeNo);
		
		return randomLikeNo;
	}
}
