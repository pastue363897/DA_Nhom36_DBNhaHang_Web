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
			var count = parseInt($(item).val());
			if (!isNaN(count)) {
				count++;
			} else {
				count = 1;
			}
			if (count >= 30) {
				$("#messageModalLabel").text("Chọn món");
				$("#messageModelBody").text("Số lượng chọn không được vượt quá 29, hãy kiểm tra lại");
				$("#messageModal").modal('show');
			} else {
				$(item).val(count);
			}
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
			tongTien();
		});
		content.append(contentLeft, contentRight);
		node.append(maMA, img, content, cancel);
		
		$("#foods-select > .row").append(node);
		$(".itemCount").on("keydown", function(e) {
			if(!((e.keyCode > 95 && e.keyCode < 106)
		      || (e.keyCode > 47 && e.keyCode < 58) 
		      || e.keyCode == 8)) {
		        return false;
		    }
			if (parseInt($(this).val()) > 2
					&& e.keyCode !== 46 // keycode for delete
			        && e.keyCode !== 8 // keycode for backspace
			        ){
				$("#messageModalLabel").text("Số lượng của món ăn");
				$("#messageModelBody").text("Số lượng của một món phải lớn hơn 0 và nhỏ hơn 30");
				$("#messageModal").modal('show');
				return false;
			}
		});
		$(".itemCount").on("keyup", function() {
			tongTien();
		});
		tongTien();
	});
	$("#btn-datban").on("click", function() {
		var $this = $("#foods-select > .row").children();
		var dataMonAn = [];
		var monAn;
		$("#messageModalLabel").text("Đặt bàn");
		for (i of $this){
			monAn = {}
			monAn.maMA = $(i).children(".itemSelectMaMA").val();
			monAn.soLuong = parseInt($(i).find(".itemCount").val());
			if (isNaN(monAn.soLuong) || monAn.soLuong <= 0 || monAn.soLuong >= 30) {
				$("#messageModelBody").text("Số lượng của một món phải lớn hơn 0 và nhỏ hơn 30, hãy kiểm tra lại");
				$("#messageModal").modal('show');
				return;
			}
			dataMonAn.push(monAn);
		}
		if (dataMonAn.length == 0) {
			$("#messageModelBody").text("Chưa chọn món ăn");
			$("#messageModal").modal('show');
			return;
		}
		var data = {};
		var maBA = $("#maBA").val();
		if (maBA == null || !maBA.match(/^(BA)\d{6}$/)){
			$("#messageModelBody").text("Không xác định được thông tin bàn ăn hãy thử lại");
			$("#messageModal").modal('show');
			return;
		}
		var ngayDat = new Date().toLocaleString('en-GB').replace(",", "");
		var gioPhucVu = $("#gioPhucVu").val();
		if (gioPhucVu == null || gioPhucVu == '' || !gioPhucVu.match(/^[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}$/)) {
			$("#messageModelBody").text("Chưa chọn giờ hoặc giờ không đúng, hãy chọn lại");
			$("#messageModal").modal('show');
			return;
		}
		var ngayPhucVu = $("#ngayPhucVu").val()
		if (ngayPhucVu == null || !ngayPhucVu.match(/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{1,4}$/)){
			$("#messageModelBody").text("Ngày chưa chọn, hoặc không xác định hãy chọn lại");
			$("#messageModal").modal('show');
			return;
		}
		var ngay = ngayPhucVu.split("/");
		ngay = ngay[2] + "-" + ngay[1] + "-" + ngay[0];
		var date = new Date(ngay + " 00:00:00").getTime();
		
		if (isNaN(date) || date <= new Date(new Date().toDateString()).getTime()) {
			$("#messageModelBody").text("Ngày không hợp lệ, hãy chọn ngày lớn hơn ngày hiện tại");
			$("#messageModal").modal('show');
			return;
		}
		ngayPhucVu += " " + gioPhucVu;
		data.maBA = maBA;
		data.dsMonAn = dataMonAn;
		data.ngayDat = ngayDat;
		data.ngayPhucVu = ngayPhucVu;
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
				if (Object.keys(data.info).length > 0){
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
					$('#messageModal').on('hidden.bs.modal', function () {
						window.location.href = 'home';
		            });
					return;
				}
				$("#messageModal").modal('show');
			},
			error : function(e) {
				console.log("ERROR: ", e);
				$("#messageModalLabel").text("Đặt bàn");
				if (e.status == 400) {
					if (e.responseJSON.errors.length > 0) {
						var listerror = "<ul class='error-warning'>";
						for (i of e.responseJSON.errors) {
							listerror += "<li>" + i + "</li>";
						}
						$("#messageModelBody").empty();
						$("#messageModelBody").append(listerror);
					}
				}
				$("#messageModal").modal('show');
			}
		});
	});
	$("#btn-themgiohang").on("click", function() {
		var $this = $("#foods-select > .row").children();
		var dataMonAn = [];
		var monAn;
		$("#messageModalLabel").text("Thêm bàn đặt vào giỏ hàng");
		for (i of $this){
			monAn = {}
			monAn.maMA = $(i).children(".itemSelectMaMA").val();
			monAn.tenMA = $(i).find(".text-info > .item-info-left > h5").text();
			monAn.hinhAnh = $(i).children(".item-img").css("background-image").split(window.location.origin)[1].slice(0, -2);
			monAn.soLuong = parseInt($(i).find(".itemCount").val());
			if (isNaN(monAn.soLuong) || monAn.soLuong <= 0 || monAn.soLuong >= 30) {
				$("#messageModelBody").text("Số lượng của một món phải lớn hơn 0 và nhỏ hơn 30, hãy kiểm tra lại");
				$("#messageModal").modal('show');
				return;
			}
			monAn.giaTien = parseInt($(i).find(".price").text().replace(/\D/g, ''));
			dataMonAn.push(monAn);
		}
		if (dataMonAn.length == 0) {
			$("#messageModelBody").text("Chưa chọn món ăn");
			$("#messageModal").modal('show');
			return;
		}
		var data = {};
		var banAn = {};
		banAn.maBA = $("#maBA").val();
		if (banAn.maBA == null || !banAn.maBA.match(/^(BA)\d{6}$/)){
			$("#messageModelBody").text("Không xác định được thông tin bàn ăn hãy thử lại");
			$("#messageModal").modal('show');
			return;
		}
		banAn.kySoBA = $("#kySoBA").text();
		banAn.moTaBA = $("#moTaBA").text();
		banAn.hinhAnhBA = $("#hinhAnhBA").css("background-image").split(window.location.origin)[1].slice(0, -2);
		banAn.soGhe = parseInt($("#soGhe").text().trim());
		banAn.phuGia = parseInt($("#phuGia").text().trim().replace(/,/g, ''));
		var ngayDat = new Date().toLocaleString('en-GB').replace(",", "");
		var gioPhucVu = $("#gioPhucVu").val();
		if (gioPhucVu == null || gioPhucVu == '' || !gioPhucVu.match(/^[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}$/)) {
			$("#messageModelBody").text("Chưa chọn giờ hoặc giờ không đúng, hãy chọn lại");
			$("#messageModal").modal('show');
			return;
		}
		var ngayPhucVu = $("#ngayPhucVu").val()
		if (ngayPhucVu == null || !ngayPhucVu.match(/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{1,4}$/)){
			$("#messageModelBody").text("Ngày chưa chọn, hoặc không xác định hãy chọn lại");
			$("#messageModal").modal('show');
			return;
		}
		var ngay = ngayPhucVu.split("/");
		ngay = ngay[2] + "-" + ngay[1] + "-" + ngay[0];
		var date = new Date(ngay + " 00:00:00").getTime();
		
		if (isNaN(date) || date <= new Date(new Date().toDateString()).getTime()) {
			$("#messageModelBody").text("Ngày không hợp lệ, hãy chọn ngày lớn hơn ngày hiện tại");
			$("#messageModal").modal('show');
			return;
		}
		ngayPhucVu += " " + gioPhucVu;
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
				if (data != null && data != false) {
					$("#messageModalLabel").text("Thêm bàn đặt vào giỏ hàng");
					$("#messageModelBody").text("Đã thêm bàn đặt vào giỏ hàng");
					$("#messageModal").modal('show');
					$('#messageModal').on('hidden.bs.modal', function () { 
						window.location.href = 'banan';
					});
					
				} else {
					$("#messageModalLabel").text("Thêm bàn đặt vào giỏ hàng");
					$("#messageModelBody").text("Có sự cố trong xác định thông tin bàn đặt, hãy thử lại");
					$("#messageModal").modal('show');
				}
			},
			error : function(e) {
				console.log("ERROR: ", e);
				$("#messageModalLabel").text("Thêm bàn đặt vào giỏ hàng");
				if (e.status == 400) {
					if (e.responseJSON.errors.length > 0) {
						var listerror = "<ul class='error-warning'>";
						for (i of e.responseJSON.errors) {
							listerror += "<li>" + i + "</li>";
						}
						$("#messageModelBody").empty();
						$("#messageModelBody").append(listerror);
					}
				}
				$("#messageModal").modal('show');
			}
		});
	});
	$("#btn-tooltip").on("click", function() {
		var maBA = $("#maBA").val();
		var ngayPhucVu = $("#ngayPhucVu").val().split("/");
		var data = {};
		data.maBA = maBA;
		data.ngayPhucVu = ngayPhucVu[2] + "-" + ngayPhucVu[1] + "-" + ngayPhucVu[0];
		var result = true;
		$("#messageModalLabel").text("Thông tin giờ bàn ăn còn trống có thể đặt");
		if (data.maBA == null || !data.maBA.match(/^(BA)\d{6}$/)){
			$("#messageModelBody").text("Không xác định được thông tin bàn ăn hãy thử lại");
			$("#messageModal").modal('show');
			return;
		}
		if (data.ngayPhucVu == null || !data.ngayPhucVu.match(/^[0-9]{1,4}-[0-9]{1,2}-[0-9]{1,2}$/)){
			$("#messageModelBody").text("Ngày chưa chọn, hoặc không xác định hãy chọn lại");
			$("#messageModal").modal('show');
			return;
		} else {
			var date = new Date(data.ngayPhucVu + " 00:00:00").getTime();
			
			if (isNaN(date) || date <= new Date(new Date().toDateString()).getTime()) {
				$("#messageModelBody").text("Ngày không hợp lệ, hãy chọn ngày lớn hơn ngày hiện tại");
				$("#messageModal").modal('show');
				return;
			}
		}
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
				} else if (data == false) {
					$("#messageModelBody").text("Không xác định được thông tin bàn ăn hãy thử lại");
				} else {
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
									" có thể chọn tối đa " + (parseInt(((e.getHours() * 60 + e.getMinutes()) - (s.getHours() * 60 + s.getMinutes())) / 15)) + " món </li>";
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
				if (e.status == 400) {
					$("#messageModalLabel").text("Thông tin giờ bàn ăn còn trống có thể đặt");
					$("#messageModelBody").text("Ngày chưa chọn, hoặc không xác định hãy chọn lại");
					$("#messageModal").modal('show');
				}
			}
		});
	});
	function tongTien() {
		var $this = $("#foods-select > .row").children();
		var dataMonAn = [];
		var tong = 0;
		for (i of $this){
			soLuong = parseInt($(i).find(".itemCount").val());
			console.log(soLuong);
			giaTien = parseInt($(i).find(".price").text().replace(/\D/g, ''));
			giaTien *= soLuong;
			if (!isNaN(giaTien)){
				tong += giaTien;
			}
		}
		if (tong > 0) {
			$("#tongTienMonAn").text((tong).toLocaleString());
			tong += parseInt($("#phuGia").text().trim().replace(/,/g, ''));
			$("#tongTien").text((tong).toLocaleString());
			$("#ttma").show();
			$("#tt").show();
		} else {
			$("#ttma").hide();
			$("#tt").hide();
		}
	}
});