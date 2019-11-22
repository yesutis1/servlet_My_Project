package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.CommandAction;
import com.dao.CommonDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.File;

public class UploadAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		String directory = application.getRealPath("/upload/");
//		int maxSize = 1024*1024*100;
//		String encoding = "UTF-8";
//		
//		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,new DefaultFileRenamePolicy());
//		String fileName = multipartRequest.getOriginalFileName("file");
//		String fileRealName = multipartRequest.getFilesystemName("file");
//		
//		new  CommonDao().upload(fileName, fileRealName);
//		System.out.println("파일명 : "+fileName + "<br>");
//		System.out.println("실제 파일명 : "+fileRealName+"<br>");
//		
		return "list.do";
	}

}
