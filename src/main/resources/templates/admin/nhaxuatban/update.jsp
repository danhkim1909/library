<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">

<head>

	<title>Sửa nhà xuất bản</title>
</head>

<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Sửa nhà xuất bản</h4>
						</div>
						<form class="card-body" th:object="${nhaXuatBan}" method="post"
							th:action="@{/admin/nhaxuatban/update}" enctype="multipart/form-data">
							<input type="hidden" th:field="*{maNhaXuatBan}" />
							<div class="form-group">
								<label>Tên nhà xuất bản</label> <input type="text" class="form-control"
									th:field="*{tenNhaXuatBan}">
								<div class="text-danger" th:if="${#fields.hasErrors('tenNhaXuatBan')}"
									th:errors="*{tenNhaXuatBan}"></div>
							</div>
							<div class="form-group">
								<label>Email</label> <input type="text" class="form-control" th:field="*{email}">
								<div class="text-danger" th:if="${#fields.hasErrors('email')}" th:errors="*{email}">
								</div>
							</div>
							<div class="form-group">
								<label>Số điện thoại</label> <input type="text" class="form-control"
									th:field="*{soDienThoai}">
								<div class="text-danger" th:if="${#fields.hasErrors('soDienThoai')}"
									th:errors="*{soDienThoai}"></div>
							</div>
							<div class="form-group">
								<label>Địa chỉ</label> <input type="text" class="form-control" th:field="*{diaChi}">
								<div class="text-danger" th:if="${#fields.hasErrors('diaChi')}" th:errors="*{diaChi}">
								</div>
							</div>
							<div class="card-footer text-right">
								<button class="btn btn-primary mr-1" type="submit">Lưu</button>
								<a class="btn btn-secondary" th:href="@{/admin/nhaxuatban}">Quay lại</a>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>
	</section>
</body>

</html>