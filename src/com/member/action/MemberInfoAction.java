package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MemberDao;
import com.dao.MemberInfo;
import com.controller.CommandAction;

public class MemberInfoAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        MemberDao data = new MemberDao();

        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("ID");

        if (id != null) {
            MemberInfo member = data.getMember(id);
            session.setAttribute("member", member);
        }        

        return "member_info.jsp";
    }

}
