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
	<title>관리자 모드</title>
	<!-- Bootstrap core CSS -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Custom styles for this template -->
	<link href="/reservationmall/resources/css/template/owl.carousel.css" rel="stylesheet">
	<link href="/reservationmall/resources/css/template/owl.theme.default.min.css"  rel="stylesheet">
	<link href="/reservationmall/resources/css/template/style.css" rel="stylesheet">
	<link href="/reservationmall/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	
</head>
<body>
	<!-- top 네비게이션 -->
	<jsp:include page="/WEB-INF/view/main/basic_top.jsp"></jsp:include>
		<div class="container">
			<div style="height:100px"></div>	
		</div>
	<div class="container">
		
	 <ul id="myTab" class="nav nav-tabs" role="tablist">
	 <li role="presentation" class="dropdown active">
        <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents">통계정보 <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
          <li><a href="#dropdown1" tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">날짜별</a></li>
          <li><a href="#dropdown2" tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">호텔별</a></li>
        </ul>
      </li>
      <li role="presentation"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">호텔 관리</a></li>
      <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">QA관리</a></li>
      <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">회원관리</a></li>
      
    </ul>
    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
        <script type="text/javascript" src="/reservationmall/resources/js/common/Chart.js"></script>
			<div id="container" style="border: solid 1px black; width: 100%; 
			height: 300px; margin-bottom: 10px;">
			        <canvas id="canvas" style="margin-left: 5px;"></canvas>
			    </div>
			
			    <script type="text/javascript">
			        var ChartHelper = {
			            chartColors: {
			                red: 'rgb(255, 99, 132)'
			                , orange: 'rgb(255, 159, 64)'
			                , yellow: 'rgb(255, 205, 86)'
			                , green: 'rgb(75, 192, 192)'
			                , blue: 'rgb(54, 162, 235)'
			                , purple: 'rgb(153, 102, 255)'
			                , grey: 'rgb(201, 203, 207)'
			            }
			        };
			
			        var color = Chart.helpers.color;
			
			        var data1 = null;
			        var data2 = null;
			        var barChartData = null;
			
			        // todo: data setting
			        data1 = ['10', '20', '30', '40', '50', '60', '70', '80'
			, '90', '100', '110', '120'];
			        data2 = ['120', '110', '100', '90', '80', '70', '60', '50'
			, '40', '30', '20', '10'];
			
			        barChartData = {
			            labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'
			, '9월', '10월', '11월', '12월']
			            , datasets: [
			                {
			                    label: 'DataSet1'
			                    , backgroundColor: 
			color(ChartHelper.chartColors.blue).alpha(0.5).rgbString()
			                    , borderColor: ChartHelper.chartColors.blue
			                    , borderWidth: 1
			                    , data: data2
			                }
			                , {
			                    label: 'DataSet2'
			                    , backgroundColor: 
			color(ChartHelper.chartColors.red).alpha(0.5).rgbString()
			                    , borderColor: ChartHelper.chartColors.red
			                    , borderWidth: 1
			                    , data: data1
			                }
			            ]
			        };
			
			        var ctx = document.getElementById('canvas').getContext('2d');
			
			        window.BarChart = new Chart(ctx, {
			            type: 'bar'
			// 옆으로 누운 bar 차트를 쓰실 경우 바꾸시면 됩니다.
			            //type: 'horizontalBar'
			            , data: barChartData
			            , options: {
			// responsive, maintainAspectRatio의 설정이 아래와 같이 해야
			// 브라우저의 크기를 변경해도 canvas를 감싸고 있는
			// div의 크기에 따라 차트가 깨지지 않고 이쁘게 출력 됩니다. 
			                responsive: true   //auto size : true
			                , maintainAspectRatio: false
			                , legend: {
			                    position: 'top'
			                }
			                , title: {
			                    display: true
			                    , text: 'Chart Title'
			                }
			// Bar 하나에 데이터 모두 보여줄 경우 사용
			// 주석 처리 할 경우 이 예제에서는 data1, data2 각각 bar가 2개씩 나옵니다.
			                //, scales: {
			                //    xAxes: [
			                //        { stacked: true }
			                //    ]
			                //    , yAxes: [
			                //        { stacked: true }
			                //    ]
			                //}
			
			// or bar chart 하나씩 보여줄 경우
			                  , scales: {
			                        yAxes: [{
			                            ticks: {
			// Y 축 0부터 시작
			                                beginAtZero:true
			// Y 축 정수로 보여주기 
			// 숫자가 작거나 또는 0인 경우 등 자동으로 보여주므로 소숫점으로 나타난다
			                                , callback: function (value) {
			                                    if (0 === value % 1) {
			                                        return value;
			                                    }
			                                }
			                            }
			                        }]
			                    }
			// 아래 주석 처리하여도 포인터를 바에 가져가면 수치가 나옵니다.
			// 그러나 min 버젼을 link할 경우 영역에다 가져가면 나오질 않아요
			// 또한 툴팁에 해당 데이터의 색도 나오지 않습니다.
			// 직접 코딩 후 min 버젼으로 교체하여 테스트 해보시면 차이를 알 수 있습니다.
			                // Tooltip 
			                //, tooltips: {
			                //    mode: 'index',
			                //    intersect: false,
			                //},
			                //hover: {
			                //    mode: 'nearest',
			                //    intersect: true
			                //}
			            }
			        });
			
			        var colorNames = Object.keys(ChartHelper.chartColors);
    		</script>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="dropdown1" aria-labelledBy="dropdown1-tab">
        <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="dropdown2" aria-labelledBy="dropdown2-tab">
        <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
      </div>
    </div>
	</div>

	<!-- bottom네비게이션 -->
	<jsp:include page="/WEB-INF/view/main/main_bottom.jsp"></jsp:include>
	
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