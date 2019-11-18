package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.CommandAction;
import com.dao.BoardDao;

public class DeleteContentAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//      현재 들어간 게시글 번호 불러오야 함
    	HttpSession session = request.getSession();
    	String contentNum = request.getParameter("idx");
    	System.out.println("String a = "+contentNum);
    	int contentIdx = Integer.parseInt(contentNum);
    	System.out.println("Integer a = "+contentIdx);
    	
      BoardDao.getInstance().deleteContentArticle(contentIdx);
			
        return "deleteContent.jsp";
    }

}
