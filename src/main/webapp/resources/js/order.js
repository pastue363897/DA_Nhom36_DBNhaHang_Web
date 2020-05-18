$(document).ready(function() {
	$('#ngayPhucVuBA').datepicker({
		dateFormat : "dd/mm/yy"
	});
	
	$("#search-table").on("click", function(event) {
		
		
//		event.preventDefault();
//		return false;
	});
	
	$(".item-table").on("click", function() {
		var maBA = $(this).children(":first").val();
		console.log(maBA)
		$("#maBA").val(maBA);
		console.log($("#maBA").val());
		$("#order")[0].submit();
	})
});