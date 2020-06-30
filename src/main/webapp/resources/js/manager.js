$(document).ready(function() {
	$(".manager-content").hide();
	$("#manager-account-content").show();
	$("#manager-account").on("click", function() {
		activeManager(this);
		$(".manager-content").hide();
		$("#manager-account-content").show();
		console.log("manager-account")
	});
	$('#ngayPhucVuBA').datepicker({
		dateFormat : "dd/mm/yy"
	})
	$("#timKiemBanDat").click(function(event) {
		event.preventDefault();
		page = 0;
		let ngay = $("#ngayPhucVuBA").val().split("/");
		let ngayPhucVuBA = ngay[2] + "-" + ngay[1] + "-" + ngay[0];
		let tinhTrangBanDat = $("#tinhTrangBanDat").val();
		$("#ngayPhucVuBA").attr('data-value', ngayPhucVuBA);
		$("#tinhTrangBanDat").attr('data-value', tinhTrangBanDat);
		$("#manager-bill").click();
	})
	$("#manager-bill").on("click", function() {
		activeManager(this);
		$(".manager-content").hide();
		$("#manager-bill-content").show();
		console.log("manager-bill")
		let dt = {
			page: page
		}
		let ngayPhucVu = $("#ngayPhucVuBA").attr('data-value') || "";
		if (ngayPhucVu != "" && ngayPhucVu.match(/^[0-9]{1,4}-[0-9]{1,2}-[0-9]{1,2}$/)) {
			dt.ngayPhucVu = ngayPhucVu;
		}
		let tinhTrangBanDat = $("#tinhTrangBanDat").attr('data-value') || "";
		if (tinhTrangBanDat != "") {
			dt.tt = tinhTrangBanDat;
		}
		console.log(dt)
		$.ajax({
			type : "POST",
			url : "danhsach-bandat",
			data: dt,
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				if (data.result == false) {
					$("#messageModalLabel").text("Danh sách bàn đã đặt");
					$("#messageModelBody").text("Chưa đăng nhập, hãy đăng nhập vào hệ thống với tài khoản của bạn");
					return;
				}
				let pagecount = data.pagecount;
				data = data.dsBD;
				var content = $("#manager-bill-content > .row");
				$(content).empty();
				if (data == null || data.length == 0) {
					$(content).append('<h3 style="margin-left: 10px">Không có danh sách bàn đã đặt</h3>');
				} else {
					var item = $("#example-item-bandat > div");
					var dsMonAn = $("#example-item-bandat > div > .item-bandat > .content-detail-bandat > .content-danhsach-monan > .row");
					var monAn = $("#example-item-monan > div");
					var time;
					for (i of data) {
						item.find(".box > img").attr("src", "data/" + i.banAn.hinhAnh)
						item.find(".content-info-bandat > h3 > span").text(i.banAn.kySoBA)
						item.find(".content-info-bandat > .tongTien > span").text((i.tongTien).toLocaleString())
						item.find(".content-info-bandat > .soGhe > span").text(i.banAn.soLuongGhe)
						time = new Date(i.ngayDat);
						item.find(".content-info-bandat > .bandat-time > .ngayDat > span").text(time.toLocaleDateString('en-GB') + " " + 
								(time.getHours() >= 10 ? "" : "0") + time.getHours() + ":" + (time.getMinutes() >= 10 ? "" : "0") + time.getMinutes() + ":" + (time.getSeconds() >= 10 ? "" : "0") + time.getSeconds())
						time = new Date(i.ngayPhucVu);
						item.find(".content-info-bandat > .bandat-time > .ngayPhucVu > span").text(time.toLocaleDateString('en-GB') + " " + 
								(time.getHours() >= 10 ? "" : "0") + time.getHours() + ":" + (time.getMinutes() >= 10 ? "" : "0") + time.getMinutes() + ":"  + (time.getSeconds() >= 10 ? "" : "0") + time.getSeconds())
						if (i.daHuy) {
							item.find(".bandat-pay").children().hide();
							item.find(".bandat-pay > .daHuy").show();
						} else if (i.daThanhToan) {
							item.find(".bandat-pay").children().hide();
							item.find(".bandat-pay > .daThanhToan").show();
							time = new Date(i.ngayThanhToan);
							item.find(".bandat-pay > .daThanhToan > .chiTietThanhToan > .ngayThanhToan > span").text(time.toLocaleDateString('en-GB') + " " + 
									(time.getHours() >= 10 ? "" : "0") + time.getHours() + ":" + (time.getMinutes() >= 10 ? "" : "0") + time.getMinutes() + ":"  + (time.getSeconds() >= 10 ? "" : "0") + time.getSeconds());
						} else {
							item.find(".bandat-pay").children().hide();
							item.find(".bandat-pay > .chuaThanhToan").show();
						}
						item.find(".content-detail-bandat > .content-banan > p").text(i.banAn.motaBA);
						item.find(".content-detail-bandat > .content-banan > .phuGia > span").text((i.banAn.phuGia).toLocaleString());
						$(dsMonAn).empty();
						for (j of i.dsMonAn) {
							monAn.find("div > img").attr("src", "data/" + j.monAn.hinhAnhMA);
							monAn.find("div > .content-monan > h5").text(j.monAn.tenMA);
							monAn.find("div > .content-monan > .detail-monan-selectd > .giaMA > span").text((j.donGia).toLocaleString());
							monAn.find("div > .content-monan > .detail-monan-selectd > .soLuongChon > span").text(j.soLuong);
							$(dsMonAn).append($(monAn).clone());
						}					
						$(content).append($(item).clone());
					}
					$(".a").on("click", function(event) {
						event.preventDefault();
						event.stopPropagation();
						console.log($(this).parent(".item-bandat"))
						$(this).parent().parent().parent().parent(".item-bandat").find(".content-detail-bandat").toggle();
					});
				}
				loadPagination(pagecount);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$("#manager-order").on("click", function() {
		console.log("manager-order");
		window.location.href = 'banan';
	});
	$("#shopping-cart").on("click", function() {
		activeManager(this);
		$(".manager-content").hide();
		$("#manager-shopping-cart-content").show();
		console.log("shopping-cart")
		$.ajax({
			type : "POST",
			url : "shopping-cart",
			data: {page: page},
			dataType : 'json',
			timeout : 100000,
			success : function(dt) {
				console.log("SUCCESS: ", dt);
				let data = dt.data;
				var content = $("#manager-shopping-cart-content");
				$(content).empty();
				if (data == null || data.length == 0) {
					$(content).append('<h3 style="margin-left: 10px">Giỏ hàng hiện tại đang trống</h3>');
					return;
				}
				var item = $("#example-item-cart-bandat > div");
				var dsMonAn = $("#example-item-cart-bandat > .item-cart-bandat > .item-cart-right > .dansach-monan");
				var monAn = $("#example-item-cart-monan > div");
				var time;
				var index = 0;
				for (i of data) {
					item.children(".index-bandat").val(index++);
					item.find(".item-cart-left > .maBA").val(i.banAn.maBA);
					item.find(".item-cart-left > .img-item-cart").css("background-image", "url('" + i.banAn.hinhAnhBA + "')");
					time = i.ngayPhucVu.split(' ');
					item.find(".item-cart-left .gioPhucVu").val(time[1]);
					item.find(".item-cart-left .itemCartNgayPhucVu").val( new Date(i.ngayPhucVu).toLocaleDateString('en-GB'));
					item.find(".item-cart-right > .info-banan > .heading > span").text(i.banAn.kySoBA);
					item.find(".item-cart-right > .info-banan > .moTa").text(i.banAn.moTaBA);
					item.find(".item-cart-right > .info-banan > .soGhe > span").text(i.banAn.soGhe);
					item.find(".item-cart-right > .info-banan .phuGia > span").text((i.banAn.phuGia).toLocaleString());
					$(dsMonAn).empty();
					for (j of i.dsMonAn) {
						monAn.find(".item-food > input").val(j.maMA);
						monAn.find(".item-food > .item-img").css("background-image", "url('" + j.hinhAnh + "')");
						monAn.find(".item-food > .info-monan > .item-info > h5").text(j.tenMA);
						monAn.find(".item-food > .info-monan > .item-info  .itemCount").val(j.soLuong);
						monAn.find(".item-food > .info-monan > .item-info .price").text((j.giaTien).toLocaleString());
						$(dsMonAn).append($(monAn).clone());
					}
					tongTienItemCart(item);
					$(content).append($(item).clone());
				}
				$(".itemCartNgayPhucVu").datepicker({
					dateFormat : "dd/mm/yy",
					minDate: "+1"
				});
				$('.gioPhucVu').timepicker({
				    timeFormat: 'HH:mm:ss',
				    interval: 30,
				    minTime: '05:00:00',
				    maxTime: '23:00:00',
				    dynamic: false,
				    dropdown: true,
				    scrollbar: true
				});
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
					var monan = $(this).parent("span").parent("div").parent(".item-info").parent(".info-monan").parent(".item-food").parent(".item-food-select");
					var dsmonan = $(monan).parent(".dansach-monan");
					var bandat =  $(dsmonan).parent(".item-cart-right").parent(".item-cart-bandat");
					console.log(monan)
					console.log(dsmonan)
					console.log(bandat)
					tongTienItemCart(bandat);
				});
				$(".datban").on("click", function() {
					var bandat = $(this).parent(".group-button").parent(".item-cart-left").parent(".item-cart-bandat");
					var $this = $(bandat).find(".item-cart-right > .dansach-monan").children();
					var dataMonAn = [];
					var monAn;
					$("#messageModalLabel").text("Đặt bàn");
					for (i of $this){
						monAn = {}
						monAn.maMA = $(i).find(".item-food > .itemSelectMaMA").val();
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
					var maBA = $(bandat).find(".item-cart-left > .maBA").val();
					if (maBA == null || !maBA.match(/^(BA)\d{6}$/)){
						$("#messageModelBody").text("Không xác định được thông tin bàn ăn hãy thử lại");
						$("#messageModal").modal('show');
						return;
					}
					var ngayDat = new Date().toLocaleString('en-GB').replace(",", "");
					var gioPhucVu = $(bandat).find(".item-cart-left .gioPhucVu").val();
					if (gioPhucVu == null || gioPhucVu == '' || !gioPhucVu.match(/^[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}$/)) {
						$("#messageModelBody").text("Chưa chọn giờ hoặc giờ không đúng, hãy chọn lại");
						$("#messageModal").modal('show');
						return;
					}
					var ngayPhucVu = $(bandat).find(".item-cart-left .itemCartNgayPhucVu").val();
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
							if (Object.keys(data.info).length > 0){
								if (data.info.dadat == true) {
									/*$("#messageModelBody").text("Bàn ăn đã được đặt tại thời gian này, hãy chọn giờ khác");*/
									$("#messageModelBody").text("Bàn ăn đã được đặt, hãy chọn ngày khác");
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
								$(bandat).find(".huyban").click();
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
				$(".huyban").on("click", function() {
					var bandat = $(this).parent(".group-button").parent(".item-cart-left").parent(".item-cart-bandat");
					var index = $(bandat).children(".index-bandat").val();
					var data = {}
					data.index = index;
					console.log(data)
					$.ajax({
						type : "POST",
						url : "remove-shopping-cart",
						data : data,
						dataType : 'json',
						timeout : 100000,
						success : function(data) {
							console.log("SUCCESS: ", data);
							if (data == true) {
								$("#shopping-cart").click();
							} else {
								$("#messageModalLabel").text("Hủy bàn");
								$("#messageModelBody").text("Có sự cố trong xác định bàn muốn hủy, hãy thử lại");
								$("#messageModal").modal('show');
							}
						},
						error : function(e) {
							console.log("ERROR: ", e);
						}
					});
				});
				$(".huymon").click(function() {
					var monan = $(this).parent(".item-food").parent(".item-food-select");
					var dsmonan = $(monan).parent(".dansach-monan");
					monan.remove();
					var bandat =  $(dsmonan).parent(".item-cart-right").parent(".item-cart-bandat");
					if ($(dsmonan).children().length <= 0) {
						$(bandat).find(".huyban").click();
					} else {
						tongTienItemCart(bandat);
					}
				});
				/*$(".btn-tooltip").on("click", function() {
					var bandat = $(this).parent("div").parent(".item-cart-left").parent(".item-cart-bandat");
					var maBA = $(bandat).find(".item-cart-left > .maBA").val();
					var ngayPhucVu = $(this).prev().val().split("/");
					var data = {};
					data.maBA = maBA;
					data.ngayPhucVu = ngayPhucVu[2] + "-" + ngayPhucVu[1] + "-" + ngayPhucVu[0];
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
								$("#messageModelBody").text("Bàn chưa có khách nào đặt trong ngày " + ngayPhucVu[0] + "/" + ngayPhucVu[1] + "/" + ngayPhucVu[2] + ", có thể đặt thời gian mà bạn muốn");
							} else{
								var keys = Object.keys(data);
								if (keys.length <= 0) {
									$("#messageModelBody").text("Bàn không còn giờ trống trong ngày " + ngayPhucVu[0] + "/" + ngayPhucVu[1] + "/" + ngayPhucVu[2]);
								} else {
									var s;
									var e;
									var tooltip = "<ul class='suggestions'>";
									for (const start of keys) {
										s = new Date(start);
										e = new Date(data[start]);
										tooltip += "<li><span class='time'>" + s.toLocaleTimeString("es-GB") + " - " + e.toLocaleTimeString("es-GB") + "</span>" +
												" có thể chọn tối đa " + (parseInt(((e.getHours() * 60 + e.getMinutes()) - (s.getHours() * 60 + s.getMinutes())) / 15) + 1) + " món </li>";
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
				});*/
				loadPagination(dt.pagecount);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$("#close").on("click", function() {
		window.location.href = "logout";
	});
	$("#update-account").on("click", function(event) {
		var username = $("#username").val();
		var password = $("#password").val();
		var result = true;
		if (!username.match(/^[a-zA-Z][a-zA-Z0-9]{2,19}$/)) {
			$("#error-username").show();
			result = false;
		} else {
			$("#error-username").hide();
		}
		if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,20}$/)) {
			$("#error-password").show();
			result = false;
		} else {
			$("#error-password").hide();
		}
		if (!result){
			event.preventDefault();
			return;
		}
		var data = {};
		data["username"] = username;
		data["password"] = password;
		$.ajax({
			type : "POST",
			accept : "application/json",
			contentType : "application/json",
			url : "update-account",
			data : JSON.stringify(data),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#messageModalLabel").text("Cập nhật tài khoản");
				if (data.result == true) {
					$("#messageModelBody").text("Thông tin tài khoản đã cập nhật thành công");
				} else {
					if (data.signin == true) {
						if (Object.keys(data.error).length > 0) {
							if (data.error.account == false) {
								$("#messageModelBody").text("Không xác định được tài khoản, hãy đăng nhập lại");
							} else {
								if (data.error.username == false) {
									$("#error-username").show();
								} else {
									$("#error-username").hide();
								}
								if (data.error.password == false) {
									$("#error-password").show();
								} else {
									$("#error-password").hide();
								}
								return;
							}
						} else {
							$("#messageModelBody").text("Đã tồn tại usename");
						}
					}  else {
						$("#messageModelBody").text("Chưa đăng nhập, hãy đăng nhập vào hệ thống với tài khoản của bạn");
					}
				}
				$("#messageModal").modal('show');
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$("#update-user").on("click", function(event) {
		var hoTen = $("#hoTen").val();
		var diaChi = $("#diaChi").val();
		var cmnd = $("#cmnd").val();
		var sdt = $("#sdt").val();
		var email = $("#email").val();
		var result = true;
		if (!hoTen.match(/^\p{L}{1,7}( \p{L}{1,7}){0,5}$/gu)) {
			$("#error-hoTen").show();
			result = false;
		} else {
			$("#error-hoTen").hide();
		}
		if (!diaChi.match(/^([1-9][0-9]{0,}[A-Z]?)(\/([1-9][0-9]{0,}[A-Z]?)){0,5}(( [\p{L}]{2,7}){1,15}( [1-9][0-9]{0,}[A-Z]?)?,){2,10}(( \p{L}{2,7}){1,15})$/gu)) {
			$("#error-diaChi").show();
			result = false;
		} else {
			$("#error-diaChi").hide();
		}
		if (!cmnd.match(/^[0-9](\d{8}|\d{11})$/)) {
			$("#error-cmnd").show();
			result = false;
		} else {
			$("#error-cmnd").hide();
		}
		if (!sdt.match(/^0[1-9][0-9]{8}$/)) {
			$("#error-sdt").show();
			result = false;
		} else {
			$("#error-sdt").hide();
		}
		if (!email.match(/^[a-zA-Z][a-zA-Z0-9_\.]{5,32}@[a-z0-9]{2,30}(\.[a-z0-9]{2,4}){1,2}$/)) {
			$("#error-email").show();
			result = false;
		} else {
			$("#error-email").hide();
		}
		if (!result){
			event.preventDefault();
		}
		var data = {};
		data["hoTen"] = hoTen;
		data["diaChi"] = diaChi;
		data["cmnd"] = cmnd;
		data["sdt"] = sdt;
		data["email"] = email;
		$.ajax({
			type : "POST",
			accept : "application/json",
			contentType : "application/json",
			url : "update-user",
			data : JSON.stringify(data),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#messageModalLabel").text("Cập nhật thông tin người dùng");
				if (data.result == true) {
					$("#tenKH").text(hoTen);
					$("#messageModelBody").text("Thông tin người dùng đã cập nhật thành công");
				} else {
					if (data.signin == true) {
						if (Object.keys(data.error).length > 0) {
							if (data.error.customer == false) {
								$("#messageModelBody").text("Không xác định được tài khoản, hãy đăng nhập lại");
							} else {
								if (data.error.hoTen == false) {
									$("#error-hoTen").show();
								} else {
									$("#error-hoTen").hide();
								}
								if (data.error.diaChi == false) {
									$("#error-diaChi").show();
								} else {
									$("#error-diaChi").hide();
								}
								if (data.error.cmnd == false) {
									$("#error-cmnd").show();
								} else {
									$("#error-cmnd").hide();
								}
								if (data.error.sdt == false) {
									$("#error-sdt").show();
								} else {
									$("#error-sdt").hide();
								}
								if (data.error.email == false) {
									$("#error-email").show();
								} else {
									$("#error-email").hide();
								}
								return;
							}
						} else {
							$("#messageModelBody").text("Hệ thống đang gặp sự cố, hãy thử lại sau");
						}
					}  else {
						$("#messageModelBody").text("Chưa đăng nhập, hãy đăng nhập vào hệ thống với tài khoản của bạn");
					}
				}
				$("#messageModal").modal('show');
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	function activeManager(typeManager) {
		let oldActive = $(".manger > li.manager-active");
		let newActive = $(typeManager);
		if (oldActive[0] != newActive[0]) {
			$(".manger > li").removeClass();
			newActive.addClass("manager-active");
			$(".pagination a").remove();
			page = 0;
		}
	}
	function tongTienItemCart(itemCart) {
		var $this = $(itemCart).find(".item-cart-right > .dansach-monan").children();
		var dataMonAn = [];
		var tong = 0;
		for (i of $this){
			soLuong = parseInt($(i).find(".itemCount").val());
			giaTien = parseInt($(i).find(".price").text().replace(/\D/g, ''));
			giaTien *= soLuong;
			if (!isNaN(giaTien)){
				tong += giaTien;
			}
		}
		var tongTienMonAn = $(itemCart).find(".item-cart-right > .info-banan .tongTienMonAn");
		var tongTien = $(itemCart).find(".item-cart-right > .info-banan .tongTien");
		if (tong > 0) {
			$(tongTienMonAn).text((tong).toLocaleString());
			tong += parseInt($(itemCart).find(".item-cart-right > .info-banan .phuGia > span").text().trim().replace(/,/g, ''));
			$(tongTien).text((tong).toLocaleString());
			$(itemCart).find(".item-cart-right > .info-banan .ttma").show();
			$(itemCart).find(".item-cart-right > .info-banan .tt").show();
		} else {
			$(itemCart).find(".item-cart-right > .info-banan .ttma").hide();
			$(itemCart).find(".item-cart-right > .info-banan .tt").hide();
		}
	}
	var page = 0;
	function loadPagination(pagecount) {
		createPaginationPage(pagecount, page);
		$(".pagination a:not(.action-pagination)").on("click", function(event) {
			page = this.text;
			$(".manager-active").click();
			event.preventDefault();
		    $('html,body').animate({scrollTop: 0},'slow');
		})
	}
});