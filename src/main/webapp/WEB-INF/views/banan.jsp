<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách bàn ăn</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery-ui.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery.timepicker.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/nav.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/book-table.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/table.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/banan.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/pagination.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/footer.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/manager-account.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/jquery-ui.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.timepicker.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/order.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/pagination.js" />'></script>
</head>
<body>
    <jsp:include page="nav.jsp"></jsp:include>
    <div class="container-search-table">
        <div>&nbsp;</div>
        <jsp:include page="search-table.jsp"></jsp:include>
    </div>
    <jsp:include page="tables.jsp"></jsp:include>
    <jsp:include page="pagination.jsp">
        <jsp:param value="${(empty param.page || param.page <= 0 ) ? 1 : param.page }" name="page"/>
    </jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>