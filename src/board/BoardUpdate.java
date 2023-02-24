package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		BoardMgr bMgr = new BoardMgr();
		// 기존에 들어있는 bean의 값 가져오기
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		// 사용자로 부터 새롭게 받은 값을 bean에 넣기
		BoardBean upBean = new BoardBean();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
//		System.out.println(request.getParameter("num"));
//		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		
		String inPass = bean.getPass();
		String upPass = request.getParameter("pass");
		/* System.out.println(upPass); */
		if(inPass.equals(upPass)) {
			bMgr.updateBoard(upBean);
			response.sendRedirect("read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum());
		} else { 
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다.');");
			out.print("history.back();");
			out.print("</script>");
		}
		
	}

}
