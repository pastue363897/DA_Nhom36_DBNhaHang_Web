<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VietFood</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/nav.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/footer.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/contact-refer.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/manager-account.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>

</head>
<body>
    <jsp:include page="nav.jsp"></jsp:include> 
    <div class="contact">
	    <div class="text">
		  <div>Liên hệ với chúng tôi</div>
		  <h1>VietFood or Nhóm 36</h1>
		  <hr>
		  <div>XXX</div>
		</div>
		<div class="astronaut">
		  
		</div>
	</div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript">
	    document.addEventListener("DOMContentLoaded", function() {

			var body = document.body;
			setInterval(createStar, 100);
			function createStar() {
				var right = Math.random() * 500;
				var top = Math.random() * screen.height;
				var star = document.createElement("div");
				star.classList.add("star")
				body.appendChild(star);
				setInterval(runStar, 10);
				star.style.top = top + "px";
				function runStar() {
					if (right >= screen.width) {
						star.remove();
					}
					right += 3;
					star.style.right = right + "px";
				}
			}
		})
	</script>
</body>
</html>