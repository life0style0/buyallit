<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <link href="/reservationmall/resources/css/template/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Custom styles for this template -->
  <link href="/reservationmall/resources/css/template/owl.carousel.css" rel="stylesheet">
  <link href="/reservationmall/resources/css/template/owl.theme.default.min.css" rel="stylesheet">
  <link href="/reservationmall/resources/css/template/style.css" rel="stylesheet">
  <script src="/reservationmall/resources/js/common/jquery-3.3.1.js"></script>

  <!-- JJW css file List -->
  <link rel="stylesheet" href="/reservationmall/resources/css/jjw/bootstrap-datetimepicker.css">
  <link rel="stylesheet" href="/reservationmall/resources/css/jjw/common.css">
  <!-- JJW css file List -->

  <!-- hjh 존 -->
  <script type="text/javascript" src="/reservationmall/resources/js/hjh/main_top.js"></script>
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=aba8nx_n3O9CvAauIsql&amp;submodules=panorama,geocoder,drawing,visualization"></script>
  <!-- hjh 존 -->
</head>

<body id="page-top">
  <!-- Navigation -->
  <!-- top 네비게이션 -->
  <jsp:include page="/WEB-INF/view/main/main_top.jsp"></jsp:include>
  <!-- Header -->
  <header style="background-image:'resources/images/template/demo/portfolio-7.jpg';">
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

  <section id="search" class="dark-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-title">
            <h2>호텔 검색</h2>
            <p>서울 시내의 호텔들을 다양한 조건을 통해 검색해 보세요!</p>
          </div>
        </div>
      </div>
      <div class="col-md-8">
        <form action="/reservationmall/hotel/searchhotel.mall" method="POST" id="searchForm">
          <div class="col-md-5">
            <div class="form-group">
              <label>검색 타입</label>
              <select class="form-control input-lg" name="searchValueType" id="searchValueType">
                <option value="searchLocation">지역</option>
                <option value="searchHotel">호텔 이름</option>
              </select>
            </div>
          </div>
          <div class="col-md-7">
            <div class="form-group">
              <label>검색 내용</label>
              <input type="search" class="form-control input-lg" placeholder="검색하고 싶은 내용을 입력하세요" id="searchValueInput">
              <input type="hidden" name="searchValue" id="searchValueInputHidden">
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>입실 날짜</label>
              <div class='input-group date' id='datetimepicker1'>
                <input type='text' class="form-control input-lg" name="searchStartDay" />
                <span class="input-group-addon">
                  <span class="fa fa-calendar"></span>
                </span>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>퇴실 날짜</label>
              <div class='input-group date' id='datetimepicker2'>
                <input type='text' class="form-control input-lg" name="searchEndDay" />
                <span class="input-group-addon">
                  <span class="fa fa-calendar"></span>
                </span>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>일정</label>
              <div class='input-group date'>
                <p class="lead" id="betweenDay"><strong>1박 2일</strong></p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>객실 수</label>
              <select class="form-control input-lg" id="roomNumber" name="searchRoomNumber">
                <option selected>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
              </select>
              <input type="hidden" id="roomNumberHidden" value="1">
            </div>
          </div>
          <div class="col-md-8" id="roomNumberAnchor">
            <div class="col-md-6">
              <div class="form-group">
                <label>어른 수</label>
                <select class="form-control input-lg" name="searchAdultNumber">
                  <option>1</option>
                  <option selected>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                  <option>6</option>
                  <option>7</option>
                  <option>8</option>
                  <option>9</option>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label>아이 수</label>
                <select class="form-control input-lg" name="searchChildNumber">
                  <option>0</option>
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                  <option>6</option>
                  <option>7</option>
                  <option>8</option>
                  <option>9</option>
                </select>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <button class="btn btn-primary btn-lg" type="button" data-toggle="collapse" data-target=".extraSearch"
                aria-expanded="false" aria-controls="collapseExample" id="searchExtra">
                추가 검색 옵션
              </button>
            </div>
          </div>
          <div class="col-md-8" style="visibility: hidden;">
            <div class="form-group">
              <button class="btn btn-primary btn-lg" type="button" data-toggle="collapse" data-target=".extraSearch"
                aria-expanded="false" aria-controls="collapseExample">
                Hidden button
              </button>
            </div>
          </div>
          <div class="col-md-5 collapse extraSearch">
            <div class="form-group">
              <label>평점 검색</label>
              <select class="form-control input-lg" name="searchRateType">
                <option value="searchAllRate">전체 별점 평균</option>
                <option value="searchPriceRate">가격 별점 평균</option>
                <option value="searchCleanRate">청결도 별점 평균</option>
                <option value="searchServiceRate">서비스 별점 평균</option>
                <option value="searchFoodRate">음식 별점 평균</option>
                <option value="searchLocationRate">위치 별점 평균</option>
              </select>
            </div>
          </div>
          <div class="col-md-7 collapse extraSearch">
            <div class="form-group">
              <label style="visibility: hidden;">hidden</label>
              <input type="text" class="form-control input-lg" name="searchHotelRate" placeholder="호텔 평점을 입력해주세요. (1 ~ 5)">
            </div>
          </div>
          <div class="col-md-12 collapse extraSearch">
            <div class="col-md-6">
              <div class="form-group">
                <label>최소 비용</label>
                <input type="text" class="form-control input-lg" name="searchMinMoney" placeholder="최소 비용을 입력해주세요">
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label>최대 비용</label>
                <input type="text" class="form-control input-lg" name="searchMaxMoney" placeholder="최대 비용을 입력해주세요">
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <input type="button" value="검색" class="form-control input-lg" id="searchHotelButton">
          </div>
        </form>
      </div>
    </div>
    <!-- /.container -->
  </section>

  <section id="navermap" class="light-bg">
    <div class="container">
      <div id="map" style="width:100%;height:600px;"></div>
      <code id="snippet" class="snippet"></code>
      <script id="code">
        var HOME_PATH = window.HOME_PATH || '.';
        var MARKER_SPRITE_POSITION = {};

        <c:forEach items='${hotelList}' var='hotel'>
          var data = ["${hotel.hotel_name}","${hotel.hotel_address}","${hotel.hotel_phonenum}", "${hotel.hotel_rate}", "${hotel.hotel_info}", "${hotel.hotel_detail}", "${hotel.location_id}", "${hotel.hotel_website}"];
          var key = Number("${hotel.hotel_id}");
            MARKER_SPRITE_POSITION[key] = data;
         </c:forEach>
  
          var map = new naver.maps.Map('map', {
          center: new naver.maps.LatLng(37.5233311, 126.9787309),
          zoom: 10
        });

        var markers = [],
          infoWindows = [];


        for (var hotel_no in MARKER_SPRITE_POSITION) {
          console.log(hotel_no);
          var address = MARKER_SPRITE_POSITION[hotel_no][1];
          naver.maps.Service.geocode({
            address: address
          }, function (status, response) {
            if (status === naver.maps.Service.Status.ERROR) {
              return alert('Something Wrong!');
            }
            var item = response.result.items[0];

            var position = new naver.maps.LatLng(
              item.point.y,
              item.point.x);

            var marker = new naver.maps.Marker({
              map: map,
              position: position,
              title: item.address
            });
            markers.push(marker);
          });
          console.log(MARKER_SPRITE_POSITION[hotel_no][7]);
          var contentString = [
            '<div class="iw_inner">',
            '   <h3>' + MARKER_SPRITE_POSITION[hotel_no][0] + '</h3>',
            '   <p>' + MARKER_SPRITE_POSITION[hotel_no][1] + '<br />',
            '       <img src="resources/images/template/demo/portfolio-7.jpg" width="55" height="55" alt="' + MARKER_SPRITE_POSITION[hotel_no][0] + '" class="thumb" /><br />',
            '       홈페이지 : <a href="' + MARKER_SPRITE_POSITION[hotel_no][7] + '">' + MARKER_SPRITE_POSITION[hotel_no][7] + '</a><br>' + MARKER_SPRITE_POSITION[hotel_no][2] + ' | ' + MARKER_SPRITE_POSITION[hotel_no][3] + '<br />',
            '      ' + MARKER_SPRITE_POSITION[hotel_no][4] + '',
            '   </p>',
            '</div>'
          ].join('');


          var infoWindow = new naver.maps.InfoWindow({
            content: contentString
          });
          infoWindows.push(infoWindow);

        };

        function getGeocode(address) {

        }


        naver.maps.Event.addListener(map, 'idle', function () {
          updateMarkers(map, markers);
        });

        function updateMarkers(map, markers) {
          var mapBounds = map.getBounds();
          var marker, position;
          for (var i = 0; i < markers.length; i++) {
            naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
            marker = markers[i]
            position = marker.getPosition();
            if (mapBounds.hasLatLng(position)) {
              showMarker(map, marker);
            } else {
              hideMarker(map, marker);
            }
          }
        }

        function showMarker(map, marker) {
          if (marker.setMap()) return;
          marker.setMap(map);
        }

        function hideMarker(map, marker) {
          if (!marker.setMap()) return;
          marker.setMap(null);
        }

        // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
        function getClickHandler(seq) {
          return function (e) {
            var marker = markers[seq],
              infoWindow = infoWindows[seq];

            if (infoWindow.getMap()) {
              infoWindow.close();
            } else {
              infoWindow.open(map, marker);
            }
          }
        }

      </script>
    </div>
  </section>

  <section id="recommendation" class="light-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-title">
            <h2>통계정보</h2>
            <p>고객분들의 선택을 위한 데이터를 제공해드립니다.</p>
          </div>
        </div>
      </div>
      <div class="row row-0-gutter">
        <!-- start portfolio item -->
        <div class="col-md-4 col-0-gutter">
          <div class="ot-portfolio-item">
            <figure class="effect-bubba">
              <img src="/reservationmall/resources/images/template/demo/portfolio-1.jpg" alt="img02" class="img-responsive" />
              <figcaption>
                <h2>메이필드호텔</h2>
                <p>Branding, Design</p>
                <a href="#" data-toggle="modal" data-target="#Modal-1">View more</a>
              </figcaption>
            </figure>
          </div>
        </div>
        <!-- end portfolio item -->
        <!-- start portfolio item -->
        <div class="col-md-4 col-0-gutter">
          <div class="ot-portfolio-item">
            <figure class="effect-bubba">
              <img src="/reservationmall/resources/images/template/demo/portfolio-2.jpg" alt="img02" class="img-responsive" />
              <figcaption>
                <h2>Startup Framework</h2>
                <p>Branding, Web Design</p>
                <a href="#" data-toggle="modal" data-target="#Modal-2">View more</a>
              </figcaption>
            </figure>
          </div>
        </div>
        <!-- end portfolio item -->
        <!-- start portfolio item -->
        <div class="col-md-4 col-0-gutter">
          <div class="ot-portfolio-item">
            <figure class="effect-bubba">
              <img src="/reservationmall/resources/images/template/demo/portfolio-3.jpg" alt="img02" class="img-responsive" />
              <figcaption>
                <h2>Lamp & Velvet</h2>
                <p>Branding, Web Design</p>
                <a href="#" data-toggle="modal" data-target="#Modal-3">View more</a>
              </figcaption>
            </figure>
          </div>
        </div>
        <!-- end portfolio item -->
      </div>
      <div class="row row-0-gutter">
        <!-- start portfolio item -->
        <div class="col-md-4 col-0-gutter">
          <div class="ot-portfolio-item">
            <figure class="effect-bubba">
              <img src="resources/images/template/demo/portfolio-4.jpg" alt="img02" class="img-responsive" />
              <figcaption>
                <h2>Smart Name</h2>
                <p>Branding, Design</p>
                <a href="#" data-toggle="modal" data-target="#Modal-4">View more</a>
              </figcaption>
            </figure>
          </div>
        </div>
        <!-- end portfolio item -->
        <!-- start portfolio item -->
        <div class="col-md-4 col-0-gutter">
          <div class="ot-portfolio-item">
            <figure class="effect-bubba">
              <img src="resources/images/template/demo/portfolio-5.jpg" alt="img02" class="img-responsive" />
              <figcaption>
                <h2>Fast People</h2>
                <p>Branding, Web Design</p>
                <a href="#" data-toggle="modal" data-target="#Modal-5">View more</a>
              </figcaption>
            </figure>
          </div>
        </div>
        <!-- end portfolio item -->
        <!-- start portfolio item -->
        <div class="col-md-4 col-0-gutter">
          <div class="ot-portfolio-item">
            <figure class="effect-bubba">
              <img src="resources/images/template/demo/portfolio-6.jpg" alt="img02" class="img-responsive" />
              <figcaption>
                <h2>Kites & Stars</h2>
                <p>Branding, Web Design</p>
                <a href="#" data-toggle="modal" data-target="#Modal-2">View more</a>
              </figcaption>
            </figure>
          </div>
        </div>
        <!-- end portfolio item -->
      </div>
    </div><!-- end container -->
  </section>

  <!-- 자주하는 질문 혜림 수정 -->
  <section id="faq" class="dark-bg short-section stats-bar">
    <div class="container text-center">
      <div class="row">
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="${fn:length(hotelList)}">0</h2>
            <h6>등록 호텔 수</h6>
          </div>
        </div>
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="167">0</h2>
            <h6>등록 고객 수</h6>
          </div>
        </div>
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="6">0</h2>
            <h6>등록 후기 수</h6>
          </div>
        </div>
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="34">0</h2>
            <h6>총 이용금액</h6>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 혜림수정끝  -->

  <!-- 혜림 Q&A 쪽지보내기 폼 수정 시작 -->
  <section id="contact" class="dark-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-title">
            <h2>Contact Us</h2>
            <p>요기조아에 대한 고객 여러분들의 문의사항을 보내주세요. 문의주신 내용의 답변은 업무일 기준으로 <br>24시간 내에 쪽지함으로 발송되며 카카오 알림톡으로 처리결과를 발송해 드립니다.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3">
          <div class="section-text">
            <h4>Our Business Office</h4>
            <p>서울특별시 금천구 가산디지털 1로 151(가산동 371-47) 이노플랙스 1차 YOGIZOA 본사</p>
            <p><i class="fa fa-phone"></i> +82 010 6555 22125</p>
            <p><i class="fa fa-envelope"></i> mail@YOGIZOA.com</p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="section-text">
            <h4>Business Hours</h4>
            <p><i class="fa fa-clock-o"></i> <span class="day">주중:</span><span>9am to 8pm</span></p>
            <p><i class="fa fa-clock-o"></i> <span class="day">토요일:</span><span>9am to 2pm</span></p>
            <p><i class="fa fa-clock-o"></i> <span class="day">일요일:</span><span>Closed</span></p>
          </div>
        </div>
        <div class="col-md-6">
          <form name="sendNotes" id="sendNotes" action="/reservation/notes/controller.mall" method="post">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디 입력 *" id="name" name="user_id" required=""
                    data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="email" class="form-control" placeholder="이메일 입력 *" id="email" name="user_email" required=""
                    data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <textarea class="form-control" placeholder="문의사항 입력 *" id="message" name="user_message" required=""
                    data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="row">
              <div class="col-lg-12 text-center">
                <div id="success"></div>
                <button type="submit" class="btn" id="sendnote">Send Message</button>
              </div>
            </div>
          </form>
        </div>

        <!-- 혜림 Q&A 쪽지보내기 폼 수정 끝? -->

      </div>
    </div>
  </section>
  <!-- 혜림 Q&A 쪽지보내기 폼 수정 끝 -->

  <p id="back-top">
    <a href="#top"><i class="fa fa-angle-up"></i></a>
  </p>
  <jsp:include page="/WEB-INF/view/main/main_bottom.jsp"></jsp:include>

  <!-- Modal for portfolio item 1 -->
  <div class="modal fade bs-example-modal-lg" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <!-- hotel infomation  -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="Modal-label-1">호텔정보</h4>
        </div>
        <div class="modal-body">
          <div class="owl-portfolio owl-carousel">
            <div class="item">
              <div class="owl-portfolio-item"><img src="/reservationmall/resources/images/hotels/hotel_1.jpg" class="img-responsive"
                  alt="portfolio"></div>
            </div>
            <div class="item">
              <div class="owl-portfolio-item"><img src="/reservationmall/resources/images/hotels/hotel_2.jpg" class="img-responsive"
                  alt="portfolio"></div>
            </div>
            <div class="item">
              <div class="owl-portfolio-item"><img src="/reservationmall/resources/images/hotels/hotel_3.jpg" class="img-responsive"
                  alt="portfolio"></div>
            </div>
          </div>
          <img src="/reservationmall/resources/images/hotels/hotel_1.jpg" alt="img01" class="img-responsive" />
          <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
          <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        <!-- hotel information end  -->

        <!-- room info  -->
        <!-- <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="Modal-label-1">Dean & Letter</h4>
            </div>
            <div class="modal-body">
              <img src="resources/images/template/demo/portfolio-1.jpg" alt="img01" class="img-responsive" />
              <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
              <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div> -->
        <!-- room info end  -->
      </div>
    </div>
  </div>

  <div class="modal fade bs-example-modal-lg" id="Modal-2" tabindex="-1" role="dialog" aria-labelledby="Modal-label-2">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <!-- hotel infomation  -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="Modal-label-1">호텔정보</h4>
        </div>
        <div class="modal-body">
          <div class="owl-portfolio owl-carousel">
            <div class="item">
              <div class="owl-portfolio-item"><img src="/reservationmall/resources/images/hotels/hotel_1.jpg" class="img-responsive"
                  alt="portfolio"></div>
            </div>
            <div class="item">
              <div class="owl-portfolio-item"><img src="/reservationmall/resources/images/hotels/hotel_2.jpg" class="img-responsive"
                  alt="portfolio"></div>
            </div>
            <div class="item">
              <div class="owl-portfolio-item"><img src="/reservationmall/resources/images/hotels/hotel_3.jpg" class="img-responsive"
                  alt="portfolio"></div>
            </div>
          </div>
          <img src="/reservationmall/resources/images/hotels/hotel_1.jpg" alt="img01" class="img-responsive" />
          <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
          <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
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
  <script src="/reservationmall/resources/js/template/bootstrap.min.js"></script>
  <script src="/reservationmall/resources/js/template/owl.carousel.min.js"></script>
  <script src="/reservationmall/resources/js/template/cbpAnimatedHeader.js"></script>
  <script src="/reservationmall/resources/js/template/jquery.appear.js"></script>
  <script src="/reservationmall/resources/js/template/SmoothScroll.min.js"></script>
  <script src="/reservationmall/resources/js/template/mooz.themes.scripts.js"></script>

  <!--======== JJW javascript file List =========-->
  <script type='text/javascript' src="/reservationmall/resources/js/jjw/moment-with-locales.min.js"></script>
  <script type='text/javascript' src="/reservationmall/resources/js/jjw/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=380ae52ddded1dcd6fc9df096287f781&libraries=services"></script>
  <script src="/reservationmall/resources/js/jjw/validator.js"></script>
  <script src="/reservationmall/resources/js/jjw/common.js"></script>
  <!--======== JJW javascript file List =========-->

  <!--======== 혜림 javascript file List =========-->

  <!--======== 혜림 javascript file List =========-->
</body>

</html>