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

}