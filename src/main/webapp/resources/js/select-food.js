$(document).ready(function() {
	$(".menus").on("click", function() {
		var listMaMAItemSelect = new Map();
		$("#foods-select > .row").children(".item-food-select").children(".itemSelectMaMA").each(function(){
			listMaMAItemSelect.set($(this).val(), $(this).parent())
		});
		console.log(listMaMAItemSelect);
		var itemMa = $(this).children(".maMA").val();
		if (listMaMAItemSelect.has(itemMa)) {
			var item = $(listMaMAItemSelect.get(itemMa)).find(".itemCount");
			$(item).val(parseInt($(item).val()) + 1);
			return;
		}
		var itemImg = $(this).children(".menu-img").css("background-image").split(window.location.origin)[1].slice(0, -2);
		var itemName = $(this).children(".text").children(".one-half").children("h3").text();
		var itemPrice = $(this).children(".text").children(".one-forth").children(".price").text();
		
		var node = $("<div></div>").addClass("col-12 d-flex item-food-select");
		var maMA = $("<input type='hidden' class='itemSelectMaMA' value='" + itemMa + "'>")
		var img = $("<div></div").addClass("img item-img");
		img.css("background-image", "url(" + itemImg + ")");
		var content = $("<div></div>").addClass("text-info d-flex");
		var contentLeft = $("<div><h5>" + itemName + "</h5></div>").addClass("item-info-left");
		var contentRight = $("<div><span>Số lượng: <input type='text' class='itemCount' value='1'></span><span class='price'>" + itemPrice + "</span></div>").addClass("item-info-right");
		var cancel = $('<span class="img cancel" style="background-image: url(/nhom36/resources/images/icons/cancel.png)"></span>');
		cancel.click(function (){
			node.remove();
		});
		console.log(img)
		console.log(itemImg)
		content.append(contentLeft, contentRight);
		node.append(maMA, img, content, cancel);
		
		/*$("#foods-select > .row").append('<div class="col-12 d-flex item-food-select"><div class="img item-img" style="background-image: url("\/nhom36\/data\/images\/mon-an\/food-view.png");"></div><div class="text-info d-flex"><div class="item-info-left"><h5>Com</h5> </div><div class="item-info-right"><span>Số lượng: <input type="text" value="1"></span><span class="price"><fmt:formatNumber pattern="#,###">120000</fmt:formatNumber><span> Đ</span></span></div></div></div></div>')*/
		$("#foods-select > .row").append(node);
	});
	$("#btn-datban").on("click", function() {
		var $this = $("#foods-select > .row").children();
		var dataMonAn = [];
		var monAn;
		for (i of $this){
			monAn = {}
			monAn.maMA = $(i).children(".itemSelectMaMA").val();
			monAn.soLuong = parseInt($(i).find(".itemCount").val());
			dataMonAn.push(monAn);
		}
		var data = {};
		var maBA = $("#maBA").val();
		var ngayDat = new Date().toLocaleString('en-GB').replace(",", "");
		var ngayPhucVu = $("#ngayPhucVu").val() + " " + $("#gioPhucVu").val() + ":00";
		data.maBA = maBA;
		data.dsMonAn = dataMonAn;
		data.ngayDat = ngayDat;
		data.ngayPhucVu = ngayPhucVu;
		console.log(JSON.stringify(data, null, 4));
		$.ajax({
			type : "POST",
			accept : "application/json",
			contentType : "application/json",
			url : "order",
			data : JSON.stringify(data, null, 4),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#messageModalLabel").text("Đặt bàn");
				if (Object.keys(data.error).length > 0){
					
				} else if (Object.keys(data.info).length > 0){
					if (data.info.dadat == true) {
						$("#messageModelBody").text("Bàn ăn đã được đặt tại thời gian này, hãy chọn giờ khác");
					} else if (data.info.soLuongMonAnQuaLon == true) {
						$("#messageModelBody").text("Hiện tại chưa có bàn đặt nào tại thời gian này "
														+ "nhưng số lượng món ăn bạn chọn quá lớn so với khoảng thời gian còn trống");
					}
				} else if (data.signin == false) {
					$("#messageModelBody").text("Chưa đăng nhập, hãy thêm bàn đặt vào giỏ hàng và thực hiện đăng nhập vào hệ thống với tài khoản của bạn");
				} else if (data.result == false) {
					$("#messageModelBody").text("Hệ thống đang gặp sự cố, hãy thử lại sau");
				} else {
					$("#messageModelBody").text("Đặt bàn thành công");
					$("#messageModal").modal('show');
					window.location.href = 'home';
					return;
				}
				$("#messageModal").modal('show');
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$("#btn-themgiohang").on("click", function() {
		var $this = $("#foods-select > .row").children();
		var dataMonAn = [];
		var monAn;
		for (i of $this){
			monAn = {}
			monAn.maMA = $(i).children(".itemSelectMaMA").val();
			monAn.tenMA = $(i).find(".text-info > .item-info-left > h5").text();
			monAn.hinhAnh = $(i).children(".item-img").css("background-image").split(window.location.origin)[1].slice(0, -2);
			monAn.soLuong = parseInt($(i).find(".itemCount").val());
			monAn.giaTien = parseInt($(i).find(".price").text().replace(/\D/g, ''));
			dataMonAn.push(monAn);
		}
		var data = {};
		var banAn = {};
		banAn.maBA = $("#maBA").val();
		banAn.kySoBA = $("#kySoBA").text();
		banAn.moTaBA = $("#moTaBA").text();
		banAn.hinhAnhBA = $("#hinhAnhBA").css("background-image").split(window.location.origin)[1].slice(0, -2);
		banAn.soGhe = parseInt($("#soGhe").text().trim());
		banAn.phuGia = parseInt($("#phuGia").text().trim().replace(/,/g, ''));;
		var ngayDat = new Date().toLocaleString('en-GB').replace(",", "");
		var ngayPhucVu = $("#ngayPhucVu").val() + " " + $("#gioPhucVu").val() + ":00";
		data.banAn = banAn;
		data.dsMonAn = dataMonAn;
		data.ngayDat = ngayDat;
		data.ngayPhucVu = ngayPhucVu;
		console.log(JSON.stringify(data, null, 4));
		$.ajax({
			type : "POST",
			accept : "application/json",
			contentType : "application/json",
			url : "add-shopping-cart",
			data : JSON.stringify(data, null, 4),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				window.location.href = 'banan';
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$("#btn-tooltip").on("click", function() {
		var maBA = $("#maBA").val();
		var ngayPhucVu = $("#ngayPhucVu").val().split("/");
		var data = {};
		data.maBA = maBA;
		data.ngayPhucVu = ngayPhucVu[2] + "-" + ngayPhucVu[1] + "-" + ngayPhucVu[0];
		console.log(data)
		$.ajax({
			type : "POST",
			url : "tooltip-datban",
			data : data,
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#messageModalLabel").text("Thông tin giờ bàn ăn còn trống có thể đặt");
				if (data == null) {
					$("#messageModelBody").text("Bàn chưa có khách nào đặt trong ngày " + $("#ngayPhucVu").val() + ", có thể đặt thời gian mà bạn muốn");
				} else{
					var keys = Object.keys(data);
					if (keys.length <= 0) {
						$("#messageModelBody").text("Bàn không còn giờ trống trong ngày " + $("#ngayPhucVu").val());
					} else {
						var s;
						var e;
						var tooltip = "<ul class='suggestions'>";
						for (const start of keys) {
							s = new Date(start);
							e = new Date(data[start]);
							tooltip += "<li><span class='time'>" + s.toLocaleTimeString("es-GB") + " - " + e.toLocaleTimeString("es-GB") + "</span>" +
									" có thể chọn tối đa " + (parseInt(((e.getHours() * 60 + e.getMinutes()) - (s.getHours() * 60 + s.getMinutes())) / 10) - 2) + " món </li>";
						}
						tooltip += "</ul>";
						console.log(tooltip)
						$("#messageModelBody").empty();
						$("#messageModelBody").append(tooltip);
					}
				}
				
				$("#messageModal").modal('show');
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$(".item-food-select").on("click", function() {
		console.log('1')
	});
});