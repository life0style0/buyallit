    
    $(function(){ 
        $('ul.nav-tabs a').click(function (e) { //부트스트랩 탭메뉴
          e.preventDefault()
          $(this).tab('show')
        })
        
        if($('#logoutBtn') != null){ // 로그아웃
        	$('#logoutBtn').on('click',function(){
        		var d = new Date();
        	    var expires = "expires=" + d.toGMTString();
        	    document.cookie = 'loginId' + "=" + '' + ";" + expires + ";path=/";
        	    location.href='/reservationmall/index.jsp';
        	});
        } 
        
        if($('#withdrawalMOpenBtn') != null){ // 회원 탈퇴
          $('#withdrawalMOpenBtn').click(function(){
        	  
        	  $('#withdrawalBtn').on('click',function(){
        		  console.log('탈퇴 버튼 클릭');
        		  var userId= '<%=loginId%>';
        		  console.log(userId);
        		  
        		  $.ajax({
        			  data: {
        				'userId' :   userId
        			  },
        			  url:"/reservationmall/individual/withdrawal.mall",
        			  success: function(data){
        				 // alert('탈퇴성공');
        				 data= data.trim();
        				 if(data=='withdrawalSuccess'){
        					 var d = new Date();
        	        	     var expires = "expires=" + d.toGMTString();
        					 document.cookie = 'loginId' + "=" + '' + ";" + expires + ";path=/";
        					 $('#withdrawal-confirm-Modal').modal();
        				 } else if(data == 'withdrawalFail'){
        					 alert('from server : withdrawalFail');
        				 }
        			  }, 
        			  error: function(){
        				 alert('서버로부터 전송 에러');
        			  }
        		  });
        	  });
        	  $('#withdrawal-Modal').modal();
          })
        }
        
        if($('button[name=write-reviewOpenBtn]') != null){ //리뷰 쓰기 버튼
        	$('button[name=write-reviewOpenBtn]').on('click',function(){
        		//alert('리뷰 쓰기 버튼');
        		
        		var writeReviewId= $(this).context.value;
        		var hotelName= $(this).parents('.section-text').find('[name="res_hotel_name"]').text();
        		var roomName= $(this).parents('.section-text').find('[name="res_room_name"]').text();
        		var checkin= $(this).parents('.section-text').find('[name="res_start_day"]').text();
        		var checkout= $(this).parents('.section-text').find('[name="res_end_day"]').text();
        		
        		$('#modal-write-review-id').html(writeReviewId);
        		$('#write-review-hotel-name').html(hotelName);
        		$('#write-review-room-name').html(roomName);
        		$('#write-review-checkin').html(checkin);
        		$('#write-review-checkout').html(checkout);
        		
        		$('#write-review_res_id').removeAttr('value');
        		$('#write-review_res_id').attr('value',writeReviewId);
        		
        		
        		$('#write-reviewBtn').on('click',function(){
        			$('#writeReviewForm').submit();
        		});
        	});
        }
        
        	if($('button[name="reading-reviewOpenBtn"]')!= null){ //리뷰읽기
        		$('button[name="reading-reviewOpenBtn"]').on('click',function(){
        			var reservation_id=$(this).context.value;

        			$.ajax({
            			data: {
            				'reservation_id' :   reservation_id
            			},
            			dataType : 'json',
            			url:"/reservationmall/individual/readReview.mall",
            			success: function(data){
            				$('#modal-read-review-id').html(reservation_id);
            				
            				var content=data.review_content.replace(/\r\n/g, '<br />');
            				$('#read-review-text').html(content);
            				
            				$('#readReviewForm input[name="review_price_rate"]').removeAttr('value');
            				$('#readReviewForm input[name="review_price_rate"]').attr('value',data.review_price_rate);
            				  
            				$('#readReviewForm input[name="review_service_rate"]').removeAttr('value');
            				$('#readReviewForm input[name="review_service_rate"]').attr('value',data.review_service_rate);
            				$('#readReviewForm input[name="review_food_rate"]').removeAttr('value');
            				$('#readReviewForm input[name="review_food_rate"]').attr('value',data.review_food_rate);
            				$('#readReviewForm input[name="review_clean_rate"]').removeAttr('value');
            				$('#readReviewForm input[name="review_clean_rate"]').attr('value',data.review_clean_rate);
            				$('#readReviewForm input[name="review_location_rate"]').removeAttr('value');
            				$('#readReviewForm input[name="review_location_rate"]').attr('value',data.review_location_rate);
            				  
            				var readRatingList= $('#readReviewForm span[name="star-rating"]');
            				readStarRating(readRatingList);
            				
            			  }, 
            			  error: function(){
            				 alert('서버로부터 전송 에러');
            			  }
            		  });
        		})
        }
        
        if($('button[name=cancellationOpenBtn]') != null){ //예약 취소 버튼
        	$('button[name=cancellationOpenBtn]').on('click',function(){
        		
        		var cancellationId= $(this).context.value;
        		var hotelName= $(this).parents('.section-text').find('[name="res_hotel_name"]').text();
        		var roomName= $(this).parents('.section-text').find('[name="res_room_name"]').text();
        		var checkin= $(this).parents('.section-text').find('[name="res_start_day"]').text();
        		var checkout= $(this).parents('.section-text').find('[name="res_end_day"]').text();
        		console.log(cancellationId);
        
        		
        		$('#modal-cancellation-id').html(cancellationId);
        		$('#cancellation-hotel-name').html(hotelName);
        		$('#cancellation-room-name').html(roomName);
        		$('#cancellation-checkin').html(checkin);
        		$('#cancellation-checkout').html(checkout);
        		
        		$('#cancellation_res_id').removeAttr('value');
        		$('#cancellation_res_id').attr('value',cancellationId);
        		
        		
        		$('#cancellationBtn').on('click',function(){
        			$('#cancellationForm').submit();
        		});
        	});
        }
    })
