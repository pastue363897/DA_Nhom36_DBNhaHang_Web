<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- food -->
<section class="ftco-section bg-light food">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-5">
			<div class="col-md-7 text-center heading-section ftco-animate">
				<span class="subheading">Danh sách món ăn</span>
				<h2>Khám Phá Món Ăn Của Chúng Tôi</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 dish-menu">

				<div class="nav nav-pills justify-content-center ftco-animate" id="v-pills-tab" role="tablist"
					aria-orientation="vertical">
					<a class="nav-link py-3 px-4 active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
						aria-controls="v-pills-home" aria-selected="true"><span class="flaticon-meat"></span> Món chính</a>
				</div>

				<c:set var="halfLength" value="${fn:length(dsMonAn) / 2 }"></c:set>
				<c:set var="i" value="0"></c:set>
				<div class="tab-content py-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
						<div class="row">
							<div class="col-lg-6">
							    <c:choose>
								    <c:when test="${dsMonAn == null || fn:length(dsMonAn) == 0 }">
								             <h3 style="margin-left: 10px">Hiện tại không có món ăn có thể chọn</h3>
								         </div><div class="col-lg-6">
								    </c:when>
								    <c:otherwise>
										<c:forEach var="monan" items="${dsMonAn }">
											<c:choose>
												<c:when test="${i >= halfLength}">
													</div><div class="col-lg-6">
													<div class="menus d-flex ftco-animate">
													    <input type="hidden" class="maMA" value="${monan.maMA }">
														<div class="menu-img" style="background-image: url('<c:url value="/data/${monan.hinhAnhMA }" />');"></div>
														<div class="text d-flex">
															<div class="one-half">
																<h3>${monan.tenMA }</h3>
																<p>${monan.nguyenLieu }</p>
															</div>
															<div class="one-forth">
																<span class="price"><fmt:formatNumber pattern="#,###">${monan.giaTien }</fmt:formatNumber><span>
																		Đ</span></span>
																		<div>
																		    <a class="a" href="chitiet-monan/${monan.maMA }">Xem chi tiết</a>
																		</div>
															</div>
														</div>
													</div>
													<c:set var="i" value="${0 }"></c:set>
												</c:when>
												<c:otherwise>
													<div class="menus d-flex ftco-animate">
													    <input type="hidden" class="maMA" value="${monan.maMA }">
														<div class="menu-img" style="background-image: url('<c:url value="/data/${monan.hinhAnhMA }" />');"></div>
														<div class="text d-flex">
															<div class="one-half">
																<h3>${monan.tenMA }</h3>
																<p>${monan.nguyenLieu }</p>
															</div>
															<div class="one-forth">
																<span class="price"><fmt:formatNumber pattern="#,###">${monan.giaTien }</fmt:formatNumber><span>
																		Đ</span></span>
																		<div>
		                                                                    <a class="a" href="chitiet-monan/${monan.maMA }">Xem chi tiết</a>
		                                                                </div>
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
						</div>
					</div>
				</div>
                <!-- Modal -->
				<div class="modal fade" id="chitiet-monan" tabindex="-1" role="dialog">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="tenMonAn">Tên món ăn</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <div id="modal-body-left">
				            <img id="hinhAnh" alt="hinh-anh-mon-an" src="">
				        </div>
				        <div id="modal-body-right">
				            <div>
				                Nguyên liệu chính: <span id="nguyenLieu"></span>
				            </div>
				            <div>
                                Mô tả: <span id="moTa"></span>
                            </div>
                            <div>
                                Số người dùng: <span id="soNguoi"></span>
                            </div>
                            <div>
                                Giá: <span id="giaTien"></span> Đ
                            </div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				<div id="example-item-monan" style="display: none;">
				    <div class="menus d-flex ftco-animate">
                        <input type="hidden" class="maMA" value="MA000001">
                        <div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-3.jpg" />');"></div>
                        <div class="text d-flex">
                            <div class="one-half">
                                <h3>Tên món ăn</h3>
                                <p>Nguyên liệu</p>
                            </div>
                            <div class="one-forth">
                                <span class="price">Giá<span>
                                        Đ</span></span>
                                        <div>
                                            <a class="a" href="chitiet-monan/MA000001">Xem chi tiết</a>
                                        </div>
                            </div>
                        </div>
                    </div>
				</div>
				
				<div class="col-sm-12 pt-4 text-center ftco-animate quotations-food">
					<p>Tất cả chúng ta đều ăn vì thế sẽ thật là lãng phí và buồn tẻ nếu ăn những thứ chả ra gì</p>
					<span><a href="banan" class="btn btn-primary btn-outline-primary p-3">Đặt bàn ngay</a></span>
				</div>
			</div>
		</div>
	</div>
	<!-- </div> -->
</section>
<!-- end food -->