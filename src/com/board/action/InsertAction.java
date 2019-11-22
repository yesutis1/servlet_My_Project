package com.board.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.Board;
import com.controller.CommandAction;
import com.dao.BoardDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	HttpSession session = request.getSession();
    	request.setCharacterEncoding("utf-8");
//    	MultipartRequest multipartRequest = new MultipartRequest(request, "/upload/",1024*1024*10,"UTF-8", new DefaultFileRenamePolicy());
    	MultipartRequest multipartRequest = new MultipartRequest(request, "C:\\Users\\YONSAI\\Desktop\\My\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\My_Project\\upload",1024*1024*10,"UTF-8", new DefaultFileRenamePolicy());

        String title = multipartRequest.getParameter("title");
        String writer = (String) session.getAttribute("ID");
        String regdate = multipartRequest.getParameter("regdate");
        int count = 1;
        /* 내용은 상세보기에서 사용함. */
        String content = multipartRequest.getParameter("content");
        String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
        
        System.out.println("title : "+title+", writer : "+writer+", content : "+ content+", fileName : "+fileName+", realFileName : "+fileRealName);
        
        
        
        if(title == null || title == "") {
        	PrintWriter script = response.getWriter();
    		script.println("<script>alert('제목을 입력하세요')</script>");
    		script.close();
        }
//        if(writer == null || writer == "") {
//            System.out.println("작성자가 null입니다.");
//        } else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer)) {
//            System.out.println("이메일 형식이 아닙니다.");
//        }
//        if(regdate == null || regdate == ""){
//            System.out.println("작성일이 null입니다.");
//        } else if(!Pattern.matches("^[0-9]*$", regdate)) {
//            System.out.println("숫자형식이 아닙니다.");
//        }
        if(content == null || content == "") {
        	System.out.println("내용이 null입니다.");
        	PrintWriter script = response.getWriter();
    		script.println("<script>alert('내용을 입력하세요')</script>");
    		script.close();
        }
        
        Board article = new Board();
        article.setTitle(title);
        article.setWriter(writer);
        article.setRegdate(regdate);
        article.setCount(count);
        article.setContent(content);
        article.setFileName(fileName);
        article.setFileRealName(fileRealName);
        
        BoardDao.getInstance().insertArticle(article);

        return "insert.jsp";
    }

}
