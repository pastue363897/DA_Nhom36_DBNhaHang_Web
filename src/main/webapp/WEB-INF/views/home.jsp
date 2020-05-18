<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Roboto&display=swap" rel="stylesheet">
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery-ui.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/nav.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/slide.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/book-table.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/food.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/table.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/about-chef.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/image-another.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/footer.css" />'>
	<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/manager-account.css" />'>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-ui.min.js" />'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/food.js" />'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/order.js" />'></script>
</head>
<body>
    <jsp:include page="nav.jsp"></jsp:include>
    <jsp:include page="slide.jsp"></jsp:include>
    <jsp:include page="search-table.jsp"></jsp:include>
    <jsp:include page="foods.jsp"></jsp:include>
    <jsp:include page="tables.jsp"></jsp:include>
    <jsp:include page="chef-introduct.jsp"></jsp:include>
    <jsp:include page="image-introduct.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
    
    
    <script type="text/javascript">
        $('.carousel').carousel({
            interval : 2000
        })
    </script>
</body>
</html>
