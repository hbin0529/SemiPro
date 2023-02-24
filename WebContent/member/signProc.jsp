<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mMgr" class="member.MemberMgr"></jsp:useBean>
<jsp:useBean id="bean" class="member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mMgr.insertMember(bean);
	String msg = "회원가입에 실패 하였습니다";
	String url = "sign.jsp";
	if(result) {
		msg = "회원가입이 완료 되었습니다";
		url = "../index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>
</head>
<body>
	
</body>
</html>