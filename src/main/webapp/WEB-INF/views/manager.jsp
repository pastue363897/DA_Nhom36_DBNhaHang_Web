<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý thông tin</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery-ui.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery.timepicker.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/sign-in&register.css" />'>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/manager.css" />">
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/jquery-ui.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.timepicker.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/manager.js" />'></script>
</head>
<body>
	<input type="checkbox" id="side-check">
	<div class="sidebar">
		<header>
			<center>
				<img class="profile-image" src='<c:url value="/resources/images/icons/avatar.png" />' alt="icon-account">
				<h3 id="tenKH">${customer.hoTen }</h3>
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
	<div class="content-manager pm-1">
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
								<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" role="tab" href="#nav-account">Tài
									khoản</a> <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" role="tab" href="#nav-user">Cá
									nhân</a>
							</div>
						</nav>
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-account">
								<fieldset class="infor-account">
									<legend>Thông tin tài khoản</legend>
									<div class="form-group">
										<label for="username">Username</label>
										<p id="error-username" class="error" style="display: none;">* Vui lòng nhập username có độ dài từ 3-20 ký tự bắt đầu là chữ cái</p>
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
										<p id="error-password" class="error" style="display: none;">* Vui lòng nhập password có độ dài từ 8-20 ký tự, có bao gồm chữ cái, số, và ký tự đặc biệt</p>
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
										<p id="error-hoTen" class="error" style="display: none;">* Vui lòng nhập tên</p>
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
										<p id="error-diaChi" class="error" style="display: none;">* Vui lòng nhập địa chỉ</p>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> <img alt="icon-address"
													src="<c:url value="/resources/images/icons/address.png" />">
												</span>
											</div>
											<input class="form-control" id="diaChi" name="diaChi" placeholder="Nhập địa chỉ" type="text"
												value="${customer.diaChi }">

										</div>
									</div>
									<div class="form-group">
										<label for="Email">CMND</label>
										<p id="error-cmnd" class="error" style="display: none;">* Vui lòng nhập cmnd có 9 số hoặc căn cước có 12 số</p>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> <img alt="icon-identification"
													src="<c:url value="/resources/images/icons/identification.png" />">
												</span>
											</div>
											<input class="form-control" id="cmnd" name="cmnd" placeholder="Nhập chứng minh nhân dân" type="text"
												value="${customer.cmnd }">

										</div>
									</div>
									<div class="form-group">
										<label for="Email">Số điện thoại</label>
										<p id="error-sdt" class="error" style="display: none;">* Vui lòng nhập số điện thoại có 10 số</p>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> <img alt="icon-phone"
													src="<c:url value="/resources/images/icons/phone.png" />">
												</span>
											</div>
											<input class="form-control" id="sdt" name="sdt" placeholder="Nhập số điện thoại" type="text"
												value="${customer.sdt }">

										</div>
									</div>
									<div class="form-group">
										<label for="email">Email</label>
										<p id="error-email" class="error" style="display: none;">* Vui lòng nhập email</p>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"> <img alt="icon-email"
													src="<c:url value="/resources/images/icons/email.png" />">
												</span>
											</div>
											<input class="form-control" id="email" name="email" placeholder="Nhập email" type="text"
												value="${customer.email }">

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
			<div class="row">
				<div id="manager-bill-content" class="col-12 manager-content">
					<div class="row"></div>
				</div>
				<div id="example-item-bandat" style="display: none;">
					<div class="col-md-6">
						<div class="item-bandat">
							<div class="content-bandat">
								<div class="row">
									<div class="col-md-4 box">
										<img alt="" src="data/images/ban-an/BA000001_table_image.jpg">
									</div>
									<div class="col-md-8 content-info-bandat">
										<h3>Bàn ăn <span>A1-01</span></h3>
										<div class= "tongTien">
											Tổng tiền: <span>120000</span> Đ
										</div>
										<div class="soGhe">
											Số ghế: <span>2</span>
										</div>
										<div class="bandat-time">
											<div class="ngayDat">
												Ngày đặt: <span>May 17, 2020, 2:25:57 PM</span>
											</div>
											<div class="ngayPhucVu">
												Ngày phục vụ: <span>May 19, 2020, 12:00:00 PM</span>
											</div>
										</div>
										<div class="bandat-pay">
											<div class="daHuy"><span class="bg-danger rounded">Đã hủy</span></div>
											<div class="chuaThanhToan"><span class="bg-info rounded">Chưa thanh toán</span></div>
											<div class="daThanhToan">
												<span class="bg-success rounded">Đã thanh toán</span>
												<div class="chiTietThanhToan">
												    <div class="ngayThanhToan">Ngày thanh toán: <span>May 19, 2020, 12:00:00 PM</span></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<a class="a" href="">Xem chi tiết</a>
									</div>
								</div>
							</div>
							<div class="content-detail-bandat">
								<div class="content-banan">
									<p>Quý khách nên đặt chỗ trước từ 60 phút để được hỗ trợ tốt nhất.Bàn đặt của Quý khách được giữ tối đa 15
										phút.</p>
									<div class="phuGia">
										Phụ giá: <span>50000</span>
									</div>
								</div>
								<div class="content-danhsach-monan">
									<div class="row">
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="example-item-monan" style="display: none;">
				    <div class="col-md-6 monan">
				        <div>
		                    <img alt="image-monan" src="data/images/mon-an/MA000002_meal_image.jpg" />
		                    <div class="content-monan">
		                        <h5>Bánh cuốn</h5>
	                            <div class="detail-monan-selectd">
	                                <div class="giaMA">
	                                    Đơn giá: <span>50000</span> Đ
	                                </div>
	                                <div class="soLuongChon">
	                                    Số lượng: <span>2</span>
	                                </div>
	                            </div>
		                    </div>
		                    
	                    </div>
	                </div>
                </div>
			</div>
			<div class="row">
				<div id="manager-order-content" class="col-12 manager-content">
					<p>Order</p>
				</div>
			</div>
			<div class="row">
				<div id="manager-shopping-cart-content" class="col-12 manager-content">
					
				</div>
				<div id="example-item-cart-bandat" style="display: none;">
				    <div class="row item-cart-bandat">
				       <input type="hidden" class="index-bandat" value="0">
                       <div class="col-md-3 item-cart-left">
                           <input type="hidden" class="maBA" value="BA000001">
                           <div class="img img-item-cart" style="background-image: url('/nhom36/data/images/ban-an/BA000001_table_image.jpg');"></div>
                           <div class="group-button">
                               <button type="button" class="btn btn-danger datban">Đặt bàn</button>
                               <button type="button" class="btn btn-warning huyban">Hủy</button>
                           </div>
                           <div>
                            <input type="text" class="form-control mr-5 gioPhucVu" value="12:00">
                            <input type="text" class="form-control itemCartNgayPhucVu form-control">
                            <button type="button" class="btn btn-secondary btn-sm btn-tooltip">Gợi ý</button>
                          </div>
                       </div>
                       <div class="col-md-9 item-cart-right">
                            <div class="row info-banan">
                                <h3 class="heading">Bàn ăn <span>A1-01</span></h3>
                                <p class="moTa">Quý khách nên đặt chỗ trước từ 60 phút để được hỗ trợ tốt nhất.Bàn đặt của Quý khách được giữ tối đa 15 phút.</p>
                                <p class="soGhe">Số ghế: <span>2</span></p>
                                <div class="phuGia">Phụ giá: <span>50,000</span> Đ</div>
                            </div>
                            <div class="row dansach-monan">
                                
                            </div>
                        </div>
                    </div>
				</div>
				<div id="example-item-cart-monan" style="display: none;">
				    <div class="col-md-4 d-flex item-food-select">
	                     <div class="item-food">
	                         <input type="hidden" class="itemSelectMaMA" value="MA000007">
	                         <div class="img item-img"
	                             style="background-image: url(&quot;/nhom36/data/images/mon-an/MA000007_meal_image.jpg&quot;);"></div>
	                         <div class="info-monan d-flex">
	                             <div class="item-info">
	                                 <h5>Cơm sườn nướng</h5>
	                                 <div>
	                                  <span>Số lượng: <input type="text" class="itemCount" value="1"></span>
	                                 </div>
	                                 <div>
	                                      <span class="price">30,000</span> Đ
	                                 </div>
	                             </div>
	                         </div>
	                         <span class="img cancel huymon" style="background-image: url(/nhom36/resources/images/icons/cancel.png)"></span>
	                     </div>
	                 </div>
				</div>
			</div>
		</div>
	</div>
	<div id="messageModal" class="modal fade" tabindex="-1" role="dialog">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="messageModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div id="messageModelBody" class="modal-body">
	        ...
	      </div>
	      <div id="messageModelFooter" class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>