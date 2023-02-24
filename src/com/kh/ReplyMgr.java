package com.kh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DB.DBConnectionMgr;

public class ReplyMgr {
	private DBConnectionMgr pool;
	
	public ReplyMgr() {
		pool = DBConnectionMgr.getInstance();
	}	
	
	public ArrayList<ReplyBean> getAllMember(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ArrayList<ReplyBean> alist = new ArrayList<ReplyBean>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM REPLY WHERE NUM = ? ORDER BY REPLY_NUM DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				alist.add(new ReplyBean(rs.getInt(1), 
										rs.getInt(2), 
										rs.getString(3), 
										rs.getString(4), 
										rs.getString(5)));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	
	public int insertReply(ReplyBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO REPLY VALUES(SEQ_REPLY.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getBorNum());
			pstmt.setString(2, bean.getMemId());
			pstmt.setString(3, bean.getContent());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}	
	
	
	
	
	
	
}
