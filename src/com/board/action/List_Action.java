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
    	int startNum = 0;
    	String pageNum = request.getParameter("page");
    	startNum = Integer.parseInt(pageNum)*10;
    	System.out.println("String : "+pageNum);
    	System.out.println("int : "+startNum);
    	
    	BoardDao boardDao = new BoardDao();
    	int allPageNum = boardDao.pageNum();
    	System.out.println(allPageNum);
    	
        ArrayList<Board> articleList = BoardDao.getInstance().getArticleList2(startNum);
        request.setAttribute("articleList", articleList);
        request.setAttribute("startNum", pageNum);
        request.setAttribute("allPageNum", allPageNum);
        return "list2.jsp";
    }

}