<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Roboto&display=swap" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/sign-in&register.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="text-center mt-5 top">
					<a class="logo" href="home">Viet<span>Food</span></a>
					<h4 class="mt-3 font-weight-light">Đăng ký tài khoản mới</h4>
				</div>
				<div class="card mt-4 mb-5">
					<div class="card-body">
						<form action="register" id="registerForm" method="post" role="form" novalidate="novalidate">
							<fieldset class="infor-account">
								<legend>Thông tin tài khoản</legend>
								<div class="form-group">
									<label for="username">Username</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-username"
												src="<c:url value="/resources/images/icons/username.png" />">
											</span>
										</div>
										<spring:bind path="account.username">
											<input class="form-control" id="username" name="username" placeholder="Nhập username bao gồm 8 ký tự"
												type="text" value="">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="password">Mật khẩu</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-password"
												src="<c:url value="/resources/images/icons/lock.png" />">
											</span>
										</div>
										<spring:bind path="account.password">
											<input class="form-control" id="password" name="password" placeholder="Nhập mật khẩu bao gồm 8 ký tự"
												type="password">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="ConfirmPassword">Nhập lại mật khẩu</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-lock"
												src="<c:url value="/resources/images/icons/lock.png" />">
											</span>
										</div>
										<input class="form-control" data-val="true" id="ConfirmPassword" name="ConfirmPassword"
											placeholder="Xác nhận mật khẩu" type="password">
									</div>
								</div>
								<div class="form-group">
									<button type="button" id="btn-continue" class="g-recaptcha btn btn-primary btn-block">
										<img alt="icon-continue" src="<c:url value="/resources/images/icons/continue.png" />"> Tiếp tục
									</button>
								</div>
							</fieldset>
							<fieldset class="infor-user">
								<legend>
									<button type="button" id="btn-undo" class="d-flex align-items-center justify-content-center">
										<img alt="icon-register" src="<c:url value="/resources/images/icons/undo.png" />">
									</button>
									Thông tin người dùng
								</legend>
								<div class="form-group">
									<label for="hoTen">Họ tên</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-fullname"
												src="<c:url value="/resources/images/icons/full-name.png" />">
											</span>
										</div>
										<spring:bind path="customer.hoTen">
											<input class="form-control" id="hoTen" name="hoTen" placeholder="Nhập họ tên bao gồm 8 ký tự" type="text"
												value="">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="diaChi">Địa chỉ</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-address"
												src="<c:url value="/resources/images/icons/address.png" />">
											</span>
										</div>
										<spring:bind path="customer.diaChi">
											<input class="form-control" id="diaChi" name="diaChi" placeholder="Nhập địa chỉ" type="text" value="">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="Email">CMND</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-identification"
												src="<c:url value="/resources/images/icons/identification.png" />">
											</span>
										</div>
										<spring:bind path="customer.cmnd">
											<input class="form-control" id="cmnd" name="cmnd" placeholder="Nhập chứng minh nhân dân" type="text" value="">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="Email">Số điện thoại</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-phone"
												src="<c:url value="/resources/images/icons/phone.png" />">
											</span>
										</div>
										<spring:bind path="customer.sdt">
											<input class="form-control" id="sdt" name="sdt" placeholder="Nhập số điện thoại" type="text" value="">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-email"
												src="<c:url value="/resources/images/icons/email.png" />">
											</span>
										</div>
										<spring:bind path="customer.email">
											<input class="form-control" id="email" name="email" placeholder="Nhập email" type="text" value="">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<button class="btn btn-primary btn-block">
										<img alt="icon-register" src="<c:url value="/resources/images/icons/registered.png" />"> Đăng ký
									</button>
								</div>
							</fieldset>
							<p class="text-muted">Khi đăng ký, bạn đã đồng ý với Điều khoản sử dụng và Chính sách bảo mật của chúng tôi.</p>
							<p class="text-center">
								Bạn đã có tài khoản? <a href="sign-in">Đăng nhập!</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var speed = 1000;
			$("#btn-continue").on("click", function() {
				$(".infor-account").slideUp(speed);
				$(".infor-user").slideDown(speed);
			})
			$("#btn-undo").on("click", function() {
				$(".infor-account").slideDown(speed);
				$(".infor-user").slideUp(speed);
			})
		})
	</script>
</body>
</html>