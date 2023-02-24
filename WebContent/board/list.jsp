<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<html>
<head>
<%
   request.setCharacterEncoding("UTF-8");
   
   int totalRecord = 0; // 전체 레코드 수
   int numPerPage = 10; // 한 페이지 당 보여줄 레코드 수
   int pagePerBlock = 5; // 블록당 페이지 수 [1] [2] [3] [4] [5]
   
   int totalPage = 0; // 전체 몇 페이지가 나올지 미리 계산(글이 65개인데 한페이지당 10개씩 보여주면 7페이지가 나와야 함)
   int totalBlock = 0; // 5페이지 당 1블록이니까 만약 글이 65개면 7페이지이므로 2블럭
   
   int nowPage = 1;
   int nowBlock = 1; //몇번쨰페이지와블럭을 보고 있는지(얘는 1부터 시작, 0이 있을수가 없음)
   
   
   
   
   
   
   if(request.getParameter("nowPage")!=null){
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
      
   
   
   
   int start = 0;
   int end = 0; // DB테이블의 select시작번호(페이지에 해당하는 레코드 수만 가져올수 있도록)
   int listSize = 0; // 현재 읽어온 게시물의 수
   
   start = ((nowPage-1) * numPerPage) + 1; //만약 2페이지를 고르면 11~20까지 나와야하니까 11이나오도록
   end = (nowPage * numPerPage);
   
   
   
   String keyField = "";
   String keyWord = "";
   ArrayList<BoardBean> alist = null;
   if(request.getParameter("keyWord") != null){
      keyWord = request.getParameter("keyWord");
      keyField = request.getParameter("keyField");
   }
   totalRecord = bMgr.getTotalCount(keyField, keyWord);
   
   if(request.getParameter("reload") != null){
      if(request.getParameter("reload").equals("true")){
         keyWord = "";
         keyField = "";
      }
   }
   
   
   
   nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock); // 
   totalPage = (int)Math.ceil((double)totalRecord / numPerPage); //무조건 인트형으로 나누고 1을 더하면 20일때는 2+1 => 3페이지라 이 방법으로는 오류가 생김 올림으로해야됨
   totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
   
   /* System.out.print(start + "/" + end); */
   
   
%>
<script>
   function read(num){
      document.readFrm.num.value = num;
      document.readFrm.action = "read.jsp";
      document.readFrm.submit();
   }

   function block(value){
      //listFrm
      readFrm.nowPage.value = <%=pagePerBlock %>*(value-1)+1;
      readFrm.submit();
   }
   
   function pageing(page){
      readFrm.nowPage.value = page;
      readFrm.submit();
   }
   
   function list(){
      listFrm.action = "list.jsp";
   }
   
   
</script>
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

	<!-- 게시판 -->
	<div class="board_wrap">
		<div class="board_title">
            <strong>합격자 수기</strong>
            <p>합격 노하우 및 공부방법 / TIP을 공유해주세요.</p>
        </div>
<%--         <div style="font-size: 16px; width: 100%">
            	<p style="display: inline-block; margin-left: 790px; margin-bottom: 5px">Total : <%=totalRecord %> Articles(<font color="red"><%=nowPage %>/<%=totalPage %>pages</font>)</p>
            </div> --%>
      	<table width="1000px" style="margin: 0 auto; border-bottom: 1px solid #000;">
         	<div class="board_list">
	         	<div class="top">
	            	<div class="num">번 호</div>
	            	<div class="title">제 목</div>
	            	<div class="writer">이 름</div>
	            	<div class="date">날 짜</div>
	            	<div class="count">조회수</div>
	         	</div>
         	</div>
	        <%
	           alist = bMgr.getBoardList(keyField, keyWord, start, end);
	           listSize = alist.size();
	           if(alist.isEmpty()){
	        %>
	           <div align="center" style="font-size: 16px; padding: 15px 0">
	              <div>찾으시는 글이 없습니다</div>
	           </div>
	        <%
	           }else{
	              for(int i = 0; i < end; i++){
	                 if(i == listSize){
	                    break;
	                 }
	                 
	                 int num = alist.get(i).getNum();
	                 String subject = alist.get(i).getSubject();
	                 int depth = alist.get(i).getDepth();
	                 String name = alist.get(i).getName();
	                 int count = alist.get(i).getCount();
	                 String regDate = alist.get(i).getRegdate().substring(0, 11);
	        %>            
	           <tr>
	              <td align="center" style="font-size: 16px; padding: 15px 0; border-bottom: 1px solid #ddd"><%=i+1 %></td>
	              <td style="width: 60%; text-align: center; padding: 15px 0; border-bottom: 1px solid #ddd">
	                 <%
	                    if(depth>0){
	                       for(int j = 0; j < depth; j++){
	                          out.print(" ");
	                       }
	                    }
	                 %>
	                 <a href="javascript:read('<%=num%>')"><%=subject %></a>
	              </td>
	              <td width="10%" style="text-align: center; font-size: 16px; padding: 15px 0; border-bottom: 1px solid #ddd"><%=name %></td>
	              <td width="10%" style="text-align: center; font-size: 16px; padding: 15px 0; border-bottom: 1px solid #ddd"><%=regDate %></td>
	              <td width="10%" style="text-align: center; font-size: 16px; padding: 15px 0; border-bottom: 1px solid #ddd"><%=count %></td>
	           </tr>
	        <%
	              }
	           }
	        %>
	     </table>
	        
	     <table style="margin: 40px auto" width="800px">
	        <tr>
	           <td align="center">
	<%   
	  //1블록이면 페이지스타트는 1, 2블록이면 6, ...
	  int pageStart = ((nowBlock-1)*pagePerBlock)+1;
	
	  int pageEnd = (pageStart+pagePerBlock <= totalPage) ? (pageStart+pagePerBlock) : totalPage+1;
	  
	  
	  //pre넣기
	  if(totalPage != 0){
	     if(nowBlock > 1){
	    	%>
	           <a href="javascript:block('<%=nowBlock-1 %>')">[<<]</a>
	        <%
	     }
	     out.print("&nbsp;");
	  
	  
	     for(; pageStart < pageEnd; pageStart++){
	%>      
	
	        <div style="text-align: center; display: inline-block; margin-right: 2px"><a href="javascript:pageing('<%=pageStart %>')" >
	        <%if(pageStart == nowPage) {%>
	           <font color="orange">
	        <%} %>
	        [<%=pageStart %>]
	        <%if(pageStart == nowPage) {%>
	           </font>
	        <%} %>
	           
	        </a></div>
	<%
	     }
	     if(totalBlock > nowBlock){
	        %>
	           <a href="javascript:block('<%=nowBlock+1 %>')">[&#62;&#62;]</a>         
	        <%
	     }
	  }
	%>
	           </td>
	
	           <td align="right" width="20%">
	              <a href="post.jsp">[글쓰기]</a>
	              <a href="list.jsp;">[리스트]</a>
	           </td>
	
	        </tr>
	     </table>
	     <hr>
	     <div style="margin: 0 auto" width="500px" align="center">
	        <form action="list.jsp" name="searchFrm" method="get" style="margin-top: 30px">
	           <select name="keyField" style="min-width: 80px; padding: 10px">
	              <option value="name">이름</option>
	              <option value="subject">제목</option>
	              <option value="content">내용</option>
	           </select>
	           <input name="keyWord" required style="min-width: 80px; padding: 10px">
	           <input type="submit" value="찾기" style="min-width: 80px; padding: 10px; background-color: black; border-radius: 2px; color: white; cursor: pointer;">
	           <input type="hidden" name="nowPage" value="1">
	        </form>
	     </div>
	     
	     <!-- 처음눌렀을때 화면을 reload하기 -->
	     <form method="post" name="listFrm">
	        <input type="hidden" name="reload" value="true">
	        <input type="hidden" name="nowPage" value="1">
	     </form>
	     
	     <!-- 자기 자신한테 키워드랑 키필드값 보내서 받아쓸거임 -->
	     <!-- 제목을 누르면 상세보기 페이지 보기 -->
	     <form name="readFrm" method="get">
	        <input type="hidden" name="num">
	        <input type="hidden" name="nowPage" value="<%=nowPage %>">
	        <input type="hidden" name="keyField" value="<%=keyField %>">
	        <input type="hidden" name="keyWord" value="<%=keyWord %>">
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