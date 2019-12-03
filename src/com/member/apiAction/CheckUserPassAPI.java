package com.member.apiAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.CommandAPI;
import com.dao.MemberDao;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class CheckUserPassAPI implements CommandAPI {

	@Override
	public void requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDao data = new MemberDao();
		Gson gson = new Gson();
		JsonObject object = new JsonObject();

		String pass = request.getParameter("pass");

        if (!data.isMemberPass(pass)) {
        	object.addProperty("result", true);
        } else {
        	object.addProperty("result", false);
        }
        
        String json = gson.toJson(object);

    	PrintWriter out = response.getWriter();

    	response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		out.print(json);
		out.flush();
		out.close();
	}

}
