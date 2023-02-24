package member;

import java.sql.*;
import DB.*;
import java.util.ArrayList;

public class MemberMgr {
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
//	로그인 메소드 (아이디, 비밀번호)
	public boolean loginMember(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM MEMBER WHERE MEM_ID = ? AND MEM_PW = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);	// 오류 날시 pw ? pwd ? 확인
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	
//	아이디 중복 체크 메소드
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM MEMBER WHERE MEM_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO MEMBER VALUES(?, SEQ_MEMNUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, bean.getId());
	        pstmt.setString(2, bean.getPassword());
	        pstmt.setString(3, bean.getName());
	        pstmt.setString(4, bean.getPhone());
	        pstmt.setString(5, bean.getEmail());
	        pstmt.setString(6, bean.getZipcode());
	        pstmt.setString(7, bean.getAddress());
	        pstmt.setString(8, bean.getDetailAddress());
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
}
