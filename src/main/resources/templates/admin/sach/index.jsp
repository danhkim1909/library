<!DOCTYPE html>
<html layout:decorate="~{admin/layout}"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Quản lý sách</title>
</head>
<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Sách</h4>
						</div>
						<div class="card-body">
							<a class="section-title mt-0 btn btn-outline-success"
								th:href="@{/admin/sach/create}">Thêm sách mới</a>
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Ảnh bìa</th>
										<th scope="col">Tên sách</th>
										<th scope="col">Thể loại</th>
										<th scope="col">Tác giả</th>
										<th scope="col">Nhà xuất bản</th>
										<th scope="col">Số lượng</th>
										<th class="col-2" scope="col">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="sach,i : ${sachs}" class="">
										<th scope="row" th:text="${i.count}">STT</th>

										<td><img th:if="${sach.anhBia != null}"
											th:src="@{${sach.anhBia}}" alt="Ảnh bìa"
											style="width: 60px; height: auto; object-fit: cover;">
										</td>

										<td th:text="${sach.tenSach}">Tên sách mẫu</td>

										<td>
											<div th:each="tl : ${sach.theLoais}"
												th:text="${tl.tenTheLoai}"></div>
										</td>


										<td>
											<div th:each="tg : ${sach.tacGias}" th:text="${tg.tenTacGia}">
											</div>
										</td>

										<td th:text="${sach.nxb?.tenNhaXuatBan}">NXB mẫu</td>

										<td th:text="${sach.getSoLuong()}">10</td>

										<td class="d-flex align-items-center gap-2"><a
											th:href="@{/admin/sach/update/{id}(id=${sach.maSach})}"
											class="btn btn-outline-info btn-sm">Sửa</a> <a
											th:href="@{/admin/sach/show/{id}(id=${sach.maSach})}"
											th:class="${sach.hien ? 'btn btn-outline-warning btn-sm' : 'btn btn-outline-danger btn-sm'}">
												<i th:class="${sach.hien ? 'fa fa-eye' : 'fa fa-eye-slash'}"></i>
												<span th:text="${sach.hien ? 'Đang hiện' : 'Đã ẩn'}"></span>
										</a></td>
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