<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/jquery-ui.css" />'>
<link rel='stylesheet' type="text/css" href='<c:url value="/resources/css/error.css" />'>
</head>
<body>
    <div class="container">
       <div class="row justify-content-center">
           <div class="col-md-6">
               <div class="text-center mt-5 top">
                   <a class="logo" href="home">Viet<span>Food</span></a>
               </div>
           </div>
       </div>
    </div>
    <div class="flex-center position-ref full-height">
	    <div class="code"> ${codeError } </div>
	    <div class="message" style="padding: 10px;"> ${messageError } </div>
	</div>
	<div class="flex-center position-ref">
	   <a href="home">Trở về trang chủ</a>
	</div>
</body>
</html>