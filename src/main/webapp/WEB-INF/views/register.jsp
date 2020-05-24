<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/sign-in&register.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/sign-in&register.js" />'></script>
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
							    <c:if test="${existAccount != null }">
                                    <p style="color:red">Đã tồn tại user</p>
                                </c:if>
								<legend>Thông tin tài khoản</legend>
								<div class="form-group">
									<label for="username">Username</label> 
									<p class="error"><form:errors path="account.username" ></form:errors></p>
									<p id="error-username" class="error" style="display: none;">* Vui lòng nhập username có độ dài từ 3-20 ký tự bắt đầu là chữ cái</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-username"
												src="<c:url value="/resources/images/icons/username.png" />">
											</span>
										</div>
										<spring:bind path="account.username">
											<input class="form-control" id="username" name="username" placeholder="Nhập username bao gồm 8 ký tự"
												type="text" value="${account.username }">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="password">Mật khẩu</label>
									<p class="error"><form:errors path="account.password"></form:errors></p>
									<p id="error-password" class="error" style="display: none;">* Vui lòng nhập password có độ dài từ 8-20 ký tự, có bao gồm chữ cái, số, và ký tự đặc biệt</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-password"
												src="<c:url value="/resources/images/icons/lock.png" />">
											</span>
										</div>
										<spring:bind path="account.password">
											<input class="form-control" id="password" name="password" placeholder="Nhập mật khẩu bao gồm 8 ký tự"
												type="password" value="${account.password }">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="ConfirmPassword">Nhập lại mật khẩu</label>
									<p id="error-repassword" class="error" style="display: none;">* Nhập sai mật khẩu, hãy nhập lại</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-lock"
												src="<c:url value="/resources/images/icons/lock.png" />">
											</span>
										</div>
										<input class="form-control" data-val="true" id="ConfirmPassword" name="ConfirmPassword"
											placeholder="Xác nhận mật khẩu" type="password" value="${account.password }">
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
									<p class="error"><form:errors path="customer.hoTen"></form:errors></p>
									<p id="error-hoTen" class="error" style="display: none;">* Vui lòng nhập tên</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-fullname"
												src="<c:url value="/resources/images/icons/full-name.png" />">
											</span>
										</div>
										<spring:bind path="customer.hoTen">
											<input class="form-control" id="hoTen" name="hoTen" placeholder="Nhập họ tên" type="text"
												value="${customer.hoTen }">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="diaChi">Địa chỉ</label>
									<p class="error"><form:errors path="customer.diaChi"></form:errors></p>
									<p id="error-diaChi" class="error" style="display: none;">* Vui lòng nhập địa chỉ</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-address"
												src="<c:url value="/resources/images/icons/address.png" />">
											</span>
										</div>
										<spring:bind path="customer.diaChi">
											<input class="form-control" id="diaChi" name="diaChi" placeholder="Nhập địa chỉ" type="text" 
											     value="${customer.diaChi }">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="Email">CMND</label>
									<p class="error"><form:errors path="customer.cmnd"></form:errors></p>
									<p id="error-cmnd" class="error" style="display: none;">* Vui lòng nhập cmnd có 9 số hoặc căn cước có 12 số</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-identification"
												src="<c:url value="/resources/images/icons/identification.png" />">
											</span>
										</div>
										<spring:bind path="customer.cmnd">
											<input class="form-control" id="cmnd" name="cmnd" placeholder="Nhập chứng minh nhân dân" type="text" 
											       value="${customer.cmnd }">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="Email">Số điện thoại</label>
									<p class="error"><form:errors path="customer.sdt"></form:errors></p>
									<p id="error-sdt" class="error" style="display: none;">* Vui lòng nhập số điện thoại có 10 số</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-phone"
												src="<c:url value="/resources/images/icons/phone.png" />">
											</span>
										</div>
										<spring:bind path="customer.sdt">
											<input class="form-control" id="sdt" name="sdt" placeholder="Nhập số điện thoại" type="text" 
											     value="${customer.sdt }">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<p class="error"><form:errors path="customer.email"></form:errors></p>
									<p id="error-email" class="error" style="display: none;">* Vui lòng nhập email</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-email"
												src="<c:url value="/resources/images/icons/email.png" />">
											</span>
										</div>
										<spring:bind path="customer.email">
											<input class="form-control" id="email" name="email" placeholder="Nhập email" type="text" 
											     value="${customer.email }">
										</spring:bind>
									</div>
								</div>
								<div class="form-group">
									<button id="btn-register" class="btn btn-primary btn-block">
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
</body>
</html>