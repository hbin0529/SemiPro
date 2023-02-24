package board;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.ReplyBean;
import com.kh.ReplyMgr;


@WebServlet("/board/rlist3.me")
public class gudqls2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int borNum = Integer.parseInt(request.getParameter("borNum"));
		ArrayList<ReplyBean> alist = new ReplyMgr().getAllMember(borNum);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(alist, response.getWriter());
	}

}
