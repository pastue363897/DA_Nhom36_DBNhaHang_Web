$(document).ready(function() {
	function loadChiTiet() {
		$(".a").on("click", function(event) {
			event.preventDefault();
			var url = $(this).attr('href');
			event.stopPropagation();
			$.ajax({
				type : "POST",
				url : url,
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					var tenMA = data.tenMA;
					var hinhAnh = data.hinhAnhMA.replace(/"/g, '');
					var nguyenLieu = data.nguyenLieu;
					var moTa = data.moTaMA;
					var soNguoi = data.soLuongNguoi;
					var giaTien = data.giaTien;
					console.log(window)
					$("#tenMonAn").text(tenMA);
					$("#hinhAnh").attr('src', "data/" + hinhAnh);
					$("#nguyenLieu").text(nguyenLieu);
					$("#moTa").text(moTa);
					$("#soNguoi").text(soNguoi);
					$("#giaTien").text(giaTien);
					$("#chitiet-monan").modal('show');
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		});
	}
	$("#search-food").on("click", function(event) {
		event.preventDefault();
		var tenOrMoTaMA = $("#tenOrMoTaMA").val();
		var giaTienMA = $("#giaTienMA").val();
		var soNguoiAnMA = $("#soNguoiAnMA").val();
		var data = {};
		data["tenOrMoTaMA"] = tenOrMoTaMA;
		data["giaTienMA"] = giaTienMA;
		data["soNguoiAnMA"] = soNguoiAnMA;
		
		$.ajax({
			type : "GET",
			url : "search-monan",
			data : data,
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				var contentLeft = $("#v-pills-home > .row > .col-lg-6:nth-child(1)");
				var contentRight = $("#v-pills-home > .row > .col-lg-6:nth-child(2)");
				var item = $("#example-item-monan > div");
				$(contentLeft).empty();
				$(contentRight).empty();
				if (data.length > 0) {
					var half = data.length / 2;
					for (i = 0; i < half; i++) {
						item.find(">input").val(data[i].maMA);
						item.find(">.menu-img").css("background-image", "url('data/" + data[i].hinhAnhMA + "')");
						item.find(">.text >.one-half > h3").text(data[i].tenMA);
						item.find(">.text >.one-half > p").text(data[i].nguyenLieu);
						item.find(">.text >.one-forth > .price").text(data[i].giaTien);
						item.find(">.text >.one-forth .a").attr("href", "chitiet-monan/" + data[i].maMA);
						$(contentLeft).append($(item).clone());
					}
					for (; i < data.length; i++) {
						item.find(">input").val(data[i].maMA);
						item.find(">.menu-img").css("background-image", "url('data/" + data[i].hinhAnhMA + "')");
						item.find(">.text >.one-half > h3").text(data[i].tenMA);
						item.find(">.text >.one-half > p").text(data[i].nguyenLieu);
						item.find(">.text >.one-forth > .price").text(data[i].giaTien);
						item.find(">.text >.one-forth .a").attr("href", "chitiet-monan/" + data[i].maMA);
						$(contentRight).append($(item).clone());
					}
					loadChiTiet();
				}
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
	});
	loadChiTiet();
});