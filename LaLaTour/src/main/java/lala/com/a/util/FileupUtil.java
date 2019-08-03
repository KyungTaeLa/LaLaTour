package lala.com.a.util;

import java.util.Date;

public class FileupUtil {
	
	// 파일 이름 변경
		public static String getNewFilename(String f) {
			
			String filename = ""; // 파일 이름 - 확장자명
			String filepost = ""; // .확장자
			
			if(f.lastIndexOf('.')>=0) {
				filepost = f.substring(f.lastIndexOf('.'));
				filename = new Date().getTime()+filepost;
			}else{
				filename= new Date().getTime()+".back";
			}
			
			return filename;
		}
		
		public static String getNewFile2(String f){
			String filename="";
			String fpost="";
			String fre="";
			if(f.indexOf('.')>=0){
				fpost=f.substring(f.indexOf('.'));
				fre=f.substring(0,f.indexOf('.'));
				filename=fre+new Date().getTime()+fpost;
			}else{
				filename=f+new Date().getTime()+".back";
			}
			return filename;
		} 
		public static String getNewjpg(String f){
			String filename="";
			String fpost="";
			String fre="";
			if(f.indexOf('.')>=0){
				fpost=f.substring(f.indexOf('.'));
				fre=f.substring(0,f.indexOf('.'));
				filename=fre+fpost;
			}else{
				filename=f+".jpg";
			}
			return filename;
		} 
		

}
