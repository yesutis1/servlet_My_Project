package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.Board;
import com.controller.CommandAction;
import com.dao.BoardDao;

public class ListAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        ArrayList<Board> articleList = BoardDao.getInstance().getArticleList();
        request.setAttribute("articleList", articleList);
        String pageNum = request.getParameter("pages");
        if(pageNum == null) {
        	pageNum="1";
        }
        int boardNum = articleList.size();
        System.out.println("list.jsp?boardNum="+boardNum+"&pages="+pageNum);

        return "list.jsp?boardNum="+boardNum+"&pages="+pageNum;
    }

}
