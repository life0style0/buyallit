<%@page import="kr.or.kosta.reservationmall.login.dto.User"%>
<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
String loginId = null;
//String loginCheck = null;
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
  }
}

System.out.println("시작");
System.out.println(request.getAttribute("userId"));
User user= (User)request.getAttribute("user");
System.out.println(user);
System.out.println("끝");

//loginCheck = request.getParameter("loginCheck");
%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="userId" value="<%=loginId%>" />

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
		<link href="/reservationmall/resources/css/template/owl.theme.default.min.css"  rel="stylesheet">
		<link href="/reservationmall/resources/css/template/style.css" rel="stylesheet">
	
    <!-- 주현 css 추가  -->
  	<link href="/reservationmall/resources/css/sjh/style.css" rel="stylesheet">
    <!-- 주현 css 추가  -->
     
		<script type="text/javascript" src="/reservationmall/resources/js/common/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="/reservationmall/resources/js/hjh/main_top.js"></script>
    
    <!-- 주현 js 추가  -->
    <script type="text/javascript">
    $(function(){ //부트스트랩 탭메뉴
        $('ul.nav-tabs a').click(function (e) {
          e.preventDefault()
          $(this).tab('show')
        })
    })
    </script>
    <!-- 주현 js 추가 끝  -->
    
	</head>
	<body id="page-top">
		<!-- Navigation -->
		<!-- top 네비게이션 -->
		<jsp:include page="/WEB-INF/view/individual/mypage_top.jsp"></jsp:include>
        
		<!-- Header -->
		<section id="my-info" class="dark-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2> 개인정보 조회/수정/탈퇴 </h2>
							<p>A creative  of ll be amazed.</p>
						</div>
					</div>
				</div>
        
        
        <!-- 개인정보 조회/수정/탈퇴 탭메뉴 -->
    <div class="container">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#first">개인정보 조회</a></li>
        <li><a href="#second"> 개인정보 수정 </a></li>
        <li><a href="#third"> 탈퇴</a></li>
      </ul>
      <br>
    </div>
    <!-- 개인정보 조회/수정/탈퇴 탭메뉴 끝  -->

 <div class="tab-content" >
 <!-- 정보조회 탭 시작 -->
  <div class="tab-pane fade active in" id="first">
      <div class=" text-center mz-module-about">
        <h3> 개인정보 조회 </h3>
      </div> 
      
       <div style="height:50px"></div>
      <div id="ww">
      <div class="container">
          <div class="form-group">
            <label for="exampleInputEmail1">아이디</label> 
            <div> ${user.user_id} </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">이름</label> 
            <div> ${user.user_name}  </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">나이</label> 
            <div> ${user.user_age} </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">주소</label> 
            <div> ${user.user_address} </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">전화번호</label> 
            <div> ${user.user_phonenum} </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">이메일</label> 
            <div> ${user.user_email} </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">등급</label> 
            <div> ${user.user_rate} </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">가입일</label> 
            <div> ${user.user_regdate} </div>
          </div>
          
      </div>
      <!-- /container -->
    </div>
    <!-- /ww -->
    <div style="height:50px"></div>
  </div>
   <!-- 정보조회 탭 끝 -->
  
   <!-- 정보수정 탭 시작 -->
  <div class="tab-pane fade" id="second">
   <div class=" text-center mz-module-about">
      <h3> 개인정보 수정 </h3>
   </div>
    <div style="height:50px"></div>
      <div id="ww">
      <div class="container">
      
      <c:choose>
      
      <c:when test="${requestScope.editUserResult eq 'success'}">
        <div class="row">
          <h3> 수정 완료 </h3>  
        </div>
      </c:when>
      
      <c:when test="${requestScope.editUserResult eq 'fail'}">
        <div class="row">
          <h3> 수정 실패 </h3>  
        </div>
      </c:when>
      
      <c:otherwise>
        <%--수정폼 보여주기 --%> 
        <jsp:include page="/WEB-INF/view/individual/edit_form.jsp"></jsp:include>
      </c:otherwise>
      
      </c:choose>
      </div>
      <!-- /container -->
    </div>
    <!-- /ww -->
    <div style="height:50px"></div>
  </div>
   <!-- 정보수정 탭 끝 -->
   
    <!-- 탈퇴 탭 시작 -->
  <div class="tab-pane fade" id="third">
   <div class=" text-center mz-module-about">
      <h3> 탈퇴 </h3>
   </div>
    <div style="height:50px"></div>
      <div id="ww">
      <div class="container">
        <div class="row">
          <button type="button" class="btn btn-danger" id="leaveBtn">탈퇴하기</button>
        </div>
      </div>
      <!-- /container -->
    </div>
    <!-- /ww -->
    <div style="height:50px"></div>
  </div>
   <!-- 탈퇴 탭 끝 -->
</div>

		</section>
    
    <!--  예약 내역 조회 시작 -->
    <section id="reservation" class="light-bg">
		<section class="light-bg">
			<div class="container">
      
      <div class="row">
          <div class="col-lg-12 text-center">
            <div class="section-title">
              <h2> 예약내역 조회 및 취소 </h2>
              <p>A creative  of ll be amazed.</p>
            </div>
          </div>
        </div>
        
				<div class="row">
					<div class="col-md-7">
						<div class="section-text">
							<h3> 호텔이름</h3>
              
                            <div class="row">
                              <div class="col-md-9 h4">
                              <h4> 예약번호 : 예약번호 </h4>
                              </div>
                              <div class="col-md-3 h4">
                              <button type="button" class="btn btn-red" id="cancellationBtn"
                              data-toggle="modal"  data-target="#Modal-cancel">예약취소</button>
                              </div>
                            </div>
                             
                            <div class="row">
                            <div class="col-md-6 h5"> 
                              <label>체크인</label> 
                            </div>
                            <div class="col-md-6 h5"> 
                              <label>체크아웃</label> 
                            </div>
                            
                            <div class="col-md-6 h5"> 
                              <label>호텔주소</label> 
                            </div>
                            <div class="col-md-6 h5"> 
                              <label>방이름</label> 
                            </div>
                            <div class="col-md-6 h5"> 
                              <label>방 기준인원</label> 
                            </div>
                            <div class="col-md-6 h5"> 
                             <label>결제금액</label> 
                            </div>
                            <div class="col-md-6 h5"> 
                              <label>결제일</label> 
                            </div>
                            <div class="col-md-6 h5"> 
                              <label>결제유형</label> 
                            </div>
                            </div>
						</div>
					</div>
                    
                    <!-- 호텔 이미지 시작-->
					<div class="col-md-5">
						<div class="owl-portfolio owl-carousel">
							<div class="item">
								<div class="owl-portfolio-item">
                                <img src="resources/images/template/demo/portfolio-7.jpg" class="img-responsive" alt="portfolio">
                            </div>
							</div>
							<div class="item">
								<div class="owl-portfolio-item">
                                <img src="resources/images/template/demo/portfolio-8.jpg" class="img-responsive" alt="portfolio">
                            </div>
							</div>
							<div class="item">
								<div class="owl-portfolio-item">
                                <img src="resources/images/template/demo/portfolio-9.jpg" class="img-responsive" alt="portfolio">
                            </div>
							</div>
						</div>
					</div>
                    <!-- 호텔 이미지 끝-->
                    
				</div>
			</div>
        <div style="height:50px"></div>
		</section>
    <!--  예약 내역 조회 끝 -->


    <!-- 위시리스트 시작 -->
    <section id="wishlist" class="dark-bg">
    <div class="container"> 
       
       <div class="row">
          <div class="col-lg-12 text-center">
            <div class="section-title">
              <h2> 위시리스트 </h2>
              <p>A creative  of ll be amazed.</p>
            </div>
          </div>
        </div>

            
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="owl-partners owl-carousel">

              <div class="item ot-portfolio-item">
                <figure class="effect-bubba">
                  <img src="/reservationmall/resources/images/template/demo/portfolio-1.jpg" alt="img02" class="img-responsive" />
                  <figcaption>
                    <h2>1 메이필드호텔</h2>
                    <p>Branding, Design</p>
                    <a href="#" data-toggle="modal"  data-target="#Modal-1">View more</a>
                  </figcaption>
                </figure>
              </div>
              
              <div class="item ot-portfolio-item">
                <figure class="effect-bubba">
                  <img src="/reservationmall/resources/images/template/demo/portfolio-2.jpg" alt="img02" class="img-responsive" />
                  <figcaption>
                    <h2>2 Startup Framework</h2>
                    <p>Branding, Web Design</p>
                    <a href="#" data-toggle="modal" data-target="#Modal-2">View more</a>
                  </figcaption>
                </figure>
              </div>
              
              <div class="item ot-portfolio-item ">
                <figure class="effect-bubba">
                  <img src="/reservationmall/resources/images/template/demo/portfolio-3.jpg" alt="img02" class="img-responsive" />
                  <figcaption>
                    <h2>3 Lamp & Velvet</h2>
                    <p>Branding, Web Design</p>
                    <a href="#" data-toggle="modal" data-target="#Modal-3">View more</a>
                  </figcaption>
                </figure>
              </div>
              
              <div class="item ot-portfolio-item">
                <figure class="effect-bubba">
                  <img src="resources/images/template/demo/portfolio-4.jpg" alt="img02" class="img-responsive" />
                  <figcaption>
                    <h2>4 Smart Name</h2>
                    <p>Branding, Design</p>
                    <a href="#" data-toggle="modal" data-target="#Modal-4">View more</a>
                  </figcaption>
                </figure>
              </div>
              
              <div class="item ot-portfolio-item">
                <figure class="effect-bubba">
                  <img src="resources/images/template/demo/portfolio-5.jpg" alt="img02" class="img-responsive" />
                  <figcaption>
                    <h2>5 Fast People</h2>
                    <p>Branding, Web Design</p>
                    <a href="#" data-toggle="modal" data-target="#Modal-5">View more</a>
                  </figcaption>
                </figure>
              </div>
              
               <div class="item ot-portfolio-item">
                <figure class="effect-bubba">
                  <img src="resources/images/template/demo/portfolio-5.jpg" alt="img02" class="img-responsive" />
                  <figcaption>
                    <h2>6 Fast People</h2>
                    <p>Branding, Web Design</p>
                    <a href="#" data-toggle="modal" data-target="#Modal-5">View more</a>
                  </figcaption>
                </figure>
              </div>
              
            </div>
              
          </div>
        </div> <!--  row  -->

      </div> <!--  end container  -->
    </section> 
    <!-- 위시리스트 끝 -->

    
    
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
						<img src="/reservationmall/resources/images/template/demo/portfolio-2.jpg" alt="img01" class="img-responsive" />
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
						<img src="/reservationmall/resources/images/template/demo/portfolio-3.jpg" alt="img01" class="img-responsive" />
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
						<img src="/reservationmall/resources/images/template/demo/portfolio-4.jpg" alt="img01" class="img-responsive" />
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
						<img src="/reservationmall/resources/images/template/demo/portfolio-5.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
    
     <%-- 예약취소 모달 --%>
     <jsp:include page="/mypage-modal/cancellation-modal.jsp"/>
     <%-- 예약취소 모달 --%>

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
	  
      <!--  송주현 스크립트 추가  -->
      <script type="text/javascript" src="/reservationmall/resources/js/sjh/editUserInfo.js"></script>
      <!--  송주현 스크립트 추가  -->
  
  </body>
</html>