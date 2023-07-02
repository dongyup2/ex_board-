package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import vo.Board;

@WebServlet("/modify")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String param_bno = request.getParameter("bno");
		int bno = Integer.parseInt(param_bno);
		
		Board board = new Board();
		board.setBno(bno);
		board.setTitle(title);
		board.setContent(content);
		
		BoardDao bDao = new BoardDao();
		int result = bDao.updateBoard(board);
		
		if(result == 1){
			response.sendRedirect("boardList.jsp?m=1");
		}else{
			response.sendRedirect("detail.jsp?bno=" + bno + "&mode=0");
		}
	}
}
