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
<script src="../resource/js/jQuery.js"></script>
<link rel="stylesheet" href="../resource/css/login.css">
<!-- 파비콘 로고 -->
<link rel="icon" href="../resource/img/pavicon.png">
<title>대형 로그인</title>
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
					<li>
						<a href="login.jsp">로그인</a>
						<span></span>
					</li>
					<li><a href="sign.jsp">회원가입</a></li>
				</ul>
			</div>
			<!-- MAIN 네비 -->
			<header>
				<img class="logo" src="../resource/img/logo2.png" alt="로고" onclick="location.href='../index.jsp'">
			</header>
		</div>
    </div>
<%
	if(id != null){
%>
		<h3><%=id %> 님 방가방가</h3>
		<h3>즐거운 하루 되세요!!</h3>
		<a href="logout.jsp">로그아웃</a>
<%
	} else {
%>
		<!-- 로그인 페이지 -->
	    <div class="login-form">
	        <form name="loginFrm" method="post" action="loginProc.jsp">
	            <input type="text" name="id" class="text-field" placeholder="아이디" required>
	            <input type="password" name="password" class="text-field" placeholder="비밀번호" required>
	            <input type="submit" class="submit-btn" value="로그인">
	            <input type="button" class="sign-btn" value="회원가입" onclick="location.href='sign.jsp'">
	        </form>
	
	        <div class="links">
	            <a href="#">비밀번호를 잊어버리셨나요?</a>
	        </div>
	    </div>
<%		
	}
%>
	</table>
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
</body>
</html>