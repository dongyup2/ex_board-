package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import vo.Board;

@WebServlet("/regist")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("regForm.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		Board board = Board.builder()
					.title(request.getParameter("title"))
					.content(request.getParameter("content"))
					.writer(request.getParameter("writer"))
					.build();
		
		BoardDao bDao = new BoardDao();
		int result = bDao.regBoard(board);
		
		if(result == 1){
			response.sendRedirect("success.jsp");
		}else{
			response.sendRedirect("fail.jsp");
		}
	}

}

