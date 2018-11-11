<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>관리자 모드</title>
	<!-- Bootstrap core CSS -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Custom styles for this template -->
	<link href="/reservationmall/resources/css/template/owl.carousel.css" rel="stylesheet">
	<link href="/reservationmall/resources/css/template/owl.theme.default.min.css" rel="stylesheet">
	<link href="/reservationmall/resources/css/template/style.css" rel="stylesheet">
	<link href="/reservationmall/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=aba8nx_n3O9CvAauIsql&amp;submodules=panorama,geocoder,drawing,visualization"></script>


	<!-- JJW css file List -->
	<link rel="stylesheet" href="/reservationmall/resources/css/jjw/common.css">
	<!-- JJW css file List -->



</head>

<body>
	<c:forEach items="${hotelInfos}" var="hotelInfo">
		<c:forEach items="${hotelInfo.rooms}" varStatus="roomnum" var="rooms">
			<c:if test="${roomnum.count ==1}">

				<c:forEach items="${rooms.value}" var="room">
					<c:forEach items="${room.detail}" var="detail">
					</c:forEach>
				</c:forEach>
			</c:if>
		</c:forEach>
	</c:forEach>
	<%-- 	<c:forEach items="${hotelInfos}" var="hotelInfo">
	<c:forEach items="${hotelInfo.rooms}" var="rooms">
	${rooms.value}
	</c:forEach>
	</c:forEach> --%>

	<section>
		<div class="container">
			<div class="row">
				<form action="/reservationmall/hotel/searchhotel.mall" method="POST" id="searchForm">
					<div class="col-md-2">
						<div class="form-group">
							<label>검색 타입</label> <select class="form-control " name="searchValueType" id="searchValueType">
								<c:choose>
									<c:when test="${searchValueType} == 'searchLocation'">
										<option value="searchLocation" selected>지역</option>
									</c:when>
									<c:otherwise>
										<option value="searchLocation">지역</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${searchValueType} == 'searchHotel'">
										<option value="searchHotel" selected>호텔 이름</option>
									</c:when>
									<c:otherwise>
										<option value="searchHotel">호텔 이름</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${searchValueType} == 'searchLocation'">
										<option value="searchLocation" selected>지역</option>
									</c:when>
									<c:otherwise>
										<option value="searchLocation">지역</option>
									</c:otherwise>
								</c:choose>
								<option value="searchHotelType">호텔 타입</option>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>검색 내용</label> <input type="search" class="form-control" placeholder="검색하고 싶은 내용을 입력하세요" id="searchValueInput"
							 value="${searchValue}"> <input type="hidden" name="searchValue" id="searchValueInputHidden" value="${searchValue}">
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label>입실 날짜</label>
							<div class='input-group date' id='datetimepicker1'>
								<input type='text' class="form-control " name="searchStartDay" value="${searchStartDay}" /> <span class="input-group-addon">
									<span class="fa fa-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label>퇴실 날짜</label>
							<div class='input-group date' id='datetimepicker2'>
								<input type='text' class="form-control " name="searchEndDay" value="${searchEndDay}" /> <span class="input-group-addon">
									<span class="fa fa-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label>일정</label>
							<div class='input-group date'>
								<p id="betweenDay" style="margin-bottom: 12px;">
									<strong>1박 2일</strong>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label>객실 수</label> <select class="form-control " id="roomNumber2" name="searchRoomNumber">
								<option ${searchRoomNumber==1 ? 'selected' : '' }>1</option>
								<option ${searchRoomNumber==2 ? 'selected' : '' }>2</option>
								<option ${searchRoomNumber==3 ? 'selected' : '' }>3</option>
								<option ${searchRoomNumber==4 ? 'selected' : '' }>4</option>
								<option ${searchRoomNumber==5 ? 'selected' : '' }>5</option>
								<option ${searchRoomNumber==6 ? 'selected' : '' }>6</option>
							</select> <input type="hidden" id="roomNumberHidden" value="${searchRoomNumber}">
						</div>
					</div>
					<div class="col-md-3" id="roomNumberAnchor">
						<c:forEach begin="1" end="${searchRoomNumber}" var="i">
							<c:forEach items="${searchAdultNumber}" var="adultNumber" varStatus="adultNumberStatus">
								<c:if test="${adultNumberStatus.count == i}">
									<div class="col-md-6">
										<div class="form-group">
											<label>어른 수</label> <select class="form-control" name="searchAdultNumber">
												<option ${adultNumber==1 ? 'selected' : '' }>1</option>
												<option ${adultNumber==2 ? 'selected' : '' }>2</option>
												<option ${adultNumber==3 ? 'selected' : '' }>3</option>
												<option ${adultNumber==4 ? 'selected' : '' }>4</option>
												<option ${adultNumber==5 ? 'selected' : '' }>5</option>
												<option ${adultNumber==6 ? 'selected' : '' }>6</option>
												<option ${adultNumber==7 ? 'selected' : '' }>7</option>
												<option ${adultNumber==8 ? 'selected' : '' }>8</option>
												<option ${adultNumber==9 ? 'selected' : '' }>9</option>
											</select>
										</div>
									</div>
								</c:if>
							</c:forEach>
							<c:forEach items="${searchChildNumber}" var="childNumber" varStatus="childNumberStatus">
								<c:if test="${childNumberStatus.count == i}">
									<div class="col-md-6">
										<div class="form-group">
											<label>아이 수</label> <select class="form-control" name="searchChildNumber">
												<option ${childNumber==0 ? 'selected' : '' }>0</option>
												<option ${childNumber==1 ? 'selected' : '' }>1</option>
												<option ${childNumber==2 ? 'selected' : '' }>2</option>
												<option ${childNumber==3 ? 'selected' : '' }>3</option>
												<option ${childNumber==4 ? 'selected' : '' }>4</option>
												<option ${childNumber==5 ? 'selected' : '' }>5</option>
												<option ${childNumber==6 ? 'selected' : '' }>6</option>
												<option ${childNumber==7 ? 'selected' : '' }>7</option>
												<option ${childNumber==8 ? 'selected' : '' }>8</option>
												<option ${childNumber==9 ? 'selected' : '' }>9</option>
											</select>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label style="visibility: hidden;">hidden</label> <input class="btn btn-primary" type="button" data-toggle="collapse"
							 data-target="#collapseSearch" aria-expanded="false" aria-controls="collapseSearch" id="searchExtra" value="추가 검색 옵션">
						</div>
					</div>
					<div class="col-md-5 collapse" id="collapseSearch">
						<div class="col-md-5">
							<div class="form-group">
								<label>평점 검색</label> <select class="form-control " name="searchRateType">
									<option value="searchAllRate" ${searchRateType=='searchAllRate' ? 'selected' : '' }>전체
										별점 평균</option>
									<option value="searchPriceRate" ${searchRateType==searchPriceRate ? 'selected' : '' }>가격
										별점 평균</option>
									<option value="searchCleanRate" ${searchRateType==searchCleanRate ? 'selected' : '' }>청결도
										별점 평균</option>
									<option value="searchServiceRate" ${searchRateType==searchServiceRate ? 'selected' : '' }>서비스
										별점 평균</option>
									<option value="searchFoodRate" ${searchRateType==searchFoodRate ? 'selected' : '' }>음식
										별점 평균</option>
									<option value="searchLocationRate" ${searchRateType==searchLocationRate ? 'selected' : '' }>위치
										별점 평균</option>
								</select>
							</div>
						</div>
						<div class="col-md-7">
							<div class="form-group">
								<label style="visibility: hidden;">hidden</label> <input type="text" class="form-control " name="searchHotelRate"
								 placeholder="호텔 최소 별점을 입력해주세요" value="${searchHotelRate}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>최소 비용</label> <input type="text" class="form-control " name="searchMinMoney" placeholder="최소 비용을 입력해주세요"
								 value="${searchMinMoney}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>최대 비용</label> <input type="text" class="form-control " name="searchMaxMoney" placeholder="최대 비용을 입력해주세요"
								 value="${searchMaxMoney}">
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<input type="button" value="검색" class="form-control btn-success" id="searchHotelButton">
					</div>
				</form>
			</div>
		</div>
	</section>


	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>검색 결과</h2>
						<p>요기조아 만의 차별화된 검색으로 고객님의 행복을 찾아 드립니다.</p>
					</div>
				</div>
			</div>
			<div class="row row-0-gutter" id="owl-search-num">
				<c:forEach items="${hotelList}" var="hotel">
					<c:forEach items="${hotelInfos}" var="hotelInfo" varStatus="hotelnum">
						<c:if test="${hotelInfo.hotelId == hotel.hotel_id}">
							<!-- start portfolio item -->
							<div class="col-md-4 col-0-gutter">
								<div class="ot-portfolio-item">
									<figure class="effect-bubba">
										<img src="/reservationmall/resources/images/hotels/hotel_${hotel.hotel_id}.jpg" alt="img02" class="img-responsive" />
										<figcaption>
											<h2>${hotel.hotel_name}</h2>
											<p>${hotel.hotel_rate}</p>
											<a data-toggle="modal" data-target="#Modal-${hotelnum.count}">View
												more</a>
										</figcaption>
									</figure>
								</div>
							</div>
							<!-- end portfolio item -->
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<!-- end container -->

		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="section-footer">
					<h2>
						<button class="btn btn-warning">더 보기</button>
					</h2>
				</div>
			</div>
		</div>

	</section>


	<section>
		<div class="container">
			<div class="panel-body">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<button class="btn btn-info" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" data-target="#collapseOne"
								 aria-expanded="true" aria-controls="collapseOne">결제정보</button>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">고객정보 방예약 정보 등등</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<button class="btn btn-info collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
								 data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">방정보</button>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<ul class="list-group">
									<li class="list-group-item">스위트룸</li>
									<li class="list-group-item">고급룸</li>
									<li class="list-group-item">그루비룸</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-footer">
				<span style="flat: left;">총 결제 금액 : 35000</span>
				<button type="button" class="btn btn-danger" style="float: right;">결제하기</button>
			</div>
		</div>

	</section>


	<!-- 모달 -->
	<c:forEach items="${hotelList}" var="hotel">
		<c:forEach items="${hotelInfos}" var="hotelInfo" varStatus="hotelnum">
			<c:choose>
				<c:when test="${hotelInfo.hotelId == hotel.hotel_id}">
					<div class="modal fade bs-example-modal-lg" id="Modal-${hotelnum.count}" tabindex="-1" role="dialog"
					 aria-labelledby="Modal-label-${hotelnum.count}">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<!-- hotel infomation  -->


								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="Modal-label-1">${hotel.hotel_name}</h4>
								</div>
								<div class="modal-body">
									<div role="tabpanel">
										<ul class="nav nav-tabs" role="tablist">
											<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab"
												 aria-controls="home" aria-expanded="true" data-target="#home">호텔정보</a></li>
											<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile"
												 data-target="#profile">비교분석</a></li>
										</ul>
										<!-- 호텔정보 탭 시작 -->
										<div id="myTabContent" class="tab-content">
											<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
												<div class="owl-search-${hotelnum.count} owl-carousel">
													<div class="item">
														<div class="owl-search-item">
															<img src="/reservationmall/resources/images/hotels/hotel_1.jpg" class="img-responsive" alt="portfolio">
														</div>
													</div>
													<div class="item">
														<div class="owl-search-item">
															<img src="/reservationmall/resources/images/hotels/hotel_2.jpg" class="img-responsive" alt="portfolio">
														</div>
													</div>
													<div class="item">
														<div class="owl-search-item">
															<img src="/reservationmall/resources/images/hotels/hotel_3.jpg" class="img-responsive" alt="portfolio">
														</div>
													</div>
												</div>
												<div class="modal-works">
													<c:forTokens items="${hotel.hotel_detail}" delims="<![CDATA[<]]>?!<![CDATA[>]]>" var="detail">
														<span>${detail}</span>
													</c:forTokens>
												</div>
												<p>${hotel.hotel_info}</p>
												<div role="tabpanel">
													<ul class="nav nav-tabs" role="tablist">
														<c:forEach items="${hotelInfo.rooms}" varStatus="roomnum">
															<li role="presentation" class="${roomnum.count == 1 ? 'active' : ''}"><a href="#room${hotelnum.count}-${roomnum.count}"
																 id="room${hotelnum.count}-${roomnum.count}-tab" role="tab" data-toggle="tab" aria-controls="room${hotelnum.count}-${roomnum.count}"
																 aria-expanded="${roomnum.count == 1 ? 'true' : 'false'}" data-target="#room${hotelnum.count}-${roomnum.count}">방
																	선택${roomnum.count}</a></li>
														</c:forEach>
													</ul>

													<div id="roomTab" class="tab-content">
														<c:forEach items="${hotelInfo.rooms}" varStatus="roomnum" var="rooms">
															<div role="tabpanel" class="tab-pane fade in ${roomnum.count == 1 ? 'active' : ''}" id="room${hotelnum.count}-${roomnum.count}"
															 aria-labelledBy="room${hotelnum.count}-${roomnum.count}-tab">
																<h3><span class="label label-default">예약 인원</span></h3>
																<c:forEach items="${searchAdultNumber}" var="adultNumber" varStatus="adultNumberStatus">
																	<c:if test="${adultNumberStatus.count == roomnum.count}">
																		<span class="lead"><span class="label label-success">어른 : ${adultNumber}명</span></span>
																	</c:if>
																</c:forEach>
																<c:forEach items="${searchChildNumber}" var="childNumber" varStatus="childNumberStatus">
																	<c:if test="${childNumberStatus.count == roomnum.count}">
																		<span class="lead"><span class="label label-success">아이 : ${childNumber}명</span></span>
																	</c:if>
																</c:forEach>
																<table class="table table-hover">
																	<thead>
																		<tr>
																			<th>#</th>
																			<th>방이름</th>
																			<th>인원수</th>
																			<th>가격</th>
																			<th>선택</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${rooms.value}" var="room" varStatus="roomId">
																			<tr>
																				<th scope="row">${roomId.count}</th>
																				<td>${room.name}</td>
																				<td>최소 : 1 최대 : ${room.standardNumber}</td>
																				<td>${room.price}원</td>
																				<td><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#romminfo${hotelnum.count}-${roomId.count}"
																					 aria-expanded="false" aria-controls="romminfo${hotelnum.count}-${roomId.count}">방정보</button>
																					<button type="button" class="btn btn-primary">선택</button></td>
																			</tr>
																			<tr class="collapse" id="romminfo${hotelnum.count}-${roomId.count}">
																				<td colspan="5"><span>
																						<div class="well">방정보입니다.</div>
																						<div>${room.info}</div>
																						<div class="modal-works">
																							<c:forEach items="${room.detail}" var="detail">
																								<span>${detail}</span>
																							</c:forEach>
																						</div>
																					</span></td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
																<c:forEach items="${rooms.value}" var="room" varStatus="roomId">
																	<!-- <div class="collapse" id="romminfo${hotelnum.count}-${roomId.count}">
																	<div class="well">방정보입니다.</div>
																	<div>${room.info}</div>
																	<div class="modal-works">
																			<c:forEach items="${room.detail}" var="detail">
																				<span>${detail}</span>
																			</c:forEach>
																		</div>
																</div> -->
																</c:forEach>
															</div>
														</c:forEach>
														<div role="tabpanel" class="tab-pane fade in active" id="room2" aria-labelledBy="room2-tab"></div>
													</div>

												</div>

											</div>

											<!-- 비교분석 탭 시작 -->
											<div role="tabpanel" class="tab-pane" id="profile" aria-labelledBy="profile-tab">
												<div class="row">
													<div class="col-md-6">
														<div class="jumbotron">
															<div id="map" style="width: 100%; height: 300px;"></div>
															<script>
																var mapOptions = {
																	center: new naver.maps.LatLng(
																		37.3595704,
																		127.105399),
																	zoom: 10
																};

																var map = new naver.maps.Map(
																	'map',
																	mapOptions);
															</script>
														</div>
													</div>
													<div class="col-md-6">
														<div class="jumbotron">
															<script type="text/javascript" src="/reservationmall/resources/js/common/Chart.js"></script>
															<div style="border: solid 1px black; width: 100%; height: 30%; margin-bottom: 10px;">
																<canvas id="canvasRadar" style="margin-left: 5px;"></canvas>
															</div>
															<div style="border: solid 1px black; width: 100%; height: 30%; margin-bottom: 10px;">
																<canvas id="canvasRadar2" style="margin-left: 5px;"></canvas>
															</div>
															<script>
																var target = document
																	.getElementById(
																		'canvasRadar')
																	.getContext(
																		'2d');
																var targets = document
																	.getElementById(
																		'canvasRadar2')
																	.getContext(
																		'2d');

																var ChartHelper = {
																	chartColors: {
																		red: 'rgb(255, 99, 132)',
																		orange: 'rgb(255, 159, 64)',
																		yellow: 'rgb(255, 205, 86)',
																		green: 'rgb(75, 192, 192)',
																		blue: 'rgb(54, 162, 235)',
																		purple: 'rgb(153, 102, 255)',
																		grey: 'rgb(201, 203, 207)'
																	}
																};
																var color = Chart.helpers.color;

																var data1 = null;
																var data2 = null;
																var barChartData = null;

																window.RadarChart = new Chart(
																	target,
																	{
																		type: 'radar',
																		data: {
																			labels: [
																				'서비스',
																				'청결도',
																				'가격',
																				'시설',
																				'교통'],
																			datasets: [
																				{
																					label: '신라호텔',
																					backgroundColor: color(
																						ChartHelper.chartColors.blue)
																						.alpha(
																							0.5)
																						.rgbString(),
																					borderColor: ChartHelper.chartColors.blue,
																					borderWidth: 1,
																					data: [
																						3.5,
																						2.2,
																						5.0,
																						4.2,
																						3.8]
																				},
																				{
																					label: '평균값',
																					backgroundColor: color(
																						ChartHelper.chartColors.red)
																						.alpha(
																							0.5)
																						.rgbString(),
																					borderColor: ChartHelper.chartColors.red,
																					borderWidth: 1,
																					data: [
																						3.2,
																						3.2,
																						3.0,
																						3.2,
																						3.8]
																				}]
																		},
																		option: Chart.defaults.radar
																	});
																var data1 = null;
																var data2 = null;
																var barChartData = null;

																// todo: data setting
																data1 = [150000];
																data2 = [200000];

																barChartData = {
																	labels: ['총가격'],
																	datasets: [
																		{
																			label: '신라호텔',
																			backgroundColor: color(
																				ChartHelper.chartColors.blue)
																				.alpha(
																					0.5)
																				.rgbString(),
																			borderColor: ChartHelper.chartColors.blue,
																			borderWidth: 1,
																			data: data1
																		},
																		{
																			label: '평균가격',
																			backgroundColor: color(
																				ChartHelper.chartColors.red)
																				.alpha(
																					0.5)
																				.rgbString(),
																			borderColor: ChartHelper.chartColors.red,
																			borderWidth: 1,
																			data: data2
																		}]
																};

																window.BarChart = new Chart(
																	targets,
																	{
																		type: 'bar'
																		// 옆으로 누운 bar 차트를 쓰실 경우 바꾸시면 됩니다.
																		//type: 'horizontalBar'
																		,
																		data: barChartData,
																		options: Chart.defaults.bar
																	});
															</script>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>


									<div class="modal-footer">
										<button type="button" class="btn btn-info">예약하기</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>

								</div>

							</div>
						</div>
					</div>

				</c:when>
			</c:choose>
		</c:forEach>
	</c:forEach>

	<script type="text/javascript" src="/reservationmall/resources/js/common/jquery-3.3.1.js"></script>
	<script src="/reservationmall/resources/js/template/bootstrap.min.js"></script>
	<script src="/reservationmall/resources/js/template/owl.carousel.min.js"></script>
	<script src="/reservationmall/resources/js/template/cbpAnimatedHeader.js"></script>
	<script src="/reservationmall/resources/js/template/jquery.appear.js"></script>
	<script src="/reservationmall/resources/js/template/SmoothScroll.min.js"></script>
	<script src="/reservationmall/resources/js/template/mooz.themes.scripts.js"></script>

	<!--======== JJW javascript file List =========-->
	<link rel="stylesheet" href="/reservationmall/resources/css/jjw/bootstrap-datetimepicker.css">
	<script type='text/javascript' src="/reservationmall/resources/js/jjw/moment-with-locales.min.js"></script>
	<script type='text/javascript' src="/reservationmall/resources/js/jjw/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=380ae52ddded1dcd6fc9df096287f781&libraries=services"></script>
	<script src="/reservationmall/resources/js/jjw/common.js"></script>
	<!--======== JJW javascript file List =========-->
</body>

</html>