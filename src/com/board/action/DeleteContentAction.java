package com.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.CommandAction;
import com.dao.BoardDao;

public class DeleteContentAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	response.setContentType("text/html; charset=UTF-8");
//      현재 들어간 게시글 번호 불러오야 함
    	HttpSession session = request.getSession();
    	String contentNum = request.getParameter("idx");
    	int contentIdx = Integer.parseInt(contentNum);
        String id = (String) session.getAttribute("ID");
    	
    	int result = 0;
    	result = BoardDao.getInstance().deleteContentArticle(contentIdx,id);

        if(result == 0) {
        	return "deleteContent.jsp";      	
        }else {
        	PrintWriter script = response.getWriter();
        	script.println("<script>alert('로그인 아이디와 댓글 작성자가 다릅니다.')</script>;");
			script.println("<script>location.href='list.do'</script>;");
			script.close();
        	return null;
        }
    }

}
