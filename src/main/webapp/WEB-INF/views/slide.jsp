<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- slide -->
<div id="slide" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active" style="background-image: url('<c:url value="/resources/images/bg_1.jpg" />');">
			<div class="overlay"></div>
			<div class="criteria">
				<h1 class="criteria-item">Đặt bàn tại một thời điểm thuận tiện cho bạn</h1>
				<p>
					<button type="button" class="btn btn-outline-white px-5 py-3">Đặt bàn</button>
				</p>
			</div>
		</div>
		<div class="carousel-item" style="background-image: url('<c:url value="/resources/images/bg_2.jpg" />');">
			<div class="overlay"></div>
			<div class="criteria">
				<h1 class="criteria-item">Món ngon &amp; đậm hương vị</h1>
				<p>
					<button type="button" class="btn btn-outline-white px-5 py-3">Đặt bàn</button>
				</p>
			</div>
		</div>
		<div class="carousel-item" style="background-image: url('<c:url value="/resources/images/bg_3.jpg" />');">
			<div class="overlay"></div>
			<div class="criteria">
				<h1 class="criteria-item">Không gian yên bình</h1>
				<p>
					<button type="button" class="btn btn-outline-white px-5 py-3">Đặt bàn</button>
				</p>
			</div>
		</div>
	</div>
	<a class="carousel-control-prev hidden" href="#slide" role="button" data-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="carousel-control-next hidden" href="#slide" role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>
<!-- end slide -->