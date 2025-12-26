<!doctype html>
<html lang="en" layout:decorate="~{content/layout}">


<!-- Mirrored from html-template.spider-themes.net/bookjar/my-following-authors.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:14 GMT -->

<head>

	<title>Bookjar</title>
</head>

<body layout:fragment="content">

	<div class="cart-header-separator"></div>


	<!-- Dashboard area -->
	<section class="bj_account_dashboard" data-bg-color="#f5f5f5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="account_dashboard_body">
						<div class="account_dashboard_content">
							<div class="account_dashboard_content_header">Danh sách
								đang mượn</div>
							<form action="#">
								<div class="row gy-3 follow_author_list">
									<div class="col-lg-12">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">STT</th>
														<th scope="col">Ảnh bìa</th>
														<th scope="col">Sách</th>
														<th scope="col">Mượn lúc</th>
														<th scope="col">Trạng thái</th>
														<th scope="col">Hành động</th>
													</tr>
												</thead>
												<tbody>
													<tr th:each="muonSach, i : ${muonSachs}">
														<td th:text="${i.count}">stt</td>
														<td><img th:src="${muonSach.sach.anhBia}"
																th:alt="${muonSach.sach.tenSach}" width="100"></td>
														<td><a href="#" class="author_name"
																th:text="${muonSach.sach.tenSach  + ' - ' + muonSach.soLuong + ' quyển'}">Rabindranath
																Tagore</a></td>
														<td
															th:text="${#temporals.format(muonSach.thoiGianMuon, 'dd/MM/yyyy - hh:mm a')}">
															11
															Oct 2024</td>
														<td>
															<div th:if="${muonSach.xacNhan == true && muonSach.traSach == null}"
																class="text-success">Được cho phép</div>
															<div th:if="${muonSach.xacNhan == true && muonSach.traSach != null}"
																class="text-success">Đang đi trả sách</div>
															<div th:if="${muonSach.xacNhan == null}"
																class="text-warning">Chờ xem xét</div>
														</td>
														<td><a th:if="${muonSach.xacNhan == true && muonSach.traSach == null}"
																class="btn btn-success"
																th:href="@{/trasach/{id}(id=${muonSach.maMuonSach})}">Trả
																sách</a>

															<a th:if="${muonSach.xacNhan == null}"
																class="btn btn-success"
																th:href="@{/huymuon/{id}(id=${muonSach.maMuonSach})}">Hủy
																mượn</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>

									</div>
								</div>
							</form>
						</div>
						<div class="account_dashboard_content">
							<div class="account_dashboard_content_header">Lịch sử từng
								mượn</div>
							<form action="#">
								<div class="row gy-3 follow_author_list">
									<div class="col-lg-12">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">STT</th>
														<th scope="col">Ảnh bìa</th>
														<th scope="col">Sách</th>
														<th scope="col">Mượn lúc</th>
														<th scope="col">Trạng thái</th>
													</tr>
												</thead>
												<tbody>
													<tr th:each="muonSach, i : ${lichSus}">
														<td th:text="${i.count}">stt</td>
														<td><img th:src="${muonSach.sach.anhBia}"
																th:alt="${muonSach.sach.tenSach}" width="100"></td>
														<td><a href="#" class="author_name"
																th:text="${muonSach.sach.tenSach  + ' - ' + muonSach.soLuong + ' quyển'}">Rabindranath
																Tagore</a></td>
														<td
															th:text="${#temporals.format(muonSach.thoiGianMuon, 'dd/MM/yyyy - hh:mm a')}">
															11
															Oct 2024</td>
														<td>
															<div th:if="${muonSach.xacNhan == true}"
																class="text-success">Đã trả</div>
															<div th:if="${muonSach.xacNhan == false}"
																class="text-danger">Đã hủy</div>
														</td>

													</tr>
												</tbody>
											</table>
										</div>

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- Dashboard area -->
</body>


<!-- Mirrored from html-template.spider-themes.net/bookjar/my-following-authors.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:16 GMT -->

</html>