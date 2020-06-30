$(document).ready(function() {
	var speed = 1000;
	$("#btn-continue").on("click", function(event) {
		var username = $("#username").val();
		var password = $("#password").val();
		var repassword = $("#ConfirmPassword").val();
		var result = true;
		if (!username.match(/^[a-zA-Z][a-zA-Z0-9]{2,19}$/)) {
			$("#error-username").show();
			result = false;
		} else {
			$("#error-username").hide();
		}
		if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,20}$/)) {
			$("#error-password").show();
			result = false;
		} else {
			$("#error-password").hide();
			if (repassword != password) {
				$("#error-repassword").show();
				result = false;
			} else {
				$("#error-repassword").hide();
			}
		}
		if (!result){
			event.preventDefault();
			return;
		}
		$(".infor-account").slideUp(speed);
		$(".infor-user").slideDown(speed);
	})
	$("#btn-undo").on("click", function() {
		$(".infor-account").slideDown(speed);
		$(".infor-user").slideUp(speed);
	})
	$("#btn-register").on("click", function(event) {
		var hoTen = $("#hoTen").val();
		var diaChi = $("#diaChi").val();
		var cmnd = $("#cmnd").val();
		var sdt = $("#sdt").val();
		var email = $("#email").val();
		var result = true;
		if (!hoTen.match(/^\p{L}{1,7}( \p{L}{1,7}){0,5}$/gu)) {
			$("#error-hoTen").show();
			result = false;
		} else {
			$("#error-hoTen").hide();
		}
		if (!diaChi.match(/^([1-9][0-9]{0,}[A-Z]?)(\/([1-9][0-9]{0,}[A-Z]?)){0,5}(( [\p{L}]{2,7}){1,15}( [1-9][0-9]{0,}[A-Z]?)?,){2,10}(( \p{L}{2,7}){1,15})$/gu)) {
			$("#error-diaChi").show();
			result = false;
		} else {
			$("#error-diaChi").hide();
		}
		if (!cmnd.match(/^[0-9](\d{8}|\d{11})$/)) {
			$("#error-cmnd").show();
			result = false;
		} else {
			$("#error-cmnd").hide();
		}
		if (!sdt.match(/^0[1-9][0-9]{8}$/)) {
			$("#error-sdt").show();
			result = false;
		} else {
			$("#error-sdt").hide();
		}
		if (!email.match(/^[a-zA-Z][a-zA-Z0-9_\.]{5,32}@[a-z0-9]{2,30}(\.[a-z0-9]{2,4}){1,2}$/)) {
			$("#error-email").show();
			result = false;
		} else {
			$("#error-email").hide();
		}
		if (!result){
			event.preventDefault();
		}
	})
	$("#btn-signin").on("click", function(event) {
		var username = $("#username").val();
		var password = $("#password").val();
		var result = true;
		if (!username.match(/^[a-zA-Z][a-zA-Z0-9]{2,19}$/)) {
			$("#error-username").show();
			result = false;
		} else {
			$("#error-username").hide();
		}
		if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,20}$/)) {
			$("#error-password").show();
			result = false;
		} else {
			$("#error-password").hide();
		}
		if (!result){
			event.preventDefault();
		}
	})
});