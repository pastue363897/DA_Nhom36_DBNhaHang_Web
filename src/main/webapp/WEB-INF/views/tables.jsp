<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- table -->
    <section class="ftco-section parallax-img"
        style="background-image: url('<c:url value="/resources/images/bg_3.jpg" />');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row justify-content-center mb-5 pb-5">
                <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                    <h2>Danh sách bàn</h2>
                </div>
            </div>
        </div>
    </section>
    <section class="ftco-section bg-light table">
        <div class="container special-dish">
            <div class="row d-flex no-gutters row-table">
            
                <c:set var="halfLength" value="${dsBanAn.size() / 2 }"></c:set>
                <c:set var="i" value="0"></c:set>
                <div class="col-lg-6">
                    <c:choose>
                       <c:when test="${dsBanAn == null || dsBanAn.size() == 0 }">
                                <h3 style="margin-left: 10px; color: white;">Không có bàn ăn có thể chọn</h3>
                            </div><div class="col-lg-6">
                       </c:when>
                       <c:otherwise>
		                    <c:forEach var="banan" items="${dsBanAn }">
		                        <c:choose>
		                            <c:when test="${i >= halfLength}">
		                                </div><div class="col-lg-6">
		                                <div class="block-3 d-md-flex ftco-animate item-table">
		                                    <input type="hidden" value="${banan.maBA }">
					                        <div class="image order-last" style="background-image: url('<c:url value="/data/${banan.hinhAnh }" />');"></div>
					                        <div class="text text-center order-first">
					                            <h2 class="heading">${banan.kySoBA }</h2>
					                            <p>${banan.motaBA }</p>
					                            <div class="price">
					                                giá <fmt:formatNumber pattern="#,###">${banan.phuGia }</fmt:formatNumber> <span> Đ</span>
					                            </div>
					                        </div>
					                    </div>
		                                <c:set var="i" value="${0 }"></c:set>
		                            </c:when>
		                            <c:otherwise>
		                                <div class="block-3 d-md-flex ftco-animate item-table">
		                                    <input type="hidden" value="${banan.maBA }" >
		                                    <div class="image order-last" style="background-image: url('<c:url value="/data/${banan.hinhAnh }" />');"></div>
		                                    <div class="text text-center order-first">
		                                        <h2 class="heading">${banan.kySoBA }</h2>
		                                        <p>${banan.motaBA }</p>
		                                        <div class="price">
		                                            giá <fmt:formatNumber pattern="#,###">${banan.phuGia }</fmt:formatNumber> <span> Đ</span>
		                                        </div>
		                                    </div>
		                                </div>
		                                <c:set var="i" value="${i+1 }"></c:set>
		                            </c:otherwise>
		                        </c:choose>
		                    </c:forEach>
		                </c:otherwise>
		            </c:choose>
                </div>
                <form action="dat-ban" id="order" method="POST">
                    <input type="hidden" id="maBA" name="maBA" value="">
                </form>
            
                <%-- <div class="col-lg-6">
                    <div class="block-3 d-md-flex ftco-animate">
                        <div class="image order-last" style="background-image: url('<c:url value="/resources/images/dish-3.jpg" />');"></div>
                        <div class="text text-center order-first">
                            <h2 class="heading">Beef Steak</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the
                                blind texts</p>
                            <div class="price">
                                giá 10000000 <span> Đ</span>
                            </div>
                        </div>
                    </div>
                    <div class="block-3 d-md-flex ftco-animate">
                        <div class="image order-first" style="background-image: url('<c:url value="/resources/images/dish-4.jpg" />');"></div>
                        <div class="text text-center order-first">
                            <h2 class="heading">Beef Ribs Steak</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the
                                blind texts</p>
                            <div class="price">
                                giá 10000000 <span> Đ</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="block-3 d-md-flex ftco-animate">
                        <div class="image order-last" style="background-image: url('<c:url value="/resources/images/dish-5.jpg" />');"></div>
                        <div class="text text-center order-first">
                            <h2 class="heading">Chopsuey</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the
                                blind texts</p>
                            <div class="price">
                                giá 10000000 <span> Đ</span>
                            </div>
                        </div>
                    </div>
                    <div class="block-3 d-md-flex ftco-animate">
                        <div class="image order-first" style="background-image: url('<c:url value="/resources/images/dish-6.jpg" />');"></div>
                        <div class="text text-center order-first">
                            <h2 class="heading">Roasted Chieken</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the
                                blind texts</p>
                            <div class="price">
                                giá 10000000 <span> Đ</span>
                            </div>
                        </div>
                    </div>
                </div> --%>
            </div>
        </div>
    </section>
    <!-- end table -->