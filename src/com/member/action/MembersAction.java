package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.CommandAction;
import com.dao.MemberDao;
import com.dao.MemberInfo;

public class MembersAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");	
		MemberDao data = new MemberDao();

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("ID");
		if(!id.equals("admin")) {
//			관리자가 아니다
		}

		if (id != null) {
			MemberInfo member = data.getMember(id);
			session.setAttribute("member", member);
		}    
		return "members.jsp";
	}

}
