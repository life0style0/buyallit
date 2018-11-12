function logout(url){
	setCookie('loginId', '');
	//location.replace('index.jsp');
	location.replace(url);
}

function setCookie(cname,cvalue) {
    var d = new Date();
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}