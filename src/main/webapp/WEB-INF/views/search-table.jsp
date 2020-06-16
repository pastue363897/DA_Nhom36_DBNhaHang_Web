<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- book-table -->
<div class="ftco-section-reservation">
	<div class="container">
		<div class="row">
			<div class="col-md-12 reservation pt-5 px-5">
				<div class="block-17">
					<form action="search-banan" method="POST" class="d-block d-lg-flex">
						<div class="fields d-block d-lg-flex">

							<div class="one-third">
								<input type="text" id="moTaBA" name="moTaBA" class="form-control" data-value="${param.moTaBA }" placeholder="Mô tả">
							</div>

                            <div class="one-third">
                                <input type="text" id="gioBA" name="gioBA" class="form-control" data-value="${param.gioBA }" placeholder="Thời gian">
                            </div>
                            
							<div class="one-third">
								<input type="text" id="ngayPhucVuBA" name="ngayPhucVuBA" data-value="${param.ngayPhucVuBA }" class="form-control" placeholder="Ngày phục vụ">
							</div>

							<div class="one-third">
                                <input type="text" id="soNguoiBA" name="soNguoiBA" data-value="${param.soNguoiBA }" class="form-control" placeholder="Số lượng người">
                            </div>
						</div>
						<input type="submit" id="search-table" class="search-submit btn btn-primary" value="Tìm bàn">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end book-table -->