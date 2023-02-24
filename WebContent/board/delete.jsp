<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bMgr" class="board.BoardMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");	
	boolean result;
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	if(request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");	// 지금 페이지에서 사용자가 입력한 비밀번호
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		
		// 비밀번호가 맞으면 : true  ->  if문 실행
		if(inPass.equals(dbPass)) {
			result = bMgr.deleteBoard(num);
			// 삭제가 되었는지 확인
			if(result) {
				String url = "list.jsp?nowPage=" + nowPage;
				response.sendRedirect(url);
			} else { 
			%>
				<script type="text/javascript">
					alert("답변이 있어서 삭제할 수 없습니다.");
					history.go(-2);
				</script>
			<%	
			}
		}else{
		%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		<%	
			
		}
	} else {
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="../resource/js/jQuery.js"></script>
<link rel="stylesheet" href="../resource/css/boardcss.css?v=<%=System.currentTimeMillis() %>">
<link rel="stylesheet" href="../resource/css/pass.css?v=<%=System.currentTimeMillis() %>">
<!-- 파비콘 로고 -->
<link rel="icon" href="../resource/img/pavicon.png">
<!-- 모달팝업 jquery -->
<script>
        $(document).ready(function( $ ){     
          $(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
          $("#popup01").show();   //팝업 오픈
          $("body").append('<div class="backon"></div>'); //뒷배경 생성
        });
                  
        $("body").on("click", function(event) { 
            if(event.target.className == 'close' || event.target.className == 'backon'){
                  $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
                    $(".backon").hide();
            }
            });
        });
</script>
<!-- 모달팝업 css-->
<style>
    #popup01{
        display: none;
    }
    #popup01{
    width: 500px;
    height: 500px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -220px 0 0 -1150px;
    background-color: #fff;
    z-index: 2;
    }
    
    .backon{
        content: "";
        width: 100%;
        height: 100%;
        background: #00000054;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1;
    }
    
    .close{
      position:absolute;
      top:-25px;
      right: 0;
      cursor:pointer;
    }
    
    .openPopup{
      cursor:pointer;
    }
</style>
<title>대형 게시판 삭제</title>
</head>
<body>
	<!-- 메인헤더 -->
    <div id="header" class="fix up">
		<!-- 헤더 -->
		<div class="header clearfix">
			<!-- TOP 네비 -->
			<div class="top_link">
				<ul class="util clear">
					<li>
						<a href="../index.jsp">HOME</a>
						<span></span>
					</li>
					<% if(id == null) { %>
					<li>
						<a href="../member/login.jsp">로그인</a>
						<span></span>
					</li>
					<li><a href="../member/sign.jsp">회원가입</a></li>
					<%} else { %>
					<li>
						<a href="../member/logout.jsp">로그아웃</a>
					</li>
					<%} %>
				</ul>
			</div>
			<!-- MAIN 네비 -->
			<header>
				<img class="logo" src="../resource/img/logo2.png" alt="로고" onclick="location.href='../index.jsp'">
				<nav>
					<ul class="nav_links">
						<li>
							<a href="#">학원소개</a>
							<ul class="submenu">
								<li>
									<a href="#">원장님 인사말</a>
								</li>
								<li>
									<a href="#">강사진 소개</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">시험정보</a>
							<ul class="submenu">
								<li>
									<a href="#">소방기술사</a>
								</li>
								<li>
									<a href="#">소방시설관리사</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">온라인 강의</a>
							<ul class="submenu">
								<li>
									<a href="#">소방기술사</a>
								</li>
								<li>
									<a href="#">소방시설관리사</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">교재</a>
							<ul class="submenu">
								<li>
									<a href="#">소방기술사</a>
								</li>
								<li>
									<a href="#">소방시설관리사</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">고객센터</a>
							<ul class="submenu">
								<li>
									<a href="#">FAQ</a>
								</li>
								<li>
									<a href="#">자료실</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="list.jsp">합격자 마당</a>
							<ul class="submenu">
								<li>
									<a href="list.jsp">합격자 수기</a>
								</li>
							</ul>
						</li>
					</ul>
				</nav>
			</header>
		</div>
    </div>
	<!-- 퀵메뉴 -->
	<div class="quick_area">
		<div class="title">QUICK MENU</div>
		<div class="linkbox">
			<ul class="quick_list">
				<li class="openPopup">
					<a href="#" class="popup_link wrap">
						<i class="i_kakao"></i>
						<p>카카오톡</p>
					</a>
				</li>
					<div id="popup01">
				        <b><div class="close" style="font-size: 18px; color: #fff; position: absolute;">창닫기</div></b>
				        <p style="text-align: center; background-color: #112453; padding:20px; color: #fff;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">카카오톡 상담</span></b></span></p>
			            <p style="text-align: center; line-height: 1.5;"><br />현재 카톡상담은 불가능합니다</p>
			            <p style="text-align: center; line-height: 1.5; font-size: 30px; margin: 0 auto;"><br /><img src="../resource/img/img89.png" alt="카톡" style="width: 30px; height: 24px;"> test01<br></p>
			            <p style="text-align: center; line-height: 1.5; position: absolute;right:165px ; top: 400px;"><br />모달팝업 기능입니다.</p>
				    </div>
				<li class="openPopup">
					<a href="#" class="popup_link wrap">
						<i class="i_email"></i>
						<p>E-mail 문의</p>
					</a>
				</li>
					<div id="popup01">
				        <b><div class="close" style="font-size: 18px; color: #fff; position: absolute;">창닫기</div></b>
				        <p style="text-align: center; background-color: #112453; padding:20px; color: #fff;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">카카오톡 상담</span></b></span></p>
			            <p style="text-align: center; line-height: 1.5;"><br />현재 E-mail 상담은 불가능합니다</p>
			            <p style="text-align: center; line-height: 1.5; font-size: 30px; margin: 0 auto;"><br /><img src="../resource/img/img88.png" alt="이메일" style="width: 30px; height: 24px;"> test01<br></p>
			            <p style="text-align: center; line-height: 1.5; position: absolute;right:165px ; top: 400px;"><br />모달팝업 기능입니다.</p>
				    </div>
				<li  class="openPopup">
					<a href="#" class="popup_link wrap">
						<i class="i_call"></i>
						<p>전화문의</p>
					</a>
				</li>
					<div id="popup01">
				        <b><div class="close" style="font-size: 18px; color: #fff; position: absolute;">창닫기</div></b>
				        <p style="text-align: center; background-color: #112453; padding:20px; color: #fff;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">카카오톡 상담</span></b></span></p>
			            <p style="text-align: center; line-height: 1.5;"><br />현재 전화상담은 불가능합니다</p>
			            <p style="text-align: center; line-height: 1.5; font-size: 30px; margin: 0 auto;"><br /><img src="../resource/img/img87.png" alt="전화" style="width: 30px; height: 24px;"> test01<br></p>
			            <p style="text-align: center; line-height: 1.5; position: absolute;right:165px ; top: 400px;"><br />모달팝업 기능입니다.</p>
				    </div>
			</ul>
		</div>
		<p class="totop">
			<a title="맨위로" href="#" onclick="$('body,html').animate({scrollTop: 0}, 500);">TOP</a>
		</p>
	</div>










	<!-- 게시판 삭제 -->
	<div class="board_wrap">
		<div class="board_title">
            <strong>게시글 삭제</strong>
        </div>
		<form method="post" name="delFrm" action="delete.jsp">
			<table width="1000px" style="margin: 0 auto; border-bottom: 1px solid #000;">
					<tr style="text-align: center; font-size: 16px;">
						<td><h4 style="margin:10px 0">입력하신 비밀번호를 입력하세요.</h4></td>
					</tr>
					<tr style="text-align: center;">
						<td><input style="padding: 5px;" type="password" align="center" name="pass" required></td>
					</tr>
			</table>
				<div class="bt_wrap" style="text-align: center;">
					<input class="on" style="cursor: pointer;" type="submit" value="삭제완료">
					<input type="reset" style="cursor: pointer;" value="다시쓰기">
					<input type="button" style="cursor: pointer;" value="뒤로" onclick="history.back();">
				</div>
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="num" value="<%=num %>">
		</form>
	</div>
	<!-- 푸터 -->
	<footer id="footer">
		<div class="foot_area box_inner">
			<ul class="foot_list clear">
				<!-- 이용약관 & 개인정보취급방침 -->
				<li><a href="#">이용약관</a><span></span></li>
				<li><a href="#">개인정보취급방침</a><span></span></li>
				<li><a href="#">고객센터</a><span></span></li>
				<li><a href="#">공지사항</a></li>
			</ul>
			<p class="copy box_inner">Copyright&copy; <p class="lhb">LHB</p> all right reserved.</p>
		</div>
	</footer>
<%		
	}
%>
</body>
</html>