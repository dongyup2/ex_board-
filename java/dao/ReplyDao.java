package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jdbc.DBcon2;
import vo.Reply;

public class ReplyDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String sql;
	public int deleteReply(int rno) {
		int result = 0;
		
		return result;
		
	}
	public int registReply(int rno) {
		int result = 0;
		
		return result;
		
	}
	public ArrayList<Reply> getReplyList(int bno) {
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		sql = "select * from tbl_reply where bno=?";
		try {
			con = DBcon2.getConnection();
			pstmt = con.prepareStatement(sql);	
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setBno(rs.getInt("bno"));
				reply.setRno(rs.getInt("rno"));
				reply.setComment(rs.getString("comment"));
				reply.setWriter(rs.getString("writer"));
				reply.setRegdate(rs.getTimestamp("regdate"));
				
				replyList.add(reply);
			}
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		return replyList;
		
		}
	}
}