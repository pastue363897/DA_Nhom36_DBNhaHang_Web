<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VietFood</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/nav.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/footer.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/manager-account.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<style type="text/css">
.about {
    margin-top: 20px;
    counter-reset: section;
}
.about h5 {
	counter-reset: subsection;
}

.about h5::before {
	counter-increment: section;
	content: counter(section) ". ";
}

.about h6::before {
	counter-increment: subsection;
	content: counter(section) "." counter(subsection) " ";
}
.about img {
    max-width: 300px;
    max-height: 300px;
    margin-bottom: 20px;
    margin-right: 20px;
}
.about > div {
    font-style: italic;
    font-weight: 450;
}
.about > div > p {
    font-style: normal;
    font-weight: 300;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container about">
		<h3>Giới thiệu về website VietFood và hướng dẫn sử dụng</h3>
		<h5>Giới thiệu</h5>
		<p>
          Trang web VietFood được phát triển bởi nhóm 36, giúp khách hàng có thể đặt bàn trong nhà hàng VietFood qua mạng mà không phải tốn thời gian đến
          trực tiếp quán để đặt bàn, việc đặt qua mạng giúp khách hàng linh loạt trong sắp xếp thời gian cho bữa ăn của mình đồng thời giúp VietFood quản lý
          tốt hơn trong hỗ trợ khách hàng.
        </p>
		<h5>Hướng dẫn</h5>
		<h6>Đăng ký tài khoản</h6>
		  <div>
		      Bước 1:
		      <p>Chọn đăng ký góc trên bên phải màn hình</p>
		      <img alt="manual" src="<c:url value="/resources/images/manual/register_buoc1.PNG" />">
		  </div>
		  <div>
              Bước 2:
              <p>Nhập thông tin theo form và chọn đăng ký</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/register_buoc2a.PNG" />">
              <img alt="manual" src="<c:url value="/resources/images/manual/register_buoc2b.PNG" />">
          </div>
          <div>
              Bước 3:
              <p>Đăng ký thành công màn hình đăng nhập sẽ hiển thị</p>
          </div>
		<h6>Đăng nhập tài khoản</h6>
		  <div>
              Bước 1:
              <p>Chọn đăng nhập góc trên bên phải màn hình hoặc chuyển từ trang đăng ký qua</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/signin_buoc1.PNG" />">
          </div>
          <div>
              Bước 2:
              <p>Nhập thông tin theo form và chọn đăng nhập</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/signin_buoc2.PNG" />">
          </div>
          <div>
              Bước 3:
              <p>Đăng nhập thành công sẽ quay trở về trang chủ</p>
          </div>
		<h6>Đặt bàn</h6>
		  <div>
              Bước 1:
              <p>Click hoặc nhấp chọn bàn muốn đặt</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/order_buoc1.PNG" />">
          </div>
          <div>
              Bước 2:
              <p>Thông tin bàn ăn được hiển thị bên phải</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/order_buoc2.PNG" />">
              <p>Danh sách món ăn nằm bên trái click hoặc nhấn chọn món ăn sẽ được thêm vào danh sách</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/order_buoc2.PNG" />">
          </div>
          <div>
              Bước 3:
              <p>Danh sách món ăn nằm bên trái click hoặc nhấn chọn món ăn sẽ được thêm vào danh sách</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/order_buoc3a.PNG" />">
              <p>Danh sách món ăn đã chọn nằm dưới thông tin bàn ăn</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/order_buoc3b.PNG" />">
          </div>
          <div>
              Bước 4:
              <p>Chọn ngày giờ mà bạn muốn đặt và chọn đặt bàn</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/order_buoc4a.PNG" />">
              <p>Đặt bàn thành công sẽ có thông báo như sau</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/order_buoc4b.PNG" />">
          </div>
		<h6>Một số chức năng khác</h6>
            <div>
              Thêm bàn đặt vào giỏ hàng
              <p>Chức năng này dùng khi khách hàng chưa đăng nhập muốn lưu lại quá trình đặt bàn trước đó</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/add_shopping_cart.PNG" />">
            </div>
            <div>
               Gợi ý thời gian đặt bàn
              <p>Chức năng này giúp đưa ra thời gian trống của bàn ăn giúp khách hàng dễ lựa chọn hơn</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/tooltip.PNG" />">
              <img alt="manual" src="<c:url value="/resources/images/manual/tooltip_result.PNG" />">
            </div>
            <div>
              Nhóm chức năng quản lý
              <p>Chức năng giúp khách hàng quản lý thông tin tài khoản và thông tin về bàn đặt, giỏ hàng</p>
              <img alt="manual" src="<c:url value="/resources/images/manual/manager1.PNG" />">
              <img alt="manual" src="<c:url value="/resources/images/manual/manager2.PNG" />">
              <img alt="manual" src="<c:url value="/resources/images/manual/manager3.PNG" />">
            </div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>