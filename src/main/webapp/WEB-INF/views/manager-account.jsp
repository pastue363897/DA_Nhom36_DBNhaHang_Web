<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test='${not empty account }'>
	   <div class="btn-group manager-account" role="group">
            <button id="btnManagerAccount" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <img alt="icon-avatar" src="<c:url value="/resources/images/icons/avatar.png" />"> ${account.username }
            </button>
            <div class="dropdown-menu" aria-labelledby="btnManagerAccount">
                <a class="dropdown-item" href="user-manager"> <img alt="icon-info"
                    src="<c:url value="/resources/images/icons/info.png" />"> Thông tin tài khoản
                </a> <a class="dropdown-item" href="logout"><img alt="icon-logout"
                    src="<c:url value="/resources/images/icons/logout.png" />"> Thoát </a>
            </div>
        </div>
	</c:when>
	<c:otherwise>
		<div class="btn-group manager-account" role="group">
			<button id="btnManagerAccount" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				<img alt="icon-avatar" src="<c:url value="/resources/images/icons/avatar.png" />"> Tài khoản
			</button>
			<div class="dropdown-menu" aria-labelledby="btnManagerAccount">
				<a class="dropdown-item" href="sign-in"> <img alt="icon-sigin"
					src="<c:url value="/resources/images/icons/user.png" />"> Đăng nhập
				</a> <a class="dropdown-item" href="register"><img alt="icon-register"
					src="<c:url value="/resources/images/icons/register.png" />"> Đăng ký </a>
			</div>
		</div>
	</c:otherwise>
</c:choose>
