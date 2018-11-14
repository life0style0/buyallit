<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
<%
String rememId = null;
String loginId = null;
String loginCheck = null;
Cookie[] cookies = null;

if(request.getCookies()!=null){
	cookies = request.getCookies();
}
if(cookies != null) {
	for(Cookie cookie : cookies) {
		String cookieName = cookie.getName();
		if(cookieName.equals("loginId")) {
			loginId = cookie.getValue();
		}
		if(cookieName.equals("rememId")){
			rememId = cookie.getValue();
		}
		if(cookieName.equals("loginCheck")){
			loginCheck = cookie.getValue();
		}
	}
}

%>

<!-- css for Hyerim -->
<link href="/reservationmall/resources/css/lhr/hyerim.css" rel="stylesheet">

<script type="text/javascript" src="/reservationmall/resources/js/hjh/main_top.js"></script>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="/reservationmall/#page-top"><img src="/reservationmall/resources/images/template/logo.png" alt="Sanza theme logo" href="/reservationmall/#page-top"></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden">
					<a href="#page-top"></a>
				</li>
				<li>
					<a class="page-scroll" href="/reservationmall/#page-top">메인</a>
				</li>
				<li>
					<a class="page-scroll" href="/reservationmall/#search">호텔검색</a>
				</li>
               
				<li>
					<a class="page-scroll" href="/reservationmall/#statisInfo">통계정보</a>
				</li>
				<li>
					<a class="page-scroll" href="/reservationmall/#contact">Contact</a>
				</li>
				<li>
                	<a class="page-scroll" data-toggle="modal" data-target="#notice" id="board">공지사항</a>
                </li>
				 <%
		          if(loginId == null){
				  %>
		         <li>
					<a class="page-scroll" data-toggle="modal" data-target="#loginModal">로그인</a>
				</li>            
		          <%
		          }else{
		          %>
		          	<%
		          	if(loginId.equals("admin")){
		          	%>
		          	<li>
					  <!-- 1107 주현수정 시작 -->
					<a class="page-scroll" id="adminPage" href="/reservationmall/admin/main_board.mall">관리자기능</a>
					</li>
		          	<%	
		          	}else{
		          	%>
		           <li>
					<a class="page-scroll" id="myPage" href="/reservationmall/individual/mypage.mall">MyPage</a>
					</li>
                <!-- 1107 주현수정 끝 -->
					<%
		          	}
					%>
		          <li><a class="page"><%=loginId %> 님</a></li>
		          <li><button type="button" class="btn btn-danger" id="logoutBtn">로그아웃</button></li>
		        
		          <%
		          }
		     	%>
				
				
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>


<!-- 혜림 공지사항 모달 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div class="modal fade" id="notice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">YOGIZOA Notice</h4>
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel">공지사항</h4>
        </div>
        <table class="table table-bordered" id="customers">
          <thead>
            <tr>
              <th style="width: 8%;">번호</th>
              <th>제목</th>
              <th style="width: 11%;">작성자</th>
              <th>작성일</th>
              <th style="width: 11%;">조회수</th>
              <th>상세보기</th>
            </tr>
          </thead>
          <tbody id="abcd">
            <!-- ajax통신을 통해 데이터 추가 -->
          </tbody>
        </table>
        <div class="modal-footer" style="padding: 4px;">
          <button type="button" class="btn btn-default"
            data-dismiss="modal">Close</button>
        </div>

      </div>
    </div>
  </div>
</div>
<!-- 모달 for 공지사항 혜림 수정 끝  -->


 <!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">로그인</h4>
					<span class="hiddenAlert" id='loginAlert' style="display:none; color:red"><u>로그인에 실패했습니다.</u></span>
				</div>
				<form action="/reservationmall/login/controller.mall" name="loginform" method="post">
				<div class="modal-body">
						<div class="form-group">
							<label for="message-text" class="control-label">아이디 :</label>
							<input type="text" class="form-control" name="user_id" id="login_id" required
							<%
							if(rememId != null){
							%>
							value="<%=rememId %>"
							<%
							}
							%>	
							>
							<span class="hiddenAlert" id='idAlert' style="display:none; color:red"><u>아이디를 확인해주세요!</u></span>	
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">비밀번호 :</label>
							<input type="password" class="form-control" name="user_pw" id="login_pw" required>
							<span class="hiddenAlert" id='pwAlert' style="display:none; color:red"><u>비밀번호를 확인해주세요!</u></span>
						</div>
				</div>
				<div class="modal-footer">
					<div class="checkbox">
						<label> <input type="checkbox" name="rememId" value="true"
						<%
						if(rememId != null && rememId.length() != 0 ){
						%>
						checked="checked"
						<%
						}
						%>
						> 아이디를 기억합니다
						</label>
					</div>
					<input type="hidden" name="daoType" value="checkLogin">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" id="loginBtn">로그인</button>
					<button type="button" class="btn btn-info" id="registerBtn">회원가입</button>
				</div>
				</form>
			</div>
		</div>
	</div>
<%
	System.out.println(loginCheck);
	if(loginCheck!=null && loginCheck.equals("fail")){
%>
<script
  src="http://code.jquery.com/jquery-3.3.1.slim.js"
  integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA="
  crossorigin="anonymous"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$('#loginModal').modal({
	backdrop:false
});
document.getElementById("loginAlert").setAttribute("style", "display:block;");
setCookie("loginCheck", "");
</script>
<%
}
%>