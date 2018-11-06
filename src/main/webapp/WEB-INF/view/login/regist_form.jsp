<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="favicon.ico">
	<title>Java - 아름다운 추억을 코딩하세요</title>
	<!-- Bootstrap core CSS -->
	<link href="/reservationmall/resources/css/template/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Custom styles for this template -->
	<link href="/reservationmall/resources/css/template/owl.carousel.css" rel="stylesheet">
	<link href="/reservationmall/resources/css/template/owl.theme.default.min.css"  rel="stylesheet">
	<link href="/reservationmall/resources/css/template/style.css" rel="stylesheet">
	<link href="/reservationmall/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript" src="/reservationmall/resources/js/common/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="/reservationmall/resources/js/hjh/main_top.js"></script>
</head>
<body>
	<!-- top 네비게이션 -->
	<jsp:include page="/WEB-INF/view/main/basic_top.jsp"></jsp:include>
	<header style="background-image:'/reservationmall/resources/images/login/regist_main.jpg';">
			<div class="container">
				<div class="slider-container">
					<div class="intro-text">
						<div class="intro-lead-in">YogiZoa와 함께하세요</div>
						<div class="intro-heading">여러분의 입장에서 소중한 추억을 만들 수 있도록 노력하겠습니다.</div>
					</div>
				</div>
			</div>
	</header>
		<div style="height:50px"></div>
		<div id="ww">
		<div class="container">
			<form name="registForm" action="/jsp/login/regist_proc.jsp" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">아이디</label> 
					<input type="text"
						class="form-control" id="regist_id" name="user_id"
						placeholder="6~10자 영문자/숫자 가능">
					<input type="hidden" id="idCheckHidden" name="idCheckHidden" value="false">
					<span class="hiddenAlert" id="regist_idAlert" name="alertGroup" style="display:none; color:red">
						<u>아이디를 확인해주세요!</u>
					</span>
					<span class="hiddenAlert" id="idCheckAlert"  name="alertGroup" style="display:none; color:red">
						<u>아이디 중복검사를 해주세요!</u>
					</span>
					<span class="hiddenAlert" id="idChangeAlert"  name="alertGroup" style="display:none; color:red">
						<u>아이디가 변경되었습니다. 다시 중복검사를 해주세요!</u>
					</span>
					<button type="button" class="btn btn-danger" id="idCheck">아이디 중복확인</button>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">비밀번호</label> 
					<input type="password"
						class="form-control" id="regist_pass" name="user_pw"
						placeholder="4~10자 사이로 입력해주세요">
					<span class="hiddenAlert" id='regist_pwAlert' name="alertGroup" style="display:none; color:red">
						<u>비밀번호를 확인해주세요!</u>
					</span>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">비밀번호확인</label> <input type="password"
						class="form-control" id="regist_passcheck">
					<span class="hiddenAlert" id='regist_pwAlertSec' name="alertGroup" style="display:none; color:red">
						<u>비밀번호를 한번 더 입력해주세요</u>
					</span>
					<span class="hiddenAlert" id='regist_pwChckAlert' name="alertGroup" style="display:none; color:red">
						<u>비밀번호가 일치 하지 않습니다.!</u>
					</span>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">이름</label> <input type="text"
						class="form-control" id="regist_name" name="name">
					<span class="hiddenAlert" id='regist_nameAlert' name="alertGroup" style="display:none; color:red">
						<u>이름을 확인해주세요!</u>
					</span>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">전화번호</label> <input type="email"
						class="form-control" id="regist_phonnum" name="email"
						placeholder="전화번호를 입력하세요">
					<span class="hiddenAlert" id='regist_phonnumAlert' name="alertGroup" style="display:none; color:red">
						<u>전화번호를 확인해주세요!</u>
					</span>
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">이메일</label> <input type="email"
						class="form-control" id="regist_email" name="email"
						placeholder="이메일을 입력하세요">
					<span class="hiddenAlert" id='regist_emailAlert' name="alertGroup" style="display:none; color:red">
						<u>이메일을 확인해주세요!</u>
					</span>
				</div>
<!-- 				<div class="form-group">
					<label for="exampleInputFile">프로필 사진 선택</label> <input type="file"
						id="imageFile" onchange="sizeCheck(this);typeCheck(this)">
					<p class="help-block">자신을 대표할 수 있는 이미지를 등록해주세요.</p>
					<span class="hiddenAlert" id='fileSizeAlert' name="alertGroup" style="display:none; color:red">
						<u>파일의 크기는 4MB이하만 가능합니다!</u>
					</span>
					<span class="hiddenAlert" id='fileTypeAlert' name="alertGroup" style="display:none; color:red">
						<u>확장자는 jpg만 가능합니다!</u>
					</span>
				</div> -->
				
				<button type="button" class="btn btn-success" id="registSubmitBtn">가입하기</button>
				<button type="reset" class="btn btn-danger" id="resetBtn">다시 입력</button>
			</form>
		</div>
		<!-- /container -->
	</div>
	<!-- /ww -->
	<div style="height:50px"></div>
	<!-- bottom네비게이션 -->
	<jsp:include page="/WEB-INF/view/main/main_bottom.jsp"></jsp:include>
	
		<!-- Bootstrap core JavaScript
		================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="/reservationmall/resources/js/template/bootstrap.min.js"></script>
	<script src="/reservationmall/resources/js/template/owl.carousel.min.js"></script>
	<script src="/reservationmall/resources/js/template/cbpAnimatedHeader.js"></script>
	<script src="/reservationmall/resources/js/template/jquery.appear.js"></script>
	<script src="/reservationmall/resources/js/template/SmoothScroll.min.js"></script>
	<script src="/reservationmall/resources/js/template/mooz.themes.scripts.js"></script>
</body>

</html>