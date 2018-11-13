/**
 * 게시판 클릭 시 게시판 내용 데이터 불러오는 AJAX통신 게시판 데이터를 불러온 후, 상세보기 클릭 시 토글 효과
 * 
 * @returns
 */

$('#board').on('click', function() {
	
	
	$.ajax({
		async : true, // 이거 생략하면 비동기다.
		type : "get", // 이거 빼면 디폴트가 get
		dataType : "text",
		url : "article/controller.mall",
		success : function(data) {
			// 수신한 데이터 body에 추가
			$("#abcd").append(data);
			
			
			var nameArray = $('button[name= "myhide"]');
			if ($(nameArray) != null) {
				nameArray.each(function(i, btn) {
					
					abc();//모든 항목 hide를 위한 메서드 
					
					
					$(nameArray[i]).on('click', function() {
						
						var contents = $('[name="conts"]');
						contents.each(function(j, con) {
							
							if (i == j) {
								$(contents[j]).toggle();
							}
						})// 이벤트 내용 끝
					});
				})// each
			}// if
		
			
		}// success
	});// ajax
	

	
	
});


function abc() {
	var contents = $('[name="conts"]');
	contents.each(function(j, con) {
		$(con).hide();
	});
}

$('#notice').on('hidden.bs.modal', function() {
	$.ajax({
		async : true, // 이거 생략하면 비동기다.
		type : "get", // 이거 빼면 디폴트가 get
		dataType : "text",
		url : "article/controller.mall",
		success : function(data) {
			// 수신한 데이터 body에 추가
			$("#abcd").append(data);
			
			
			var nameArray = $('button[name= "myhide"]');
			if ($(nameArray) != null) {
				nameArray.each(function(i, btn) {
					abc();//모든 항목 hide를 위한 메서드 
					
					$(nameArray[i]).on('click', function() {
						var contents = $('[name="conts"]');
						contents.each(function(j, con) {
							if (i == j) {
								$(contents[j]).toggle();
							}
						})// 이벤트 내용 끝
					});
				})// each
			}// if
		
		}// success
	});// ajax
})

