package com.board.action;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/downloadAction")
public class downloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("file");
		System.out.println(fileName);
		String directory = this.getServletContext().getRealPath("/upload/");
		System.out.println(directory);
		File file = new File(directory+"/"+fileName);
		System.out.println(file);
		
		String mimeType = getServletContext().getMimeType(file.toString());
		System.out.println(mimeType);
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		System.out.println(1);
		String downloadName = null;
		if(request.getHeader("user-agent").indexOf("MISE") == -1) {
			downloadName = new String (fileName.getBytes("UTF-8"),"8859_1");
		}else {
			downloadName = new String (fileName.getBytes("EUC-KR"),"8859_1");
		}
		System.out.println(2);
		
		response.setHeader("Content-Disposition","attachment;fileName=\""+downloadName+"\";");
		System.out.println(3);
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		System.out.println(4);
		
		byte b[] = new byte[1024];
		int data = 0;
		System.out.println(5);
		
		while((data = (fileInputStream.read(b, 0, b.length))) != -1) {
			servletOutputStream.write(b,0,data);
		}
		System.out.println(6);
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
		System.out.println(7);
	}
}
