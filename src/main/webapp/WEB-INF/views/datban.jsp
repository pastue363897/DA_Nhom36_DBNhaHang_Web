<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt bàn</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery-ui.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery.timepicker.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/nav.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/manager-account.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/search-food.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/food.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/datban.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/jquery-ui.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.timepicker.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/food.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/select-food.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/datban.js" />'></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7" id="first">
			    <jsp:include page="search-food.jsp"></jsp:include>
				<jsp:include page="foods.jsp"></jsp:include>
			</div>
			<div class="col-md-5 position-sticky" id="second">
				<div class="justify-content-center order-table">
					<div class="text-center info-datban">
					    <input type="hidden" id="maBA" value="${banAn.maBA }">
						<div id="hinhAnhBA" class="img image" style="background-image: url('<c:url value="/data/${banAn.hinhAnh }" />');"></div>
						<h2 class="heading">Bàn ăn <span id="kySoBA">${banAn.kySoBA }</span></h2>
						<p id="moTaBA">${banAn.motaBA }</p>
						<p>Số ghế: <span id="soGhe" >${banAn.soLuongGhe }</span></p>
						<div class="price">
							Phụ giá: 
							<span id="phuGia"><fmt:formatNumber pattern="#,###">${banAn.phuGia }</fmt:formatNumber></span> Đ
						</div>
						<div id="ttma" class="price" style="display: none;">
                            Tổng tiền món ăn: 
                            <span id="tongTienMonAn">0</span> Đ
                        </div>
                        <div id="tt" class="price" style="display: none;">
                            <hr>
                            Tổng tiền: 
                            <span id="tongTien">0</span> Đ
                        </div>
					</div>
					<div class="align-item-center justify-content-center action">
                      <button type="button" id="btn-datban" class="btn-danger">Đặt bàn</button>
                      <button type="button" id="btn-themgiohang" class="btn-warning">Thêm vào giỏ hàng</button>
                      <div>
                        <input type="text" id="gioPhucVu" class="form-control" value="12:00:00">
                        <input type="text" id="ngayPhucVu" class="form-control">
                        <button type="button" id="btn-tooltip" class="btn btn-secondary btn-sm">Gợi ý</button>
                      </div>
                    </div>
					<div id="foods-select" class="container choose">
					   <div class="row">
						
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