$(document).ready(function() {
	$(".a").on("click", function(event) {
		event.preventDefault();
		var url = $(this).attr('href');
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
	})
});