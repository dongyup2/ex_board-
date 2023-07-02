package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ReplyDao;
import vo.Board;
import vo.Reply;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _bno = request.getParameter("bno");
		int bno = Integer.parseInt(_bno);
		
		BoardDao boradDao = new BoardDao();
		Board board = boradDao.getBoard(bno);
		
		request.setAttribute("board", board);
		
		ReplyDao replyDao = new ReplyDao();
		ArrayList<Reply> replyList = replyDao.getReplyList(bno);
		request.setAttribute("replyList", replyList);
		
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}

}
