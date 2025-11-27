<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	layout:decorate="~{admin/layout}">
<head>
<meta charset="UTF-8">
<title>Sửa thông tin Nhân viên</title>
</head>
<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Sửa thông tin tài khoản</h4>
						</div>

						<div class="card-body">
							<form th:action="@{/admin/nguoidung/update/nhanvien}" method="post"
								id="nhanVienForm" th:object="${user}">
								<input type="hidden" name="maNhanVien" th:value="${maNhanVien}" />
								<input type="hidden" name="matKhau" th:value="12345678" />
								<div class="form-group">
									<label>Tên đăng nhập</label> <input type="text"
										th:field="*{tenDangNhap}" class="form-control" readonly="readonly">
								</div>

								<div class="form-group">
									<label>Tên nhân viên</label> <input type="text"
										th:field="*{tenNhanVien}" class="form-control">
										<div th:if="${#fields.hasErrors('tenNhanVien')}" class="text-danger" th:errors="*{tenNhanVien}"></div>
								</div>

								<div class="form-group">
									<label>Địa chỉ</label> <input type="text" th:field="*{diaChi}"
										class="form-control">
										<div th:if="${#fields.hasErrors('diaChi')}" class="text-danger" th:errors="*{diaChi}"></div>
								</div>

								<div class="form-group">
									<label>Số điện thoại</label> <input type="text"
										th:field="*{soDt}" class="form-control">
										<div th:if="${#fields.hasErrors('soDt')}" class="text-danger" th:errors="*{soDt}"></div>
								</div>

								<div class="form-group">
									<label>Chức vụ</label> <input type="text" th:field="*{chucVu}"
										class="form-control">
										<div th:if="${#fields.hasErrors('chucVu')}" class="text-danger" th:errors="*{chucVu}"></div>
								</div>

								<div class="form-group">
									<label>Giới tính</label> <select class="form-control"
										th:field="*{gioiTinh}">
										<option value="Nam">Nam</option>
										<option value="Nữ">Nữ</option>
									</select>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary">Lưu</button>
								<a th:href="@{/admin/nguoidung}" class="btn btn-secondary">Quay lại</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>