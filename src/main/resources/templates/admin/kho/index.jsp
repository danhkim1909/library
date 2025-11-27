<!DOCTYPE html>
<html layout:decorate="~{admin/layout}"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Quản lý kho</title>
</head>
<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Phiếu nhập</h4>
						</div>
						<div class="card-body">
							<a class="section-title mt-0 btn btn-outline-success"
								th:href="@{/admin/kho/add}">Nhập sách</a>
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Sách nhập</th>
										<th scope="col">Ngày nhập</th>
										<th class="col-3" scope="col">Ghi chú</th>
										<th scope="col">Người nhập</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="phieuNhap,i : ${phieuNhaps}" class="">
										<th scope="row" th:text="${i.count}">STT</th>

										<td>
											<ul>
												<li th:each="chiTiet : ${phieuNhap.chiTietList}"
													th:text="${chiTiet.sach.tenSach + ' - ' + chiTiet.soLuong + ' quyển'}"></li>
											</ul>
										</td>

										<td th:text="${#temporals.format(phieuNhap.ngayNhap, 'dd-MM-yyyy HH:mm:ss')}"></td>
										<td th:text="${phieuNhap.ghiChu}"></td>
										<td th:text="${phieuNhap.nhanVien.tenNhanVien}"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Phiếu xuất</h4>
						</div>
						<div class="card-body">
							<a class="section-title mt-0 btn btn-outline-success"
								th:href="@{/admin/kho/subtract}">Xuất sách</a>
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Sách xuất</th>
										<th scope="col">Ngày xuất</th>
										<th scope="col">Ghi chú</th>
										<th scope="col">Người xuất</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="phieuXuat,i : ${phieuXuats}" class="">
										<th scope="row" th:text="${i.count}">STT</th>

										<td>
											<ul>
												<li th:each="chiTiet : ${phieuXuat.chiTietList}"
													th:text="${chiTiet.sach.tenSach + ' - ' + chiTiet.soLuong + ' quyển'}"></li>
											</ul>
										</td>

										<td th:text="${phieuXuat.ngayXuat}"></td>
										<td th:text="${phieuXuat.ghiChu}"></td>
										<td th:text="${phieuXuat.nhanVien.tenNhanVien}"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>