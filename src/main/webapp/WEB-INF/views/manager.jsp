<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Roboto&display=swap" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/sign-in&register.css" />'>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/manager.css" />">
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/manager.js" />'></script>
</head>
<body>
	<input type="checkbox" id="side-check">
	<div class="sidebar">
		<header>
			<center>
				<img class="profile-image" src='<c:url value="/resources/images/icons/avatar.png" />' alt="icon-account">
				<h3>${customer.hoTen }</h3>
			</center>
		</header>
		<nav>
			<div class="icon-bar">
				<label for="side-check"> <img id="id-iconbar" src='<c:url value="/resources/images/icons/icon-bar.png" />'>
					<img id="id-iconbarleft" src='<c:url value="/resources/images/icons/icon-barleft.png" />'>
				</label>
			</div>
			<ul class="manger">
				<li id="manager-account" class="manager-active"><img class="icon" alt=""
					src='<c:url value="/resources/images/icons/manager-account.png" />'> <span>Quản lý tài khoản</span></li>
				<li id="manager-bill"><img class="icon" alt="" src='<c:url value="/resources/images/icons/bill-table.png" />'>
					<span>Quản lý bàn đặt</span></li>
				<li id="manager-order"><img class="icon" alt="" src='<c:url value="/resources/images/icons/order-table.png" />'>
					<span>Đặt bàn</span></li>
				<li id="shopping-cart"><img class="icon" alt=""
					src='<c:url value="/resources/images/icons/shopping_cart.png" />'> <span>Giỏ hàng</span></li>
				<li id="close"><img class="icon" alt="" src='<c:url value="/resources/images/icons/logout-white.png" />'>
					<span>Thoát</span></li>
			</ul>
		</nav>
	</div>
	<div class="content-manager">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="text-center mt-5 top">
						<a class="logo" href="home">Viet<span>Food</span></a>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div id="manager-account-content" class="col-md-6 manager-content">
					<div>
						<nav>
							<div class="nav nav-tabs" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" role="tab" href="#nav-account">Tài khoản</a> <a
									class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" role="tab" href="#nav-user">Cá nhân</a>
							</div>
						</nav>
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-account">
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
											<input class="form-control" id="username" name="username" placeholder="Nhập username bao gồm 8 ký tự"
												type="text" value="${account.username }">
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
											<input class="form-control" id="password" name="password" placeholder="Nhập mật khẩu bao gồm 8 ký tự"
												type="password" value="${account.password }">
										</div>
									</div>
									<div class="form-group">
										<button type="button" id="update-account" class="g-recaptcha btn btn-primary btn-block">
											<img alt="icon-continue" src="<c:url value="/resources/images/icons/update.png" />"> Cập nhật
										</button>
									</div>
								</fieldset>
							</div>
							<div class="tab-pane fade" id="nav-user">
								<fieldset class="infor-user">
									<legend> Thông tin người dùng </legend>
									<div class="form-group">
										<label for="hoTen">Họ tên</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> <img alt="icon-fullname"
													src="<c:url value="/resources/images/icons/full-name.png" />">
												</span>
											</div>
											<input class="form-control" id="hoTen" name="hoTen" placeholder="Nhập họ tên bao gồm 8 ký tự" type="text"
												value="${customer.hoTen }">
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
											<input class="form-control" id="diaChi" name="diaChi" placeholder="Nhập địa chỉ" type="text" value="${customer.diaChi }">

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
											<input class="form-control" id="cmnd" name="cmnd" placeholder="Nhập chứng minh nhân dân" type="text" value="${customer.cmnd }">

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
											<input class="form-control" id="sdt" name="sdt" placeholder="Nhập số điện thoại" type="text" value="${customer.sdt }">

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
											<input class="form-control" id="email" name="email" placeholder="Nhập email" type="text" value="${customer.email }">

										</div>
									</div>
									<div class="form-group">
										<button type="button" id="update-user" class="btn btn-primary btn-block">
											<img alt="icon-register" src="<c:url value="/resources/images/icons/update.png" />"> Cập nhật
										</button>
									</div>
								</fieldset>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="manager-bill-content" class="manager-content">
			 <p>Bill</p>
			</div>
			<div id="manager-order-content" class="manager-content">
             <p>Order</p>
            </div>
            <div id="manager-shopping-cart-content" class="manager-content">
             <p>Shopping Cart</p>
            </div>
		</div>
	</div>

</body>
</html>