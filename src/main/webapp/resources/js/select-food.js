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