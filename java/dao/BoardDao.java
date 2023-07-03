package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.DBcon2;
import vo.Board;

public class BoardDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String sql;
	
	public int regBoard(Board board) {
		int result = 0;
		sql = "INSERT INTO tbl_board VALUES(null,?,?,?,now(),null)";
		try {
			con = DBcon2.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,board.getTitle());
			pstmt.setString(2,board.getContent());
			pstmt.setString(3,board.getWriter());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	public ArrayList<Board> getBoardList(){
		ArrayList<Board> boardList = new ArrayList<Board>();
		sql = sql = "SELECT b.bno, b.title, b.content, b.writer, b.regdate, b.moddate, r.replyCnt"
				+ " FROM tbl_board b LEFT JOIN v_reply r" + " ON b.bno = r.bno" + " ORDER BY bno DESC";
		try {
			con = DBcon2.getConnection();
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setBno(rs.getInt("bno"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWriter(rs.getString("writer"));
				board.setRegdate(rs.getTimestamp("regdate"));
				board.setModdate(rs.getTimestamp("moddate"));
				board.setReplyCnt(rs.getInt("replyCnt"));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return boardList;	
	}
}
