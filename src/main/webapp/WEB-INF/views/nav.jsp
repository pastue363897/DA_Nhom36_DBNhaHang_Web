<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
	<!-- nav -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark mr-auto">
		<div class="container">
			<a class="navbar-brand" href="home">Viet<span>Food</span></a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navBar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navBar">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="home">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="banan">Bàn ăn</a></li>
					<li class="nav-item"><a class="nav-link" href="monan">Món ăn</a></li>
					<li class="nav-item"><a class="nav-link" href="about">Giới thiệu</a></li>
					<li class="nav-item"><a class="nav-link" href="contact">Liên hệ</a></li>
				</ul>
				<jsp:include page="manager-account.jsp"></jsp:include>
			</div>
		</div>
	</nav>
	<!-- end nav -->
	