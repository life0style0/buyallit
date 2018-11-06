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