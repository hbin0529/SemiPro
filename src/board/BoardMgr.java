package board;

import java.io.*;
import DB.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	private DBConnectionMgr pool;
	private static final String SAVEFOLDER = "E:/lhb/jspwork/119homepage/src/main/fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static final int MAX_SIZE = 5*1024*1024; // 5MB
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;	// 파일 사이즈 넣을 변수
		String fileName = null;

		try {
			con = pool.getConnection();
			File file = new File(SAVEFOLDER);
			if(!file.exists())
				file.mkdir();
				
			multi = new MultipartRequest(req, SAVEFOLDER, MAX_SIZE, ENCTYPE, new DefaultFileRenamePolicy());
			
			if(multi.getFilesystemName("filename")!= null) {
				fileName = multi.getFilesystemName("filename");
				fileSize = (int)multi.getFile("filename").length();
			}

			sql = "INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?, 0, SEQ_BOARD.CURRVAL, 0, SYSDATE, ?, ?, 0, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("subject"));
			pstmt.setString(3, multi.getParameter("content"));
			pstmt.setString(4, multi.getParameter("pass"));
			pstmt.setString(5, multi.getParameter("ip"));
			pstmt.setString(6, fileName);
			pstmt.setInt(7, fileSize);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "SELECT COUNT(*) FROM BOARD";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "SELECT COUNT(*) FROM BOARD WHERE " + keyField +" LIKE ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			
			rs = pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
//	보드에 번호 메기는 메소드
	public ArrayList<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ArrayList<BoardBean> alist = new ArrayList<BoardBean>();
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
//				sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY a.ref DESC, a.pos) row_num, a.* FROM board a) b WHERE b.row_num >= ? and b.row_num <= ?";
				sql = "SELECT BT2.* FROM(SELECT ROWNUM R1, BT1.* FROM (SELECT * FROM BOARD ORDER BY REF DESC, POS)BT1)BT2 "
						+ " WHERE R1 >= ? AND R1 <= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {						
				sql = "SELECT BT2.* FROM(SELECT ROWNUM R1, BT1.* FROM (SELECT * FROM BOARD ORDER BY REF DESC, POS)BT1 where " + keyField + " LIKE ? )BT2 "
						+ "WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return alist;
	}
	
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE BOARD SET COUNT = COUNT + 1 WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		BoardBean bean = new BoardBean();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM BOARD WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setSubject(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setPos(rs.getInt(5));
				bean.setRef(rs.getInt(6));
				bean.setDepth(rs.getInt(7));
				bean.setRegdate(rs.getString(8));
				bean.setPass(rs.getString(9));
				bean.setIp(rs.getString(10));
				bean.setCount(rs.getInt(11));
				bean.setFilename(rs.getString(12));
				bean.setFilesize(rs.getInt(13));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	
		return bean;
	}
	
	// 파일 다운로드 시 한글깨짐 방지 및 다운로드 (다운로드 사용할때 가져와서 사용하자) 
	public void downLoad(HttpServletRequest request, HttpServletResponse response, JspWriter out, PageContext pageContext) {
		try {
			String filename = request.getParameter("filename");
			File file = new File(UtilMgr.con(SAVEFOLDER + File.separator + filename));
			byte b[] = new byte[(int)file.length()]; 	// file이 long형이라서 int로 형변환 해줘야한다.
			response.setHeader("Accept-Ranges", "bytes");	// setHeader() : 새롭게 설정한 값으로 덮어 쓴다.
			String strClient = request.getHeader("User-Agent");
			if(strClient.indexOf("MSIE6.0") != -1) {	// IE6
				response.setContentType("application/smnet; charset=UTF-8");
				response.setHeader("Content-Disposition", "filename=" + filename + ";");
			} else {
				response.setContentType("application/smnet; charset=UTF-8");
				response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
			}
			out.clear();
			out = pageContext.pushBody();
			if(file.isFile()) {
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;
				while((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
				fin.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "UPDATE BOARD SET SUBJECT = ?, CONTENT = ? WHERE NUM = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	public boolean deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT COUNT(*) FROM BOARD WHERE REF = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int result = rs.getInt(1);
				if(result == 1) {
					flag = true;
					sql = "SELECT FILENAME FROM BOARD WHERE NUM = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					if(rs.next() && rs.getString(1) != null) {
						File file = new File(SAVEFOLDER + "/" + rs.getString(1));
						if(file.exists())
							UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
//						 if(!rs.getString(1).equals("")) {
//						 }
					}
					
					sql = "DELETE FROM BOARD WHERE NUM = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// 답변의 위치값 증가
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE BOARD SET POS = POS + 1 WHERE REF = ? AND POS > ?";
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	// 답글 달기
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?, 0, NULL, NULL)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1; 
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, pos);
			pstmt.setInt(5, bean.getRef());
			pstmt.setInt(6, depth);
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
	}
	
	public void insert() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO BOARD(NUM, NAME, SUBJECT, CONTENT, POS, REF, DEPTH, REGDATE, COUNT) "
					+ " VALUES(SEQ_BOARD.NEXTVAL, '이름', '제목', '내용', 0, SEQ_BOARD.CURRVAL, 0, '2022/12/08', 0)";
			
			pstmt = con.prepareStatement(sql);
			for(int i = 15; i < 63; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
//	public static void main(String[] args) {
//		new BoardMgr().insert();
//	}
	
}
