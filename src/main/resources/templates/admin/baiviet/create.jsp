<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
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
							<h4>Thêm bài viết mới</h4>
						</div>

						<form class="card-body" th:object="${baiViet}" method="post"
							th:action="@{/admin/baiviet/create}" enctype="multipart/form-data">

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Tên bài viết</label> <input type="text" class="form-control"
											th:field="*{tenBaiViet}">
										<div class="text-danger" th:if="${#fields.hasErrors('tenBaiViet')}"
											th:errors="*{tenBaiViet}"></div>
									</div>

									<div class="form-group">
										<div>
											<label>Danh mục:</label> <select th:field="*{danhMucBaiVietId}"
												class="form-control" style="width: 100%;">
												<option value="">Chọn danh mục</option>
												<option th:each="danhMuc : ${danhMucBaiViets}"
													th:value="${danhMuc.maDanhMuc}" th:text="${danhMuc.tenDanhMuc}">
												</option>
											</select>
										</div>
										<div class="text-danger" th:if="${#fields.hasErrors('danhMucBaiVietId')}"
											th:errors="*{danhMucBaiVietId}"></div>
									</div>

									<div class="form-group">
										<label>Mô tả</label>
										<textarea class="form-control" th:field="*{moTa}"></textarea>
										<div class="text-danger" th:if="${#fields.hasErrors('moTa')}"
											th:errors="*{moTa}"></div>
									</div>

								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label>Ảnh (Chọn file)</label>
										<input type="file" name="anh" class="form-control" id="fileAnh">
										<div class="text-danger" th:if="${#fields.hasErrors('anh')}" th:errors="*{anh}">
										</div>

										<img id="anhPreview" src="" alt="Ảnh xem trước"
											style="max-width: 100%; height: auto; margin-top: 10px; display: none;">
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-form-label">Nội dung</label>
								<textarea class="summernote" th:field="*{noiDung}"></textarea>
								<div class="text-danger" th:if="${#fields.hasErrors('noiDung')}" th:errors="*{noiDung}">
								</div>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" th:field="*{hien}" id="hien">
								<label class="form-check-label" for="hien">
									Hiển thị
								</label>
							</div>

							<div class="card-footer text-right">
								<button class="btn btn-primary mr-1" type="submit">Lưu</button>
								<a class="btn btn-secondary" th:href="@{/admin/baiviet}">Quay
									lại</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script layout:fragment="scripts">
		$(document).ready(function () {

			$('#fileAnh').on('change', function (event) {
				const imagePreview = $('#anhPreview');
				if (event.target.files && event.target.files[0]) {
					const reader = new FileReader();

					reader.onload = function (e) {
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