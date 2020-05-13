$(document).ready(function() {
	$(".item-table").on("click", function() {
		var maBA = $(this).children(":first").val();
		console.log(maBA)
		$("#maBA").val(maBA);
		console.log($("#maBA").val());
		$("#order")[0].submit();
	})
});