<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	xmlns:th="http://www.thymeleaf.org">
<head>
<title>Thêm sách mới</title>
<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Thêm sách mới</h4>
						</div>

						<form class="card-body" th:object="${sach}" method="post"
							th:action="@{/admin/sach/create}" enctype="multipart/form-data">

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Tên sách</label> <input type="text"
											class="form-control" th:field="*{tenSach}">
										<div class="text-danger"
											th:if="${#fields.hasErrors('tenSach')}"
											th:errors="*{tenSach}"></div>
									</div>

									<div class="form-group">
										<div>
											<label>Thể loại:</label> <select multiple="multiple"
												th:field="*{theLoaiIds}" class="form-control select2-multi"
												style="width: 100%;">
												<option th:each="theLoai : ${theLoais}"
													th:value="${theLoai.maTheLoai}"
													th:text="${theLoai.tenTheLoai}"></option>
											</select>
										</div>
										<div class="text-danger"
											th:if="${#fields.hasErrors('theLoaiIds')}"
											th:errors="*{theLoaiIds}"></div>
									</div>

									<div class="form-group">
										<div>
											<label>Tác giả:</label> <select multiple="multiple"
												th:field="*{tacGiaIds}" class="form-control select2-multi"
												style="width: 100%;">
												<option th:each="tacGia : ${tacGias}"
													th:value="${tacGia.maTacGia}" th:text="${tacGia.tenTacGia}">
												</option>
											</select>
										</div>
										<div class="text-danger"
											th:if="${#fields.hasErrors('tacGiaIds')}"
											th:errors="*{tacGiaIds}"></div>
									</div>
									<div class="form-group">
										<label>Nhà xuất bản</label> <select class="form-control"
											th:field="*{nxbId}">
											<option value="">-- Chọn nhà xuất bản --</option>
											<option th:each="nxb : ${nxbs}"
												th:value="${nxb.maNhaXuatBan}"
												th:text="${nxb.tenNhaXuatBan}"></option>
										</select>
										<div class="text-danger" th:if="${#fields.hasErrors('nxbId')}"
											th:errors="*{nxbId}"></div>
									</div>

								
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label>Năm xuất bản</label> <input type="number"
											class="form-control" th:field="*{namXuatBan}">
										<div class="text-danger"
											th:if="${#fields.hasErrors('namXuatBan')}"
											th:errors="*{namXuatBan}"></div>
									</div>

									<div class="form-group">
										<label>Ảnh bìa (Chọn file)</label> 
										<input type="file"
											name="fileAnhBia" class="form-control" id="fileAnhBia">
										<div class="text-danger"
											th:if="${#fields.hasErrors('anhBia')}" th:errors="*{anhBia}"></div>

										<img id="anhBiaPreview" src="" alt="Ảnh bìa xem trước"
											style="max-width: 100%; height: auto; margin-top: 10px; display: none;">
									</div>
									
										<div class="form-group">
										<label>Mô tả</label>
										<textarea class="form-control" th:field="*{moTa}" rows="6"></textarea>
										<div class="text-danger" th:if="${#fields.hasErrors('moTa')}"
											th:errors="*{moTa}"></div>
									</div>
								</div>
							</div>

							<div class="card-footer text-right">
								<button class="btn btn-primary mr-1" type="submit">Lưu</button>
								<a class="btn btn-secondary" th:href="@{/admin/sach}">Quay
									lại</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script layout:fragment="scripts">
		$(document).ready(function() {

			$('.select2-multi').select2({
				theme : "bootstrap4"
			});

			$('#fileAnhBia').on('change', function(event) {
				const imagePreview = $('#anhBiaPreview');
				if (event.target.files && event.target.files[0]) {
					const reader = new FileReader();

					reader.onload = function(e) {
						imagePreview.attr('src', e.target.result);
						imagePreview.css('display', 'block');
					}

					reader.readAsDataURL(event.target.files[0]);
				} else {
					imagePreview.attr('src', '');
					imagePreview.css('display', 'none');
				}
			});
		});
	</script>
</body>
</html>