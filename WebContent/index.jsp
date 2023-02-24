<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="resource/js/jQuery.js"></script>
<link rel="stylesheet" href="resource/css/style.css?v=<%=System.currentTimeMillis() %>">
<link rel="stylesheet" href="resource/css/boardcss.css?v=<%=System.currentTimeMillis() %>">
<link rel="stylesheet" href="resource/css/pass.css?v=<%=System.currentTimeMillis() %>">
<!-- 파비콘 로고 -->
<link rel="icon" href="resource/img/pavicon.png">
<title>대형소방학원</title>
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
						<a href="member/login.jsp">로그인</a>
						<span></span>
					</li>
					<li><a href="member/sign.jsp">회원가입</a></li>
					<%} else { %>
					<li>
						<a href="member/logout.jsp">로그아웃</a>
					</li>
					<%} %>
				</ul>
			</div>
			<!-- MAIN 네비 -->
			<header>
				<img class="logo" src="resource/img/logo2.png" alt="로고" onclick="location.href='index.jsp'">
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
							<a href="board/list.jsp">합격자 마당</a>
							<ul class="submenu">
								<li>
									<a href="board/list.jsp">합격자 수기</a>
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
			            <p style="text-align: center; line-height: 1.5; font-size: 20px; font-weight: bold"><br />현재 카톡상담은 불가능합니다</p>
			            <p style="text-align: center; line-height: 1.5; font-size: 30px; font-weight: bold; margin: 0 auto;"><br /><img src="resource/img/img89.png" alt="카톡" style="width: 30px; height: 24px;"> test01<br></p>
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
			            <p style="text-align: center; line-height: 1.5; font-size: 20px; font-weight: bold""><br />현재 E-mail 상담은 불가능합니다</p>
			            <p style="text-align: center; line-height: 1.5; font-size: 30px; font-weight: bold; margin: 0 auto;"><br /><img src="resource/img/img88.png" alt="이메일" style="width: 30px; height: 24px;"> test01<br></p>
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
			            <p style="text-align: center; line-height: 1.5; font-size: 20px; font-weight: bold""><br />현재 전화상담은 불가능합니다</p>
			            <p style="text-align: center; line-height: 1.5; font-size: 30px; font-weight: bold; margin: 0 auto;"><br /><img src="resource/img/img87.png" alt="전화" style="width: 30px; height: 24px;"> test01<br></p>
			            <p style="text-align: center; line-height: 1.5; position: absolute;right:165px ; top: 400px;"><br />모달팝업 기능입니다.</p>
				    </div>
			</ul>
		</div>
		<p class="totop">
			<a title="맨위로" href="#" onclick="$('body,html').animate({scrollTop: 0}, 500);">TOP</a>
		</p>
	</div>
	<!-- 메인콘텐츠 이미지 -->
	<div id="contents" class="main-contents">
		<section id="imgslide">
			<div id="img">
				<img src="resource/img/img11.jpg" alt="사진1">
				<img src="resource/img/img14.jpg" alt="사진2">
				<img src="resource/img/img13.jpg" alt="사진3">
				<img src="resource/img/img11.jpg" alt="사진1">
			</div>
		</section>
	</div>
	
	<!-- 메인콘텐츠 내용 -->
	<!-- 메인 교재  -->
	<div class="about_area">
		<h2>신규 교재 <b>안내</b></h2>
		<div class="about_box">
			<ul class="place_list box_inner clear">
				<li><a href="#">
					<img class="img_topplace" src="resource/img/book/book1.jpg" alt="그림">
					<h3>소방시설관리사 1차 필기</h3>
					<p class="txt">저자 : 이기덕 원장</p>
					<span class="view">상세보기</span>
				</a></li>

				<li><a href="#">
					<img class="img_topplace" src="resource/img/book/book2.jpg" alt="그림">
					<h3>소방시설관리사 2차 실기</h3>
					<p class="txt">저자 : 이기덕 원장</p>
					<span class="view">상세보기</span>
				</a></li>
				
				<li style="height: 485px"><a href="#">
					<img class="img_topplace" src="resource/img/book/book3.jpg" alt="그림" style="height: 350px">
					<h3>화재안전기준 최신판</h3>
					<p class="txt">저자 : 이기덕 원장</p>
					<span class="view">상세보기</span>
				</a></li>
			</ul>
		</div>
	</div>
	
	
	<!-- 푸터 -->
	<footer id="footer">
		<div class="foot_area box_inner">
			<ul class="foot_list clear" style="margin-top: 300px;">
				<!-- 이용약관 & 개인정보취급방침 -->
				<li><a href="#">이용약관</a><span></span></li>
				<li><a href="#">개인정보취급방침</a><span></span></li>
				<li><a href="#">고객센터</a><span></span></li>
				<li><a href="#">공지사항</a></li>
			</ul>
			<p class="copy box_inner">Copyright&copy; <p class="lhb">LHB</p> all right reserved.</p>
		</div>
	</footer>
</body>
</html>