package com.board.action;

import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.Board;
import com.controller.CommandAction;
import com.dao.BoardDao;

public class BoardCommentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		try {
			HttpSession session = request.getSession();
			request.setCharacterEncoding("utf-8");
			String writer = (String) session.getAttribute("ID");
			String text = request.getParameter("boardContent");        		
			
//      현재 들어간 게시글 번호 불러오야 함
			String idx = (String) session.getAttribute("a");
			System.out.println("String = "+idx);
			int num = Integer.parseInt(idx);
			System.out.println("int = "+num);
			
			Board article = new Board();
			article.setWriter(writer);
			article.setContent(text);      
			article.setIdx(num);
			
			BoardDao.getInstance().insertArticleContent(article);
			
			return "content.do?idx="+idx;
			
		} catch (Exception e) {
			System.out.println("오류 발생");
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>alert('댓글입력에 오류 발생');</script>");
			script.println("<script>location.href='modify';</script>");
			script.close();
			return "lists.do?page=0&category=all";
		}
	}
}
