<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
  <link href="resources/css/template/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Custom styles for this template -->
  <link href="resources/css/template/owl.carousel.css" rel="stylesheet">
  <link href="resources/css/template/owl.theme.default.min.css" rel="stylesheet">
  <link href="resources/css/template/style.css" rel="stylesheet">
  <script type="text/javascript" src="resources/js/common/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="resources/js/hjh/main_top.js"></script>

  <!-- JJW css file List -->
  <link rel="stylesheet" href="resources/css/jjw/common.css">
  <!-- JJW css file List -->
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
        <form action="" method="POST" id="searchForm">
          <div class="col-md-5">
            <div class="form-group">
              <label>검색 타입</label>
              <select class="form-control input-lg" name="searchValueType" id="searchValueType">
                <option value="searchLocation">지역</option>
                <option value="searchHotel">호텔 이름</option>
                <option value="searchHotelType">호텔 타입</option>
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
              <input type="hidden" id="roomNumberHidden">
            </div>
          </div>
          <div class="col-md-8">
            <div class="col-md-6">
              <div class="form-group">
                <label>어른 수</label>
                <select class="form-control input-lg" name="searchAdultNumber1">
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
            <div class="col-md-6" id="roomNumberAnchor">
              <div class="form-group">
                <label>아이 수</label>
                <select class="form-control input-lg" name="searchChildNumber1">
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
              <input type="text" class="form-control input-lg" name="searchHotelRate" placeholder="호텔 최소 별점을 입력해주세요">
            </div>
          </div>
          <div class="col-md-6 collapse extraSearch">
            <div class="form-group">
              <label>최소 비용</label>
              <input type="text" class="form-control input-lg" name="searchMinMoney" placeholder="최소 비용을 입력해주세요">
            </div>
          </div>
          <div class="col-md-6 collapse extraSearch">
            <div class="form-group">
              <label>최대 비용</label>
              <input type="text" class="form-control input-lg" name="searchMaxMoney" placeholder="최대 비용을 입력해주세요">
            </div>
          </div>
          <div class="col-md-12">
            <input type="button" value="검색" class="form-control input-lg" id="searchHotelButton">
          </div>
          <div class="hidden">
            <a class="page-scroll" href="#hotelList" id="searchHotelA"></a>
          </div>
        </form>
      </div>
    </div>
    <!-- /.container -->
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
            <img src="resources/images/template/demo/author-2.jpg" class="img-responsive center-block" style="height:200px;">
          </div>
          <div class="col-md-7">
            <h2>호텔 이름</h3>
              <label class="lead">호텔 가격</label>
              <p class="lead">호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명</p>
          </div>
        </div>
        <div class="row hotel-list">
          <div class="col-md-5">
            <img src="resources/images/template/demo/author-2.jpg" class="img-responsive center-block" style="height:200px;">
          </div>
          <div class="col-md-7">
            <h2>호텔 이름</h3>
              <label class="lead">호텔 가격</label>
              <p class="lead">호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명</p>
          </div>
        </div>
        <div class="row hotel-list">
          <div class="col-md-5">
            <img src="resources/images/template/demo/author-2.jpg" class="img-responsive center-block" style="height:200px;">
          </div>
          <div class="col-md-7">
            <h2>호텔 이름</h3>
              <label class="lead">호텔 가격</label>
              <p class="lead">호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명 호텔 설명 호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명호텔 설명</p>
          </div>
        </div>
      </div>
      <div class="row text-center">
        <button class="btn btn-success">더보기</button>
      </div>
    </div>
  </section>

  <section id="recommendation">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-title">
            <h2>Portfolio</h2>
            <p>Our portfolio is the best way to show our work, you can see here a big range of our work. Check them all
              and
              you will find what you are looking for.</p>
          </div>
        </div>
      </div>
      <div class="row row-0-gutter">
        <!-- start portfolio item -->
        <div class="col-md-4 col-0-gutter">
          <div class="ot-portfolio-item">
            <figure class="effect-bubba">
              <img src="resources/images/template/demo/portfolio-1.jpg" alt="img02" class="img-responsive" />
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
              <img src="resources/images/template/demo/portfolio-2.jpg" alt="img02" class="img-responsive" />
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
              <img src="resources/images/template/demo/portfolio-3.jpg" alt="img02" class="img-responsive" />
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

  <section id="faq" class="dark-bg short-section stats-bar">
    <div class="container text-center">
      <div class="row">
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="9">0</h2>
            <h6>awards</h6>
          </div>
        </div>
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="167">0</h2>
            <h6>Clients</h6>
          </div>
        </div>
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="6">0</h2>
            <h6>Team</h6>
          </div>
        </div>
        <div class="col-md-3 mb-sm-30">
          <div class="counter-item">
            <h2 class="stat-number" data-n="34">0</h2>
            <h6>Project</h6>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-title">
            <h2>Our Partners</h2>
            <p>Mida sit una namet, cons uectetur adipiscing adon elit.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="owl-partners owl-carousel">
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-1.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-2.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-3.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-4.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-5.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-6.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-7.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-8.png" alt="partners"></div>
            </div>
            <div class="item">
              <div class="partner-logo"><img src="resources/images/template/demo/partners-9.png" alt="partners"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section id="team" class="light-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-title">
            <h2>Our Team</h2>
            <p>A creative agency based on Candy Land, ready to boost your business with some beautifull templates. MOOZ
              Agency is one of the best in town see more you will be amazed.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- team member item -->
        <div class="col-md-4">
          <div class="team-item">
            <div class="team-image">
              <img src="resources/images/template/demo/author-2.jpg" class="img-responsive" alt="author">
            </div>
            <div class="team-text">
              <h3>TOM BEKERS</h3>
              <div class="team-position">CEO & Web Design</div>
              <p>Mida sit una namet, cons uectetur adipiscing adon elit. Aliquam vitae barasa droma.</p>
            </div>
          </div>
        </div>
        <!-- end team member item -->
        <!-- team member item -->
        <div class="col-md-4">
          <div class="team-item">
            <div class="team-image">
              <img src="resources/images/template/demo/author-6.jpg" class="img-responsive" alt="author">
            </div>
            <div class="team-text">
              <h3>LINA GOSATA</h3>
              <div class="team-position">Photography</div>
              <p>Worsa dona namet, cons uectetur dipiscing adon elit. Aliquam vitae fringilla unda mir.</p>
            </div>
          </div>
        </div>
        <!-- end team member item -->
        <!-- team member item -->
        <div class="col-md-4">
          <div class="team-item">
            <div class="team-image">
              <img src="resources/images/template/demo/author-4.jpg" class="img-responsive" alt="author">
            </div>
            <div class="team-text">
              <h3>John BEKERS</h3>
              <div class="team-position">Marketing</div>
              <p>Dolor sit don namet, cons uectetur beriscing adon elit. Aliquam vitae fringilla unda.</p>
            </div>
          </div>
        </div>
        <!-- end team member item -->
      </div>
    </div>
  </section>
  <section id="contact" class="dark-bg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="section-title">
            <h2>Contact Us</h2>
            <p>If you have some Questions or need Help! Please Contact Us!<br>We make Cool and Clean Design for your
              Business</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3">
          <div class="section-text">
            <h4>Our Business Office</h4>
            <p>3422 Street, Barcelona 432, Spain, New Building North, 15th Floor</p>
            <p><i class="fa fa-phone"></i> +101 377 655 22125</p>
            <p><i class="fa fa-envelope"></i> mail@yourcompany.com</p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="section-text">
            <h4>Business Hours</h4>
            <p><i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>9am to 8pm</span></p>
            <p><i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>9am to 2pm</span></p>
            <p><i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span></p>
          </div>
        </div>
        <div class="col-md-6">
          <form name="sentMessage" id="contactForm" novalidate="">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="Your Name *" id="name" required=""
                    data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="email" class="form-control" placeholder="Your Email *" id="email" required=""
                    data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <textarea class="form-control" placeholder="Your Message *" id="message" required=""
                    data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="row">
              <div class="col-lg-12 text-center">
                <div id="success"></div>
                <button type="submit" class="btn">Send Message</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <p id="back-top">
    <a href="#top"><i class="fa fa-angle-up"></i></a>
  </p>
  <jsp:include page="/WEB-INF/view/main/main_bottom.jsp"></jsp:include>

  <!-- Modal for portfolio item 1 -->
  <div class="modal fade" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
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
        </div>
      </div>
    </div>
  </div>

  <!-- Modal for portfolio item 2 -->
  <div class="modal fade" id="Modal-2" tabindex="-1" role="dialog" aria-labelledby="Modal-label-2">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="Modal-label-2">Startup Framework</h4>
        </div>
        <div class="modal-body">
          <img src="resources/images/template/demo/portfolio-2.jpg" alt="img01" class="img-responsive" />
          <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
          <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal for portfolio item 3 -->
  <div class="modal fade" id="Modal-3" tabindex="-1" role="dialog" aria-labelledby="Modal-label-3">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="Modal-label-3">Lamp & Velvet</h4>
        </div>
        <div class="modal-body">
          <img src="resources/images/template/demo/portfolio-3.jpg" alt="img01" class="img-responsive" />
          <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
          <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal for portfolio item 4 -->
  <div class="modal fade" id="Modal-4" tabindex="-1" role="dialog" aria-labelledby="Modal-label-4">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="Modal-label-4">Smart Name</h4>
        </div>
        <div class="modal-body">
          <img src="resources/images/template/demo/portfolio-4.jpg" alt="img01" class="img-responsive" />
          <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
          <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal for portfolio item 5 -->
  <div class="modal fade" id="Modal-5" tabindex="-1" role="dialog" aria-labelledby="Modal-label-5">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="Modal-label-5">Fast People</h4>
        </div>
        <div class="modal-body">
          <img src="resources/images/template/demo/portfolio-5.jpg" alt="img01" class="img-responsive" />
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
  <script src="resources/js/template/bootstrap.min.js"></script>
  <script src="resources/js/template/owl.carousel.min.js"></script>
  <script src="resources/js/template/cbpAnimatedHeader.js"></script>
  <script src="resources/js/template/jquery.appear.js"></script>
  <script src="resources/js/template/SmoothScroll.min.js"></script>
  <script src="resources/js/template/mooz.themes.scripts.js"></script>

  <!--======== JJW javascript file List =========-->
  <link rel="stylesheet" href="resources/css/jjw/bootstrap-datetimepicker.css">
  <script type='text/javascript' src="resources/js/jjw/moment-with-locales.min.js"></script>
  <script type='text/javascript' src="resources/js/jjw/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=380ae52ddded1dcd6fc9df096287f781&libraries=services"></script>
  <script src="resources/js/jjw/common.js"></script>
  <!--======== JJW javascript file List =========-->
</body>

</html>