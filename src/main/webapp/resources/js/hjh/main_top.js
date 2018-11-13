window.onload = function(){
	if(document.getElementById("logoutBtn")!=null){
		document.getElementById("logoutBtn").onclick = function(){
			setCookie('loginId', '');
			location.replace('index.jsp');
		}
	}
	document.getElementById("registerBtn").onclick = function(){
		location.href = "/reservationmall/login/regist_form.mall";
	}
}

function setCookie(cname,cvalue) {
    var d = new Date();
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function searchHotel(hotelName){
	$("#searchValueType option:eq(1)").attr("selected", "selected");
	$("#searchValueInput").val(hotelName);
	location.href="#search";
}

function addWishList(hotel_id){
	if(getCookie('loginId').size ==undefined){
		$("#hotelMapInfo"+hotel_id).text("로그인이 필요한 기능입니다.");
		setTimeout(function(){
			$("#hotelMapInfo"+hotel_id).text("");
		},3000);
		return null;
	}
	
	$.ajax({
		type : "post",
		url : '/reservationmall/wishlist.mall',
		data : {
			hotel_id : hotel_id,
			user_id : getCookie('loginId')
		},
		dataType : "text",
		success : function(resultType) {
			if(resultType.trim()=='success'){
				$("#hotelMapInfo"+hotel_id).text("위시리스트에 등록되었습니다.");
				setTimeout(function(){
					$("#hotelMapInfo"+hotel_id).text("");
				},3000);
			}else if(resultType.trim()=="exist"){
				$("#hotelMapInfo"+hotel_id).text("이미 등록된 호텔입니다.");
				setTimeout(function(){
					$("#hotelMapInfo"+hotel_id).text("");
				},3000);
			}else{
				$("#hotelMapInfo"+hotel_id).text("등록 실패");
				setTimeout(function(){
					$("#hotelMapInfo"+hotel_id).text("");
				},3000);
			}

		},
		error : function() {
			console.log('실패');
		}
	});
	
}

function getCookie(cname)
{
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i=0; i<ca.length; i++)
    {
        var c = ca[i];
        while(c.charAt(0) == ' ')
        {
            c = c.substring(1);
        }
        if(c.indexOf(name) == 0)
        {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
