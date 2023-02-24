package com.kh;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/rlist.me")
public class AjaxReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int borNum = Integer.parseInt(request.getParameter("borNum"));
		ArrayList<ReplyBean> alist = new ReplyMgr().getAllMember(borNum);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(alist, response.getWriter());
	}

}
