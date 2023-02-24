package com.kh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/insert.do")
public class AjaxReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int borNum = Integer.parseInt(request.getParameter("borNum"));
		String memId = request.getParameter("memId");
		String replyContent = request.getParameter("content");
		
		ReplyBean bean = new ReplyBean();
		bean.setBorNum(borNum);
		bean.setMemId(memId);
		bean.setContent(replyContent);
		
		int result = new ReplyMgr().insertReply(bean);
		
		response.getWriter().print(result);
	}

}
