<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="center">
  <div class="pagination">
    <c:if test="${pagecount >= 2 }" var="result" />
    <c:if test="${result }" >
        <a href="" id="previous" class="action-pagination">&laquo;</a>
        <%-- <c:forEach var="no" begin="1" end="${pagecount }" step="1">
            <c:choose>
                <c:when test="${no == param.page }">
                    <a class="active" href="?page=${no }">${no }</a>
                </c:when>
                <c:otherwise>
                    <a href="?page=${no }">${no }</a>
                </c:otherwise>
            </c:choose>
        </c:forEach> --%>
        <%
            int pg = Integer.parseInt(request.getParameter("page"));
            int pgcount = Integer.parseInt(request.getAttribute("pagecount").toString());
            if (pg > pgcount) {
              pg = pgcount;
            }
	        for (int i = 1; i < pg; i++) {
	          if (i <= 2 || pg - i <= 3){ %>
		            <a href="?page=<%= i %>"><%= i %></a>
		 <%   } else {  %>
		            <a class="disable">...</a>
		 <%       i = pg - 3;
		      }
	        }
        %>
        <a class="active" href="?page=<%= pg %>"><%= pg %></a>
        <%
            for (int i = pg + 1; i <= pgcount; i++) {
              if (i <= pg + 2 || pgcount - i <= 2){ %>
                    <a href="?page=<%= i %>"><%= i %></a>
         <%   } else {  %>
                    <a class="disable">...</a>
         <%       i = pgcount - 2;
              }
            }
        %>
        <a href="" id="next" class="action-pagination">&raquo;</a>
    </c:if> 
  </div>
</div>
