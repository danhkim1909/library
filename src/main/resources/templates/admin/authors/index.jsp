<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">


<!-- basic-table.html  21 Nov 2019 03:55:20 GMT -->

<head>
	<title>Quản lý tác giả</title>
</head>

<body>

	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Tác giả</h4>
						</div>
						<div class="card-body">
							<a class="section-title mt-0 btn btn-outline-success" th:href="@{/admin/tacgia/create}">Thêm
								tác giả</a>
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th class="col-1" scope="col">STT</th>
										<th class="col-2" scope="col">Tên</th>
										<th class="col-5" scope="col">Mô tả</th>
										<th scope="col">Ảnh</th>
										<th scope="col">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="tacGia,i : ${tacGias}" class="">
										<th scope="row" th:text="${i.count}">STT</th>
										<td th:text="${tacGia.tenTacGia}">Mark</td>
										<td th:text="${#strings.abbreviate(tacGia.moTa, 200)}">mota</td>
										<td><img th:src="@{${tacGia.anh}}" width="100" height="100" /></td>
										<td class="d-flex justify-content-between align-items-center">
											<a th:href="@{/admin/tacgia/update/{id}(id = ${tacGia.maTacGia})}"
												class="btn btn-outline-info">Sửa</a>
											<a th:href="@{/admin/tacgia/detail/{id}(id = ${tacGia.maTacGia})}"
												class="btn btn-outline-primary">Xem</a>
											<a th:href="@{/admin/tacgia/show/{id}(id = ${tacGia.maTacGia})}"
												th:class="${tacGia.hien ? 'btn btn-outline-warning' : 'btn btn-outline-danger'}"><i
													th:class="${tacGia.hien ? 'fa fa-eye\' : 'fa fa-eye-slash'}"
													aria-hidden="true"></i><span
													th:text="${tacGia.hien ? 'Đang hiện' : 'Đã ẩn' }">Ẩn</span></a>
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

</html>