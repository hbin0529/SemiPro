<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bMgr" class="board.BoardMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	bMgr.upCount(num);
	
	BoardBean bean = bMgr.getBoard(num);
	String date = bean.getRegdate().substring(0, 16);
	session.setAttribute("bean", bean);
	String id = (String)session.getAttribute("idKey");
	
	/* String memId = request.getParameter("memId"); */
	String content = request.getParameter("content");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
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
<script type="text/javascript">
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
	
	function list() {
		listFrm.submit();
	}
	
	function update() {
		
	}
</script>
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
	
	<!-- 글 보기 -->
	<div class="board_wrap">
		<div class="board_title">
            <strong>합격자 수기</strong>
            <p>합격 노하우 및 공부방법 / TIP을 공유해주세요.</p>
        </div>
        <div class="board_view_wrap">
	        <div class="board_view">
		        <div class="title">
		        	<p><%=bean.getSubject() %></p>
		        </div>
		        <div class="info">
		        	<dl>
		        		<dt>번호</dt>
		        		<dd><%=bean.getNum() %></dd>
		        	</dl>
		        	<dl>
                        <dt>글쓴이</dt>
                        <dd><%=bean.getName() %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%=bean.getRegdate() %></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd><%=bean.getCount() %></dd>
                    </dl>
                    <dl>
                        <dt>첨부파일</dt>
                        <dd>
                        <%
							String filename = bean.getFilename();
							if(filename != null && !filename.equals("")){
						%>
								<a href="javascript:down('<%=filename %>')"> <%=filename %></a>&nbsp;
								<font color="blue">(<%=bean.getFilesize() %> byte)</font>
						<%
							} else {
								out.print("첨부된 파일이 없습니다.");
							}
						%>
                        </dd>
                    </dl>
		        </div>
		        <div class="cont">
		        	<%=bean.getContent() %>
		        </div>
			</div>
		</div>
	</div>
	<div style="width: 1000px; margin: 0 auto">
		<p style="font-size: 16px; text-align: right; margin-bottom: 10px"> 조회수 <%=bean.getCount() %></p>
	</div>
	<div class="bt_wrap" style="text-align: center">
			[ <a href="javascript:list();"> 리스트</a> | 
			<a href="update.jsp?nowPage=<%=nowPage %>&num=<%=num %>">수 정</a> | 
			<a href="delete.jsp?nowPage=<%=nowPage %>&num=<%=num %>">삭 제</a> ]
	</div>
	<form name="downFrm" method="post" action="download.jsp">
		<input type="hidden" name="filename">
	</form>	
	
	<form name="listFrm" method="post" action="list.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<%
			if(!(keyWord==null || keyWord.equals(""))) {
		%>
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<%
			}
		%>
	</form>
	
	<!-- 댓글 -->
	<table border="1" id="reply" align="center" style="width: 800px; margin: 0px auto; padding-top: 50px;">
		<thead style="padding: 10px">
			<tr>
				<th class="replyId"><%=id %></th>
				<th><textarea rows="3" cols="50" id="replyContent" style="width: 100%; padding: 10px;"></textarea></th>
				<th><button onclick="insertReply();" style="padding: 10px">댓글등록</button></th>
				<input type="hidden" id="memId" value="<%=id%>">
			</tr>
		</thead>
		<tbody border="1" style="font-size: 16px; padding: 10px; margin: 10px">
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(function() {
			replyList();
			setInterval(replyList, 5000);
		});
		
		
		function replyList() {
			$.ajax({
				url:"rlist3.me",
				type:"post",
				data:{borNum:<%=num %>},
				success:function(list) {
					let result = "";
					for(var i = 0; i < list.length; i++) {
						result += "<tr>"
								+ "<td>" + list[i].memId + "</td>"
								+ "<td>" + list[i].content + "</td>"
								+ "<td>" + list[i].redate + "</td>"
								+ "</tr>"
					}
					$("#reply tbody").html(result);
				},
				error:function() {
					console.log("Ajax 통신 실패");
				}
			});
		}
		
		// 12.12 시작
		function insertReply(){
			$.ajax({
				url:"insert.do",
				data:{
					content:$("#replyContent").val(),
					borNum:<%=num %>,
					memId:$("#memId").val()				
				},
				type:"post",
				success:function(result){
					if(result > 0) {
						replyList();
						$("#replyContent").val("");
					}
				},
				error:function(){
					console.log("Ajax 통신 실패");
				}
			})
		}
	</script>
	
	
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