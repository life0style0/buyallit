/*
window.onload = function(){

	alert('마이페이지 온로드');
	
	if(document.getElementById("logoutBtn")!=null){
		document.getElementById("logoutBtn").onclick = function(){
			console.log('로그아웃 버튼');
			setCookie('loginId', '');
			location.replace('/reservationmall/index.jsp');
		}
	}

}

function setCookie(cname,cvalue) {
    var d = new Date();
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
*/