<!DOCTYPE html>
<html layout:decorate="~{admin/layout}">
<head>
<meta charset="UTF-8">
<title>Quản lý nhà xuất bản</title>
</head>
<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Nhà xuất bản</h4>
						</div>
						<div class="card-body">
							<a class="section-title mt-0 btn btn-outline-success"
								th:href="@{/admin/nhaxuatban/create}">Thêm nhà xuất bản</a>
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th class="col-1" scope="col">STT</th>
										<th class="" scope="col">Tên nhà xuất bản</th>
										<th class="" scope="col">Email</th>
										<th scope="col">Số điện thoại</th>
										<th scope="col">Địa chỉ</th>
										<th class="col-2" scope="col">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="nhaXB,i : ${nhaXuatBans}" class="">
										<th scope="row" th:text="${i.count}">STT</th>
										<td th:text="${nhaXB.tenNhaXuatBan}">Mark</td>
										<td th:text="${nhaXB.email}">Mark</td>
										<td th:text="${nhaXB.soDienThoai}">Mark</td>
										<td th:text="${nhaXB.diaChi}">Mark</td>
										<td class="d-flex align-items-center gap-2">
										  <a th:href="@{/admin/nhaxuatban/update/{id}(id=${nhaXB.maNhaXuatBan})}"
										     class="btn btn-outline-info btn-sm">Sửa</a>
										
										  <a th:href="@{/admin/nhaxuatban/show/{id}(id=${nhaXB.maNhaXuatBan})}"
										     th:class="${nhaXB.hien ? 'btn btn-outline-warning btn-sm' : 'btn btn-outline-danger btn-sm'}">
										    <i th:class="${nhaXB.hien ? 'fa fa-eye' : 'fa fa-eye-slash'}"></i>
										    <span th:text="${nhaXB.hien ? 'Đang hiện' : 'Đã ẩn'}"></span>
										  </a>
										</td>

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