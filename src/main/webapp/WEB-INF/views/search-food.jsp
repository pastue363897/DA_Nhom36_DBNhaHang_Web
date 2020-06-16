<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- search-food -->
<div class="ftco-section-reservation">
	<div class="container">
		<div class="row">
			<div class="col-md-12 reservation pt-5 px-5">
				<div class="block-17">
					<form action="" method="post" class="d-block d-lg-flex justify-content-center">
						<div class="fields d-block d-lg-flex">

							<div class="one-third">
								<input type="text" id="tenOrMoTaMA" name="tenOrMoTaMA" class="form-control" data-value="${param.tenOrMoTaMA }" placeholder="Tên hoặc mô tả">
							</div>

                            <div class="one-third">
                                <input type="text" id="giaTienMA" name="giaTienMA" class="form-control" data-value="${param.giaTienMA }" placeholder="Giá tiền">
                            </div>
                            
							<div class="one-third">
                                <input type="text" id="soNguoiAnMA" name="soNguoiAnMA" class="form-control" data-value="${param.soNguoiAnMA }" placeholder="Số người ăn">
                            </div>
						</div>
						<input type="submit" id="search-food" class="search-submit btn btn-primary" value="Tìm kiếm">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end search-food -->