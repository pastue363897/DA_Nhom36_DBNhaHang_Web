$(document).ready(function() {
	$(".manager-content").hide();
	$("#manager-account-content").show();
	$("#manager-account").on("click", function() {
		activeManager(this);
		$(".manager-content").hide();
		$("#manager-account-content").show();
		console.log("manager-account")
	});
	$("#manager-bill").on("click", function() {
		activeManager(this);
		$(".manager-content").hide();
		$("#manager-bill-content").show();
		console.log("manager-bill")
		$.ajax({
			type : "POST",
			url : "danhsach-bandat",
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				var content = $("#manager-bill-content > .row");
				var item = $("#example-item-bandat > div");
				var dsMonAn = $("#example-item-bandat > div > .item-bandat > .content-detail-bandat > .content-danhsach-monan > .row");
				var monAn = $("#example-item-monan > div");
				$(content).empty();
				for (i of data) {
					item.find(".box > img").attr("src", "data/" + i.banAn.hinhAnh)
					item.find(".content-info-bandat > h3 > span").text(i.banAn.kySoBA)
					item.find(".content-info-bandat > .tongTien > span").text(i.tongTien)
					item.find(".content-info-bandat > .soGhe > span").text(i.banAn.soLuongGhe)
					item.find(".content-info-bandat > .bandat-time > .ngayDat > span").text(i.ngayDat)
					item.find(".content-info-bandat > .bandat-time > .ngayPhucVu > span").text(i.ngayPhucVu)
					if (i.daHuy) {
						item.find(".bandat-pay").children().hide();
						item.find(".bandat-pay > .daHuy").show();
					} else if (i.daThanhToan) {
						item.find(".bandat-pay").children().hide();
						item.find(".bandat-pay > .daThanhToan").show();
						item.find(".bandat-pay > .chiTietThanhToan > .ngayThanhToan > span").text(item.ngayThanhToan);
					} else {
						item.find(".bandat-pay").children().hide();
						item.find(".bandat-pay > .chuaThanhToan").show();
					}
					item.find(".content-detail-bandat > .content-banan > p").text(i.banAn.motaBA);
					item.find(".content-detail-bandat > .content-banan > .phuGia > span").text(i.banAn.phuGia);
					$(dsMonAn).empty();
					for (j of i.dsMonAn) {
						monAn.find("div > img").attr("src", "data/" + j.monAn.hinhAnhMA);
						monAn.find("div > .content-monan > h5").text(j.monAn.tenMA);
						monAn.find("div > .content-monan > .detail-monan-selectd > .giaMA > span").text(j.donGia);
						monAn.find("div > .content-monan > .detail-monan-selectd > .soLuongChon > span").text(j.soLuong);
						$(dsMonAn).append($(monAn).clone());
					}					
					$(content).append($(item).clone());
					console.log("a")
				}
				$(".a").on("click", function(event) {
					event.preventDefault();
					event.stopPropagation();
					console.log($(this).parent(".item-bandat"))
					$(this).parent().parent().parent().parent(".item-bandat").find(".content-detail-bandat").toggle();
				});
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
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				var content = $("#manager-shopping-cart-content");
				var item = $("#example-item-cart-bandat > div");
				var dsMonAn = $("#example-item-cart-bandat > .item-cart-bandat > .item-cart-right > .dansach-monan");
				var monAn = $("#example-item-cart-monan > div");
				var time;
				var index = 0;
				$(content).empty();
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
					item.find(".item-cart-right > .info-banan > .phuGia > span").text(i.banAn.phuGia);
					$(dsMonAn).empty();
					for (j of i.dsMonAn) {
						monAn.find(".item-food > input").val(j.maMA);
						monAn.find(".item-food > .item-img").css("background-image", "url('" + j.hinhAnh + "')");
						monAn.find(".item-food > .info-monan > .item-info > h5").text(j.tenMA);
						monAn.find(".item-food > .info-monan > .item-info  .itemCount").val(j.soLuong);
						monAn.find(".item-food > .info-monan > .item-info .price").text(j.giaTien);
						$(dsMonAn).append($(monAn).clone());
					}
					$(content).append($(item).clone());
				}
				$(".itemCartNgayPhucVu").datepicker({
					dateFormat : "dd/mm/yy"
				});
				$(".datban").on("click", function() {
					var bandat = $(this).parent(".group-button").parent(".item-cart-left").parent(".item-cart-bandat");
					var $this = $(bandat).find(".item-cart-right > .dansach-monan").children();
					var dataMonAn = [];
					var monAn;
					for (i of $this){
						monAn = {}
						monAn.maMA = $(i).find(".item-food > .itemSelectMaMA").val();
						monAn.soLuong = parseInt($(i).find(".itemCount").val());
						dataMonAn.push(monAn);
					}
					var data = {};
					var maBA = $(bandat).find(".item-cart-left > .maBA").val();
					var ngayDat = new Date().toLocaleString('en-GB').replace(",", "");
					var ngayPhucVu = $(bandat).find(".item-cart-left .itemCartNgayPhucVu").val() + " " + $(bandat).find(".item-cart-left .gioPhucVu").val() + ":00";
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
							if (data.result == true && Object.keys(data.error) == 0 && Object.keys(data.info) == 0){
								$(bandat).find(".huyban").click();
							}
						},
						error : function(e) {
							console.log("ERROR: ", e);
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
					if ($(dsmonan).children().length <= 0) {
						var bandat =  $(dsmonan).parent(".item-cart-right").parent(".item-cart-bandat");
						$(bandat).find(".huyban").click();
					}
				});
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$("#close").on("click", function() {
		window.location.href = "logout";
	});
	$("#update-account").on("click", function() {
		var username = $("#username").val();
		var password = $("#password").val();
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

			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	$("#update-user").on("click", function() {
		var hoTen = $("#hoTen").val();
		var diaChi = $("#diaChi").val();
		var cmnd = $("#cmnd").val();
		var sdt = $("#sdt").val();
		var email = $("#email").val();
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
				$("#tenKH").text(hoTen);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	function activeManager(typeManager) {
		$(".manger > li").removeClass();
		$(typeManager).addClass("manager-active");
	}
});