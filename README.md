# 대형소방학원
> CRUD 게시판 사이트

<br>

## 메인 페이지

<img src="https://user-images.githubusercontent.com/114133335/225570433-226109cb-c324-4296-88db-b1f046717882.jpg" width="800" height="600"/>

<br>

## 기간
> 2022.12.12 ~ 2022.12.21(10일)
<br>

## 개발환경
> * Java 1.8
> * Oracle DB
> * Jsp
> * Javascript(jQuery, ajax)
> * Apache Tomcat9.0
<br>

## 주요기능
> * 커뮤니티 : CRUD 게시판, 페이징 처리, 댓글, 검색
> * 회원가입 : 회원가입 및 로그인
<br>

## ERD 다이어그램
<p align="center">
<img src="https://user-images.githubusercontent.com/114133335/225570147-0eb6c3c8-4a1c-4427-98bd-20767833cdec.JPG" width="800" height="400"/>
</p>
<br>

## 실행화면
> * 게시판 : 글쓰기, 글삭제, 글수정, 댓글, 댓글삭제가 가능합니다. <br>
글쓰기를 눌러서 필요한 정보를 작성 후 작성완료 버튼을 누르면 DB에 저장되고 리스트에 보여지게 됩니다.
<br>
<p align="center">
<img src="https://user-images.githubusercontent.com/114133335/224043093-e6847ad8-c117-4b9f-92f7-643469e18d6a.jpg" width="800" height="400"/>
</p>
<br>

> * 상세게시판
<br>
<p align="center">
 <img src="https://user-images.githubusercontent.com/114133335/224043144-e4d53eb4-1c02-4b1b-a285-1e1fc9329138.jpg" width="800" height="400"/>
</p>
<br>

> * 로그인 : UI 창에서 입력된 <b>아이디, 비밀번호</b>를 이용하여 로그인을 진행합니다. <br>
응답이 실패했을 경우, 각 상황에 맞게 메시지를 가공하여 보여주며 회원가입을 통하여 테이블에 저장되어 있는 데이터를 불러오고 <br>입력한 아이디 및 비밀번호가 맞는다면 <b>‘로그인 되었습니다!’</b> 라는 문구가 등장하며 메인 페이지로 이동하게 됩니다.

<br>
<p align="center">
 <img src="https://user-images.githubusercontent.com/114133335/225567888-40cfa5ec-4f8b-44e2-be8e-46927d5414ec.jpg" width="300" height="400"/>
</p>
<br>

> * 회원가입 : 제일 처음 아이디입니다. 값을 입력하지 않고 ID 중복 확인을 누르면, 자바스크립트를 이용하여 포커스를 아이디에 맞춰주었습니다.<br>
우편주소는 카카오 API를 이용하여 우편번호 찾기를 눌러 나의 주소를 검색 후 상세주소를 입력하여 회원가입을 누르게 된다면 signProc.jsp 파일로 전송되고 입력한 형식이 맞는다면 정상적으로 MEMBER 테이블에 저장되며 <b>'회원가입이 완료되었습니다'</b> 라는 <br> 문구 창이 등장합니다.
<br>
<p align="center">
 <img src="https://user-images.githubusercontent.com/114133335/225567776-98fc4a95-fd21-418c-a856-f4dc90f16886.jpg" width="300" height="400"/>
</p>

<br>
<br>

## 마치며
> 첫 프로젝트 10일이라는 기간 동안 무엇을 만들지 생각을 많이 하였고, <br>프로젝트를 계획하고 개발을 홀로 진행하며 전체적인 프로젝트 사이클을 이해하는 단계였습니다.<br>
> 회원가입만 한다면 동영상을 무료로 들을 수 있는 학원 사이트를 만들고, 책을 구매 및 결제하는 사이트로 만들고 싶었습니다.<br>
> 하지만, 처음 계획했던 바와 다르게 [지식 부족] [능력 부족] [시간 부족] 이라는 핑계 아닌 핑계로 많이.. 정말 많이 축약된 프로젝트입니다.<br>
> <br>
> 이 프로젝트를 <b>시작의 발판으로 더욱더 노력하여 성장하는 개발자</b>가 되겠습니다.<br>
> <br>
> 끝까지 읽어주셔서 감사합니다.<br>

