<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">

<head>

<title>Thêm tác giả mới</title>
</head>

<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Thêm tác giả</h4>
						</div>
						<form class="card-body" th:object="${tacGia}" method="post"
							th:action="@{/admin/tacgia/create}" enctype="multipart/form-data">
							<div class="form-group">
								<label>Tên tác giả</label> <input type="text"
									class="form-control" th:field="*{tenTacGia}">
								<div class="text-danger"
									th:if="${#fields.hasErrors('tenTacGia')}"
									th:errors="*{tenTacGia}"></div>
							</div>
							<div class="form-group">
								<label> Năm sinh</label> <input type="text" class="form-control"
									th:field="*{namSinh}">
								<div class="text-danger" th:if="${#fields.hasErrors('namSinh')}"
									th:errors="*{namSinh}"></div>
							</div>
							<div class="form-group">
								<label>Mô tả</label>
								<textarea class="form-control" th:field="*{moTa}"></textarea>
								<div class="text-danger" th:if="${#fields.hasErrors('moTa')}"
									th:errors="*{moTa}"></div>
							</div>
							<div class="form-group">
								<label>Nội dung</label>
								<textarea class="form-control" th:field="*{noiDung}"></textarea>
								<div class="text-danger" th:if="${#fields.hasErrors('noiDung')}"
									th:errors="*{noiDung}"></div>
							</div>

							<div class="form-group">
								<label>Ảnh tác giả</label> <input type="file"
									class="form-control" accept="image/*" name="fileAnh">
								<div class="text-danger" th:if="${#fields.hasErrors('anh')}"
									th:errors="*{anh}"></div>
							</div>

							<div class="form-group">
								<label class="d-block">Hiện</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										th:field="*{hien}" id="hien"> <label
										class="form-check-label" for="hien"> Hiện </label>
								</div>
							</div>
							<div class="card-footer text-right">
								<button class="btn btn-primary mr-1" type="submit">Lưu</button>
								<a class="btn btn-secondary" th:href="@{/admin/tacgia}">Quay
									lại</a>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>
	</section>
</body>

</html>