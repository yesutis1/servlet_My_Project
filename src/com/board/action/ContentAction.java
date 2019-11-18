package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.controller.CommandAction;
import com.dao.BoardDao;

public class ContentAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int idx = Integer.parseInt(request.getParameter("idx"));
        
        ArrayList<Board> articleList = BoardDao.getInstance().getArticleList(idx);
        ArrayList<Board> articleContent = BoardDao.getInstance().getArticleContent(idx);
        request.setAttribute("articleList", articleList);
        request.setAttribute("articleContent", articleContent);
        request.setAttribute("idx",idx);
        return "content.jsp";
    }

}
