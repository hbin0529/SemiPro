<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대형 회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="../resource/js/script.js?ver=2" charset="UTF-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resource/js/signjQuery.js"></script>
<link rel="stylesheet" href="../resource/css/sign.css?v=<%=System.currentTimeMillis() %>">

<!-- 파비콘 로고 -->
<link rel="icon" href="../resource/img/pavicon.png">
<title>대형 로그인</title>
<script>
function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
			document.getElementById('postcode').value = data.zonecode; // 우편번호
			// document.getElementById('addr').value = data.jibunAddress; // 지번주소
			// document.getElementById('addr').value = data.roadAddress; // 도로명 주소
			roadAddr = data.roadAddress;
			jibunAddr = data.jibunAddress;
			extraAddr = '';		// 왜 만들었나요?
					
			// 도로명 (ㅇㅇ동, 건물명) 출력문
			if(roadAddr != '') {
				if(data.bname != '') {
					extraAddr += data.bname;
				}
				if(data.buildingName != '') {
					extraAddr += (extraAddr != '') ?  ', ' + data.buildingName : data.buildingName;
				}
				
				roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
				document.getElementById('addr').value = roadAddr;
			} else if(jibunAddr != '') {
				document.getElementById('addr').value = jibunAddr;
			}
        }
    }).open();
}
</script>
</head>
<body>
	<!-- MAIN 네비 -->
    <header>
        <img class="logo" src="../resource/img/logo2.png" alt="로고" onclick="location.href='../index.jsp'">
    </header>
    <!-- 회원가입 페이지 -->
	 <div class="login-form">
		<form name="regFrm" method="post" action="signProc.jsp">
			<span>회원정보를 입력해주세요.</span><br><br>
            <input type="text" name="id" class="text-field2" placeholder="아이디" onkeydown="inputIdChk();">
            <input type="button" class="addr-btn" value="ID중복확인" onclick="idCheck(this.form.id.value);">
            <input type="hidden" name="idbtncheck" value="idUncheck">
            <input type="password" name="password" class="text-field" placeholder="비밀번호">
            <input type="password" name="repassword" class="text-field" placeholder="비밀번호 확인">
            <input type="text" name="name" class="text-field" placeholder="이름">
            <input type="text" name="phone" class="text-field" placeholder="휴대폰 번호">
            <input type="text" name="email" class="text-field" placeholder="이메일">
            <input type="text" name="zipcode" class="text-field" id="postcode" placeholder="우편번호찾기" readonly>
            <input type="button" value="우편번호찾기" class="addr-btn" onclick="findAddr();">
            <input type="text" name="address" class="add_input" placeholder="주소" id="addr" readonly>
            <input type="text" name="detailAddress" class="text-field" placeholder="상세주소">
            <input type="button" class="sign-btn" value="회원가입" onclick="inputCheck();">
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
</body>
</html>