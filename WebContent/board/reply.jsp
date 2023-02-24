<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session"/>
<%
	String nowPage = request.getParameter("nowPage");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	width: 600px;
	margin: 0 auto;
	background-color: #F3ECB0;
	padding-top: 50px;
}

h4 {
	background-color: #ADE792; 
	text-align: center;
	padding: 5px;
}
table{
	margin: 20px;
}

.td_name input{
	width: 20%;
}

.td_title input{
	width: 90%;
}

.td_pw input{
	width: 30%;
}

textarea {
	resize: none;
	width: 100%;
}

.input_div{
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h4>답변하기</h4>
	<form method="post" name="replyFrm" action="boardReply">
		<table>
			<tr>
				<td>성 명</td>
				<td class="td_name"><input name="name" type="text" value="<%=bean.getName() %>" required></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td class="td_title"><input name="subject" type="text" value="답변 : <%=bean.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td>
					<textarea name="content" rows="10" cols="50"><%=bean.getContent() %>
============== 답변 글을 쓰세요 ==============</textarea>
				</td>
			</tr>
			<tr>
				<td>비밀 번호</td>
				<td class="td_pw"><input name="pass" type="password" required>비밀번호를 입력하세요</td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답변등록">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onclick="history.go(-1);">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="ref" value="<%=bean.getRef() %>">
		<input type="hidden" name="pos" value="<%=bean.getPos() %>">
		<input type="hidden" name="depth" value="<%=bean.getDepth() %>">
	</form>
</body>
</html>