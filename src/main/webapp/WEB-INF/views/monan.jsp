<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách món ăn</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/nav.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/search-food.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/food.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/pagination.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/footer.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/manager-account.css" />'>
<script type='text/javascript' src='<c:url value="/resources/js/jquery.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/food.js" />'></script>
<script type='text/javascript' src='<c:url value="/resources/js/pagination.js" />'></script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<jsp:include page="search-food.jsp"></jsp:include>
	<jsp:include page="foods.jsp"></jsp:include>
	<jsp:include page="pagination.jsp">
        <jsp:param value="${(empty param.page || param.page <= 0 ) ? 1 : param.page }" name="page"/>
    </jsp:include>
	<div id="messageModal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="messageModalLabel">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div id="messageModelBody" class="modal-body">
            ...
          </div>
          <div id="messageModelFooter" class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>