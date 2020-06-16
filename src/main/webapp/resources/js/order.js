$(document).ready(function() {
	$('#ngayPhucVuBA').datepicker({
		dateFormat : "dd/mm/yy",
		minDate: "+1"
	});
	
	$('#gioBA').timepicker({
	    timeFormat: 'HH:mm:ss',
	    interval: 30,
	    minTime: '0',
	    maxTime: '23:59:59',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
	$("#soNguoiBA").on("keydown", function(e) {
		if(!((e.keyCode > 95 && e.keyCode < 106)
	      || (e.keyCode > 47 && e.keyCode < 58) 
	      || e.keyCode == 8)) {
	        return false;
	    }
		if (parseInt($(this).val()) > 20
				&& e.keyCode !== 46 // keycode for delete
		        && e.keyCode !== 8 // keycode for backspace
		        ){
			return false;
		}
	});
	
	$("#search-table").on("click", function(event) {
		
		
//		event.preventDefault();
//		return false;
	});
	$(".pagination a:not(.action-pagination)").on("click", function(event) {
		var data = {
			moTaBA: $("#moTaBA").data('value'),
			gioBA: $("#gioBA").data('value'),
			ngayPhucVuBA: $("#ngayPhucVuBA").data('value'),
			soNguoiBA: $("#soNguoiBA").data('value')
		}
		var url = this.href;
		if (Object.values(data).filter(value => value != "").length > 0) {
			var form = $('<form/>', {action : 'search-banan' + url.substring(url.lastIndexOf('?')), method : 'POST'});
			for (var key in data) {
				form.append($('<input>').attr({
			        type: 'hidden',
			        name: String(key),
			        value: String(data[key])
			    }))
			}
			form.appendTo('body').submit();
			event.preventDefault();
			return false;
		}
	})
	
	$(".item-table").on("click", function() {
		var maBA = $(this).children(":first").val();
		console.log(maBA)
		$("#maBA").val(maBA);
		console.log($("#maBA").val());
		$("#order")[0].submit();
	});
	
	function loadHeightTable() {
		var tableLeft = $(".row-table :nth-child(1)").children(".item-table");
		var tableRight = $(".row-table :nth-child(2)").children(".item-table");
		var maxHeight = 0;
		var height;
		for (i of tableLeft) {
			height = $(i).height();
			if (maxHeight < height) {
				maxHeight = height;
			}
		}
		for (i of tableRight) {
			height = $(i).height();
			if (maxHeight < height) {
				maxHeight = height;
			}
		}
		var list = $(".row-table > .col-lg-6").children(".item-table");
		for (i of list) {
			$(i).height(maxHeight);
		}
	}
	loadHeightTable();
});