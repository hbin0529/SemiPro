function idCheck(id) {
	regFrm.idbtncheck.value = "idCheck";
	if(id == "") {
		alert("아이디를 입력하세요");
		regFrm.id.focus();
		return;
	}
	url = "idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300, height=200");
}

function inputIdChk() {
	regFrm.idbtncheck.value="idUncheck";
}

function inputCheck() {
	if(regFrm.idbtncheck.value == "idUncheck") {
		alert("아이디 중복체크를 해주세요");
		return;
	}
	
	if(regFrm.id.value == "") {
		alert("아이디를 입력하세요");
		regFrm.id.focus();
		return;
	}
	
	if(regFrm.password.value == "") {
		alert("비밀번호를 입력하세요");
		regFrm.password.focus();
		return;
	}
	
	if(regFrm.password.value != regFrm.repassword.value) {
		alert("비밀번호가 일치하지않습니다.");
		regFrm.repassword.focus();
		return;
	}
	
	if(regFrm.name.value == "") {
		alert("이름을 입력하세요");
		regFrm.name.focus();
		return;
	}
	
	if(regFrm.phone.value == "") {
		alert("연락처를 입력하세요");
		regFrm.phone.focus();
		return;
	}
	
	if(regFrm.email.value == "") {
		alert("이메일을 입력하세요");
		regFrm.email.focus();
		return;
	}
	
	if(regFrm.address.value == "") {
		alert("주소를 입력하세요");
		regFrm.address.focus();
		return;
	}
	
	if(regFrm.detailAddress.value == "") {
		alert("상세주소를 입력해주세요");
		regFrm.detailAddress.focus();
		return;
	}
	
	regFrm.submit();
}
