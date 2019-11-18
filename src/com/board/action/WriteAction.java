package com.board.action;

import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.CommandAction;

public class WriteAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        String id = (String) request.getAttribute("ID");
        if(id == null || id=="") {
        	String alert = "로그인 해주세요.";
            request.setAttribute("message", alert);
            // response.sendRedirect(rPath+"/home.do");   
        }
    	return "write.jsp";
    }
}
