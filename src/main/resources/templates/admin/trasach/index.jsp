<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">


<!-- basic-table.html  21 Nov 2019 03:55:20 GMT -->

<head>
<title>Otika - Admin Dashboard Template</title>
</head>

<body>

	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Các thông báo trả sách</h4>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Tên sách</th>
										<th scope="col">Ảnh sách</th>
										<th scope="col">Người mượn</th>
										<th scope="col">Số lượng mượn</th>
										<th scope="col">Hành Động</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="traSach, i : ${traSachs}">
										<th scope="row" th:text="${i.count}">1</th>
										<td th:text="${traSach.muonSach.sach.tenSach}">Mark</td>
										<td><img th:src="${traSach.muonSach.sach.anhBia}" width="80" /></td>
										<td th:text="${traSach.muonSach.docGia.tenDocGia}">@mdo</td>
										<td th:text="${traSach.muonSach.soLuong}"></td>
										<td><a
											th:href="@{/admin/trasach/{id}(id=${traSach.muonSach.maMuonSach})}"
											class="btn btn-outline-success">Xác nhận đã trả</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h4>Sách đang mượn</h4>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Tên sách</th>
										<th scope="col">Ảnh sách</th>
										<th scope="col">Người mượn</th>
										<th scope="col">Số lượng mượn</th>
										<th scope="col">Hành Động</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="muonSach, i : ${muonSachs}">
										<th scope="row" th:text="${i.count}">1</th>
										<td th:text="${muonSach.sach.tenSach}">Mark</td>
										<td><img th:src="${muonSach.sach.anhBia}" width="80" /></td>
										<td th:text="${muonSach.docGia.tenDocGia}">@mdo</td>
										<td th:text="${muonSach.soLuong}"></td>
										<td><a
											th:href="@{/admin/trasach/{id}(id=${muonSach.maMuonSach})}"
											class="btn btn-outline-success">Đã đến trả trực tiếp</a></td>
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