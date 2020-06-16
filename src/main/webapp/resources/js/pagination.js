$(document).ready(function() {
	if ($(".pagination a.active").length == 1) {
		paginationPage();
	}
	previours();
	next();
})
function paginationPage() {
	let pagination = $(".pagination a");
	let page = $(".pagination a.active")[0].text;
	if (page == 1){
		$("#previous").addClass("disable")
	} else if (page == pagination.length - 2) {
		$("#next").addClass("disable")
	} else {
		$("#previous").removeClass("disable")
		$("#next").removeClass("disable")
	}
}
function createPaginationPage(pagecount, page) {
	let pagination = $(".pagination");
	$(".pagination a").remove();
	if (pagecount >= 2) {
		$(pagination).append('<a href="" id="previous" class="action-pagination">&laquo;</a>');
		/*for (i = 1; i <= pagecount; i++) {
			if (i == page){
				$(pagination).append('<a class="active" href="?page=' + i + '">' + i + '</a>');
			} else {
				$(pagination).append('<a href="?page=' + i + '">' + i + '</a>');
			}
		}*/
		if (typeof(page) == "string") {
			page = Number(page)
		}
		if (typeof(pagecount) == "string") {
			pagecount = Number(pagecount)
		}
		if (page > pagecount) {
			page = pagecount;
		} else if (page < 1) {
			page = 1;
		}
		
		let i = 1;
	    for (; i < page; i++){
	        if (i <= 2 || page - i <= 3){
	        	$(pagination).append('<a href="?page=' + i + '">' + i + '</a>');
	        } else {
	        	$(pagination).append('<a class="disable">...</a>');
	            i = page - 3;
	        }
	    }
	    $(pagination).append('<a class="active" href="?page=' + page + '">' + page + '</a>');
	    i = page + 1;
	    for (i; i <= pagecount; i++){
	        if (i <= page + 2 || pagecount - i <= 2){
	        	$(pagination).append('<a href="?page=' + i + '">' + i + '</a>');
	        } else {
	        	$(pagination).append('<a class="disable">...</a>');
	            i = pagecount - 2;
	        }
	    }
		$(pagination).append('<a href="" id="next" class="action-pagination">&raquo;</a>');
		paginationPage();
		previours();
		next();
	}
}
function previours() {
	$("#previous").on("click", function(event) {
		let page = $(".pagination a.active")[0].text;
		page--;
		if (page < 1){
			event.preventDefault();
		} else {
			$(".pagination a")[page].click();
		}
		return false;
	});
}
function next() {
	$("#next").on("click", function(event) {
		let pagination = $(".pagination a");
		let page = $(".pagination a.active")[0].text;
		page++;
		if (page > pagination.length - 2){
			event.preventDefault();
		} else {
			$(".pagination a")[page].click();
		}
		return false;
	});
}
