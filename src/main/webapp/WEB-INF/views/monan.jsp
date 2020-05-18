<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Roboto&display=swap" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/nav.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/search-food.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/food.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/manager-account.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/food.js" />'></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<jsp:include page="search-food.jsp"></jsp:include>
	<jsp:include page="foods.jsp"></jsp:include>
</body>
</html>