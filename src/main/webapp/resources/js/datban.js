$(document).ready(function() {
	$('#ngayPhucVu').datepicker({
		dateFormat : "dd/mm/yy",
		minDate: "+1"
	}).val(new Date((new Date().getTime() + 24 * 60 * 60 * 1000)).toLocaleDateString("es-GB"))
	$('#gioPhucVu').timepicker({
	    timeFormat: 'HH:mm:ss',
	    interval: 30,
	    minTime: '0',
	    maxTime: '23:59:59',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});
})