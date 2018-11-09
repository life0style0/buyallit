<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">
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
<link href="/reservationmall/resources/css/template/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="/reservationmall/resources/css/template/owl.carousel.css"
	rel="stylesheet">
<link
	href="/reservationmall/resources/css/template/owl.theme.default.min.css"
	rel="stylesheet">
<link href="/reservationmall/resources/css/template/style.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/reservationmall/resources/js/common/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="/reservationmall/resources/js/hjh/main_top.js"></script>

<!-- JJW css file List -->
<link rel="stylesheet"
	href="/reservationmall/resources/css/jjw/common.css">
<!-- JJW css file List -->
</head>

<body id="page-top">
	<!-- Navigation -->
	<!-- top 네비게이션 -->
	<jsp:include page="/WEB-INF/view/main/main_top.jsp"></jsp:include>
	<!-- Header -->
	<header
		style="background-image: '/reservationmall/resources/images/template/demo/portfolio-7.jpg';">
		<div class="container">
			<div class="slider-container">
				<div class="intro-text">
					<div class="intro-lead-in">Java에 어서오세요!</div>
					<div class="intro-heading">당신에게 포근함을 느낄 수 있는 휴식을 제공합니다.</div>
					<a href="#main" class="page-scroll btn btn-xl">Tell Me More</a>
				</div>
			</div>
		</div>
	</header>

	<section class="light-bg" id="hotelList">
		<div class="container">
		<%
		request.getAttribute("hotelInfos");
		%>
			<c:forEach items="${hotelInfos}" var="hotelInfo">
			  		${hotelInfo}
			</c:forEach>
		</div>
	</section>
	<section class="light-bg" id="hotelList">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>검색 리스트</h2>
						<p>호텔 추천 리스트입니다.</p>
					</div>
				</div>
			</div>
			<div class="row" id="searchHotelList">
				<div class="row hotel-list">
					<div class="col-md-5">
						<img
							src="/reservationmall/resources/images/template/demo/author-2.jpg"
							class="img-responsive center-block" style="height: 200px;">
					</div>
					<div class="col-md-7">
						<h2>
							호텔 이름
							</h3>
							<label class="lead">호텔 가격</label>
							<p class="lead">호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명 호텔 설명 호텔
								설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명</p>
					</div>
				</div>
				<div class="row hotel-list">
					<div class="col-md-5">
						<img
							src="/reservationmall/resources/images/template/demo/author-2.jpg"
							class="img-responsive center-block" style="height: 200px;">
					</div>
					<div class="col-md-7">
						<h2>
							호텔 이름
							</h3>
							<label class="lead">호텔 가격</label>
							<p class="lead">호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명 호텔 설명 호텔
								설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명</p>
					</div>
				</div>
				<div class="row hotel-list">
					<div class="col-md-5">
						<img
							src="/reservationmall/resources/images/template/demo/author-2.jpg"
							class="img-responsive center-block" style="height: 200px;">
					</div>
					<div class="col-md-7">
						<h2>
							호텔 이름
							</h3>
							<label class="lead">호텔 가격</label>
							<p class="lead">호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명 호텔 설명 호텔
								설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명</p>
					</div>
				</div>
			</div>
			<div class="row text-center">
				<button class="btn btn-success">더보기</button>
			</div>
		</div>
	</section>


	<p id="back-top">
		<a href="#top"><i class="fa fa-angle-up"></i></a>
	</p>
	<jsp:include page="/WEB-INF/view/main/main_bottom.jsp"></jsp:include>

	<!-- Modal for portfolio item 1 -->
	<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-1">Dean & Letter</h4>
				</div>
				<div class="modal-body">
					<img
						src="/reservationmall/resources/images/template/demo/portfolio-1.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 2 -->
	<div class="modal fade" id="Modal-2" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-2">Startup Framework</h4>
				</div>
				<div class="modal-body">
					<img
						src="/reservationmall/resources/images/template/demo/portfolio-2.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 3 -->
	<div class="modal fade" id="Modal-3" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-3">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-3">Lamp & Velvet</h4>
				</div>
				<div class="modal-body">
					<img
						src="/reservationmall/resources/images/template/demo/portfolio-3.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 4 -->
	<div class="modal fade" id="Modal-4" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-4">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-4">Smart Name</h4>
				</div>
				<div class="modal-body">
					<img
						src="/reservationmall/resources/images/template/demo/portfolio-4.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 5 -->
	<div class="modal fade" id="Modal-5" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-5">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-5">Fast People</h4>
				</div>
				<div class="modal-body">
					<img
						src="/reservationmall/resources/images/template/demo/portfolio-5.jpg"
						alt="img01" class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
			================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="/reservationmall/resources/js/template/bootstrap.min.js"></script>
	<script
		src="/reservationmall/resources/js/template/owl.carousel.min.js"></script>
	<script
		src="/reservationmall/resources/js/template/cbpAnimatedHeader.js"></script>
	<script src="/reservationmall/resources/js/template/jquery.appear.js"></script>
	<script
		src="/reservationmall/resources/js/template/SmoothScroll.min.js"></script>
	<script
		src="/reservationmall/resources/js/template/mooz.themes.scripts.js"></script>

	<!--======== JJW javascript file List =========-->
	<link rel="stylesheet"
		href="/reservationmall/resources/css/jjw/bootstrap-datetimepicker.css">
	<script type='text/javascript'
		src="/reservationmall/resources/js/jjw/moment-with-locales.min.js"></script>
	<script type='text/javascript'
		src="/reservationmall/resources/js/jjw/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=380ae52ddded1dcd6fc9df096287f781&libraries=services"></script>
	<script src="/reservationmall/resources/js/jjw/common.js"></script>
	<!--======== JJW javascript file List =========-->
</body>

</html>