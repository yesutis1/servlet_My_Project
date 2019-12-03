package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.controller.CommandAction;
import com.dao.BoardDao;

public class List_Action implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	String search = request.getParameter("search");
		System.out.println("search : "+search);
    	
    	int startNum = 0;
    	String pageNum = request.getParameter("page");
    	String category = request.getParameter("category");
    	startNum = Integer.parseInt(pageNum)*10;
    	System.out.println("String : "+pageNum);
    	System.out.println("int : "+startNum);
    	System.out.println("category : "+category);
    	
    	BoardDao boardDao = new BoardDao();
    	int allPageNum = boardDao.pageNum();
		System.out.println("allPageNum : "+allPageNum);
		ArrayList<Board> articleList = new ArrayList<Board>();
		if(search == null) {
			articleList = BoardDao.getInstance().getArticleList2(startNum,category);			
		}else {
			articleList = BoardDao.getInstance().getArticleListSearch(startNum,category,search);
		}
        request.setAttribute("articleList", articleList);
        request.setAttribute("startNum", pageNum);
        request.setAttribute("allPageNum", allPageNum);
        request.setAttribute("category", category);
        request.setAttribute("search", search);
        
        return "list2.jsp";
    }

}