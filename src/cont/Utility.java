package cont;

import java.util.Date;

public class Utility {
	//자료실 - 파일 업로드 경로
	public final static String UPLOAD_PATH="pds_upload";
	public final static String TEST_PATH
="D:\\lecture\\workspace_list\\jsp_ws\\music\\WebContent\\pds_upload";
	
	public static String displayRe(int step) {		
		//답변글인 경우 re이미지 보여주기
		String result="";
		if(step>0){
			for(int k=0;k<step;k++){
				result+="&nbsp";
			}
			result +="<img src='../images/re.gif' alt='re이미지'>";	
		}
		
		return result;
	}
	
	public static String cutString(String title, int len) {
		//제목이 긴 경우 일부만 보여주기
		String result=title;
		if(title.length()>len) {
			result=title.substring(0, len)+"...";			
		}
		
		return result;
	}
	
	public static String displayNew(Date regdate) {
		//24시간 이내의 글인 경우 new 이미지 보여주기
		String result="";
		
		Date today = new Date();
		long gap=(today.getTime() - regdate.getTime())/1000;
		gap = gap/(60*60);
		
		if(gap<24) {
			result="<img src='../images/new.gif' alt='new이미지'>";
		}
		
		return result;
	}
	
	public static String displayFile(String fileName) {
		//파일이 첨부된 경우 파일 이미지 보여주기
		String result="";
		if(fileName!=null && !fileName.isEmpty()) {
			result="<img src='../images/file.gif' alt='파일 이미지'>";
		}
		
		return result;
	}
	
	public static String getFileInfo(String fileName, long fSize) {
		String fileInfo="";
		
		if(fileName!=null && !fileName.isEmpty()){
			float fileSize = Math.round((fSize/1024f)*100)/100f;
			
			fileInfo=Utility.displayFile(fileName) 
				+" " + fileName +" ("+ fileSize +"KB)";
		}
		
		return fileInfo;
	}
	
}









