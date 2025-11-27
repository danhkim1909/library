<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">

<head>

<title>Sửa thể loại</title>
</head>

<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Sửa thể loại</h4>
						</div>
						<form class="card-body" th:object="${theLoai}" method="post"
							th:action="@{/admin/theloai/update}"
							enctype="multipart/form-data">
							<input type="hidden" th:field="*{maTheLoai}" />
							<div class="form-group">
								<label>Tên thể loại</label> <input type="text"
									class="form-control" th:field="*{tenTheLoai}">
									<div class="text-danger" th:if="${#fields.hasErrors('tenTheLoai')}" th:errors="*{tenTheLoai}" ></div>
							</div>
							<div class="form-group">
								<label>Mô tả</label>
								<textarea class="form-control" th:field="*{moTa}"></textarea>
								<div class="text-danger" th:if="${#fields.hasErrors('moTa')}" th:errors="*{moTa}" ></div>
							</div>
							<div class="form-group">
								<label class="d-block">Hiện</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										th:field="*{hien}" id="hien"> <label
										class="form-check-label" for="hien"> Hiện
									</label>
								</div>
							</div>
							<div class="card-footer text-right">
								<button class="btn btn-primary mr-1" type="submit">Lưu</button>
													<a class="btn btn-secondary" th:href="@{/admin/theloai}">Quay lại</a>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>
	</section>
</body>

</html>