<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
					<h4 class="mt-3 font-weight-light">Đăng nhập vào Việt Food</h4>
				</div>
				<div class="card mt-4 mb-5">
					<div class="card-body">
						<form:form action="sign-in" id="loginForm" method="post" role="form" modelAttribute="account">
							<fieldset>
								<div class="form-group">
									<label for="Email">Username</label>
									<p class="error"><form:errors path="username" ></form:errors></p>
									<p id="error-username" class="error" style="display: none;">* Vui lòng nhập username có độ dài từ 3-20 ký tự bắt đầu là chữ cái</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-username"
												src="<c:url value="/resources/images/icons/username.png" />">
											</span>
										</div>
										<form:input path="username" class="form-control" placeholder="Nhập username bao gồm 8 ký tự" type="text" value="" />
									</div>
								</div>
								<div class="form-group">
									<label for="password">Mật khẩu</label>
									<p class="error"><form:errors path="password"></form:errors></p>
									<p id="error-password" class="error" style="display: none;">* Vui lòng nhập password có độ dài từ 8-20 ký tự, có bao gồm chữ cái, số, và ký tự đặc biệt</p>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <img alt="icon-password"
												src="<c:url value="/resources/images/icons/lock.png" />">
											</span>
										</div>
										<form:input path="password" type="password" class="form-control" data-val="true" placeholder="Nhập mật khẩu bao gồm 8 ký tự" />
									</div>
								</div>
								<div class="form-group">
									<button id="btn-signin" class="btn btn-primary btn-block" type="submit">
										<img alt="icon-signin" src="<c:url value="/resources/images/icons/login.png" />"> Đăng nhập
									</button>
								</div>
								<p class="text-center">
									Bạn chưa có tài khoản? <a href="register">Đăng ký!</a>
								</p>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>