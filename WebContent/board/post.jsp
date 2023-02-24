<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
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
<title>대형 게시판</title>
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
						<a href="index.jsp">HOME</a>
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

	<!-- 글쓰기 -->
	<div class="board_wrap">
		<div class="board_title">
            <strong>합격자 수기</strong>
            <p>합격 노하우 및 공부방법 / TIP을 공유해주세요.</p>
        </div>
		<form method="post" enctype="multipart/form-data" name="postFrm" action="boardPost">
			<table width="1000px" style="margin: 0 auto; border-bottom: 1px solid #000;">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>제 목</dt>
						<dd><input name="subject" type="text"></dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>성 명</dt>
						<dd><input name="name" type="text" value="<%=id %>" readonly></dd>
					</dl>
					<dl>
						<dt>비밀 번호</dt>
						<dd><input name="pass" type="password"></dd>
					</dl>
					<dl>
						<dt>파일찾기</dt>
						<dd><input type="file" name="filename"></dd>
					</dl>
                </div>
					<div class="cont">
                		<textarea name="content" placeholder="내용 입력"></textarea>
                	</div>
            </div>
			</table>
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
			<br>
			<br>
			<div class="bt_wrap" style="text-align: center;">
				<input style="cursor: pointer;" type="submit" value="등록" class="on">&emsp;
				<input style="cursor: pointer;" type="button" value="리스트" onclick="location.href='list.jsp'">
			</div>
		</form>
	</div>
</body>
</html>