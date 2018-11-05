window.onload = function(){
	if(document.getElementById("logoutBtn")!=null){
		document.getElementById("logoutBtn").onclick = function(){
			setCookie('loginId', '');
			location.replace('index.jsp');
		}
	}
}

function setCookie(cname,cvalue) {
    var d = new Date();
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}