package com.music.common;

public class RandomDate {

	public String getRandomDate(String ds1, String ds2) {
		
		long val1=getTransNum(ds1);
		long val2=getTransNum(ds2);
		
		
		long dateVal=(long)(Math.random()*(val2-val1+1)+val1);
		
		boolean oddYear=false;
		int a=1;
		int b=1;
		
		while(true) {
			if ((a % 4 == 0 && a % 100 != 0) || a % 400 == 0) { //�����̸� 1���� 366��
				oddYear=true;
				if(dateVal>=366) {
					dateVal-=366;
					a++;
				}else {
					System.out.println(3);
					break;
				}
			} else { //����̸� 1���� 365��
				oddYear=false;
				if(dateVal>=365) {
					dateVal-=365;
					a++;
				}else {
					break;
				}
			}
		}
		
		while(true) {
			if(b==1 || b==3 || b==5 || b==7 || b==8 || b==10 || b==12) {
				if(dateVal>=31) {
					dateVal-=31;
					b++;
				}else {
					break;
				}
			}else if(b==4 || b==6 || b==9 || b==11) {
				if(dateVal>=30) {
					dateVal-=30;
					b++;
				} else {
					break;
				}
			}else if(b==2) {
				if(oddYear) {
					if(dateVal>=29) {
						dateVal-=29;
						b++;
					}else {
						break;
					}
				}else {
					if(dateVal>=28) {
						dateVal-=28;
						b++;
					}else {
						break;
					}
				}
			}
		}
		
		int c=1;
		if(dateVal!=0) {
			c=(int) dateVal;
		}
		
		String result="";
		if (b < 10) {
			if (c < 10) { // m, d
				result = a + "-0" + b + "-0" + c;
			} else { // m
				result = a + "-0" + b + "-" + c;
			}
		} else { // d
			if (c < 10) {
				result= a + "-" + b + "-0" + c;
			} else {
				result = a + "-" + b + "-" + c;
			}
		} // if
		
		return result;

	}
	
	
	public static long getTransNum(String date) {
		String[] dsArr = date.split("-");
		
		int[] s=new int[3];
		for(int i=0;i<dsArr.length;i++) {
			s[i]=Integer.parseInt(dsArr[i]);
		}
		
		int a=s[0];
		int b=s[1];
		int c=s[2];
		
		long result=0;
		boolean oddYear=false;
		for(int i=1;i<a;i++) {
			if ((i % 4 == 0 && i % 100 != 0) || i % 400 == 0) { //�����̸� 1���� 366��
				result+=366;
				oddYear=true;
			} else { //����̸� 1���� 365��
				result+=365;
				oddYear=false;
			}
		}

		for(int i=1;i<b;i++) {
			if(i==1 || i==3 || i==5 || i==7 || i==8 || i==10 || i==12) {
				result+=31;
			}else if(i==4 || i==6 || i==9 || i==11) {
				result+=30;
			}else if(i==2) {
				if(oddYear) {
					result+=29;
				}else {
					result+=28;
				}
			}
			
		}
		result+=c;
		return result;
	}
	
	/*
	 * // s��==b�� -> s��~b��, s��==b�� -> s~b�� if (s[0] == b[0]) { m = (long)
	 * (Math.random() * (b[1] - s[1] + 1) + s[1]);
	 * System.out.println("s��==b���̰� s��~b��: "+m); if (s[1] == b[1]) { d = (int)
	 * (Math.random() * (b[2] - s[2] + 1) + s[2]);
	 * System.out.println("s��==b���̰� s��==b���̰� s~b��: "+d); } } else if (y == s[0]) {
	 * // s��!=b���̰� s���̸� // s~12�� m = (int) (Math.random() * (12 - s[1] + 1) + s[1]);
	 * System.out.println("s��!=b���̰� s���̸�, s��~b��: "+m); if (m == s[1]) { // s���̰� s���̸�
	 * s~31�� d = (int) (Math.random() * (31 - s[2] + 1) + s[2]);
	 * System.out.println("s��!=b���̰� s���̰�, s���̸� s~b��: "+d); } } else if (y == b[0]) {
	 * // s��!=b��, b���̸� // 1~b�� m = (int) (Math.random() * (b[1]) + 1);
	 * System.out.println("s��!=b���̰� b���̸�, 1��~b��: "+m); if (m == b[1]) { // b���̰� b���̸�
	 * 1~b�� d = (int) (Math.random() * (b[2]) + 1);
	 * System.out.println("s��!=b���̰� b���̰� b���̸�, 1��~b��: "+m); } }
	 */

}
