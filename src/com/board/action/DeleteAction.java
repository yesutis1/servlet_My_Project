package com.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.CommandAction;
import com.dao.BoardDao;

public class DeleteAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	response.setContentType("text/html; charset=UTF-8");
        int idx = Integer.parseInt(request.getParameter("idx"));
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("ID");
        
        int result = 0;
        result = BoardDao.getInstance().deleteArticle(idx, id);
        if(result == 0) {        	
        	return "delete.jsp";        	
        }else {
        	PrintWriter script = response.getWriter();
        	script.println("<script>alert('로그인 아이디와 게시글 작성자가 다릅니다!!.')</script>;");
			script.println("<script>location.href='list.do'</script>;");
			script.close();
        	return null;
        }
    }

}
