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
						aria-controls="v-pills-home" aria-selected="true"><span class="flaticon-meat"></span> Món chính</a> <a
						class="nav-link py-3 px-4" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
						aria-controls="v-pills-profile" aria-selected="false"><span class="flaticon-cutlery"></span> Tráng miệng</a> <a
						class="nav-link py-3 px-4" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
						aria-controls="v-pills-messages" aria-selected="false"><span class="flaticon-cheers"></span> Đồ uống</a>
				</div>

				<c:set var="halfLength" value="${fn:length(dsMonAn) / 2 }"></c:set>
				<c:set var="i" value="0"></c:set>
				<div class="tab-content py-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
						<div class="row">
							<div class="col-lg-6">
								<c:forEach var="monan" items="${dsMonAn }">
									<c:choose>
										<c:when test="${i >= halfLength}">
											</div><div class="col-lg-6">
											<div class="menus d-flex ftco-animate">
												<div class="menu-img" style="background-image: url('<c:url value="/data/${monan.hinhAnhMA }" />');"></div>
												<div class="text d-flex">
													<div class="one-half">
														<h3>${monan.tenMA }</h3>
														<p>${monan.nguyenLieu }</p>
													</div>
													<div class="one-forth">
														<span class="price"><fmt:formatNumber pattern="#,###">${monan.giaTien }</fmt:formatNumber><span>
																Đ</span></span>
													</div>
												</div>
											</div>
											<c:set var="i" value="${0 }"></c:set>
										</c:when>
										<c:otherwise>
											<div class="menus d-flex ftco-animate">
												<div class="menu-img" style="background-image: url('<c:url value="/data/${monan.hinhAnhMA }" />');"></div>
												<div class="text d-flex">
													<div class="one-half">
														<h3>${monan.tenMA }</h3>
														<p>${monan.nguyenLieu }</p>
													</div>
													<div class="one-forth">
														<span class="price"><fmt:formatNumber pattern="#,###">${monan.giaTien }</fmt:formatNumber><span>
																Đ</span></span>
													</div>
												</div>
											</div>
											<c:set var="i" value="${i+1 }"></c:set>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

				<%-- 
				<div class="tab-content py-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
						<div class="row">
							<div class="col-lg-6">
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-3.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Grilled Beef with potatoes</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-4.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Fruit Vanilla Ice Cream</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-5.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Asian Hoisin Pork</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-6.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Spicy Fried Rice &amp; Bacon</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-7.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Mango Chili Chutney</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-8.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Savory Watercress Chinese Pancakes</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-9.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Soup With Vegetables And Meat</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-10.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Udon Noodles With Vegetables</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-11.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Baked Lobster With A Garnish</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dish-11.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Octopus with Vegetables</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END -->

					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						<div class="row">
							<div class="col-lg-6">
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-1.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Grilled Beef with potatoes</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-2.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Grilled Beef with potatoes</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-3.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Grilled Beef with potatoes</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-4.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Grilled Beef with potatoes</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-5.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Grilled Beef with potatoes</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-6.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Tiramisu</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-7.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Chocolate Cream</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-8.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Pizza Pie</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-9.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Sicilian Ricotta</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/dessert-10.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Mango FLoat</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END -->

					<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
						<div class="row">
							<div class="col-lg-6">
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-1.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Lemon Juice</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-2.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Guava Juice</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-3.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Sprite</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-4.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Cola</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-5.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Wine</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-6.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Beer</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-7.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Mango Juice</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-8.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Apple Juice</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-9.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Strawberry Juice</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
								<div class="menus d-flex ftco-animate">
									<div class="menu-img" style="background-image: url('<c:url value="/resources/images/drink-10.jpg" />');"></div>
									<div class="text d-flex">
										<div class="one-half">
											<h3>Orange Juice</h3>
											<p>
												<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
											</p>
										</div>
										<div class="one-forth">
											<span class="price">10000000<span> Đ</span></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> --%>
				<div class="col-sm-12 pt-4 text-center ftco-animate">
					<p>Tất cả chúng ta đều ăn vì thế sẽ thật là lãng phí và buồn tẻ nếu ăn những thứ chả ra gì</p>
					<span><a href="reservation.html" class="btn btn-primary btn-outline-primary p-3">Đặt bàn ngay</a></span>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<!-- end food -->