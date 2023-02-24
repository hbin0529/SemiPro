<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String msg = "로그인 실패!";
	String url = "login.jsp";
	
	boolean result = mMgr.loginMember(id, password);
	if(result) {
		session.setAttribute("idKey", id);
		msg = "로그인 되었습니다!";
		url = "../index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>
</head>
<body>

</body>
</html>