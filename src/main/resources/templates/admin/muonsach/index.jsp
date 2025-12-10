<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">


<head>
<title>Otika - Admin Dashboard Template</title>
<style>
    /* Nếu class 'text-center' chưa được định nghĩa trong framework CSS của bạn */
    .text-center {
        text-align: center !important;
    }
</style>
</head>

<body>

	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Các yêu cầu mượn sách</h4> 
                            </div>
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">STT</th>
										<th scope="col">Tên sách</th>
										<th scope="col">Ảnh sách</th>
										<th scope="col">Người mượn</th>
										<th scope="col" class="text-center">Số lượng mượn</th> 
										<th scope="col">Hành Động</th>
									</tr>
								</thead>
								<tbody>
									<tr th:each="muonSach, i : ${muonSachs}">
										<th scope="row" th:text="${i.count}">1</th>
										<td th:text="${muonSach.sach.tenSach}">Mark</td>
										<td><img th:src="${muonSach.sach.anhBia}" width="80" /></td>
										<td th:text="${muonSach.docGia.tenDocGia}">@mdo</td>
										<td th:text="${muonSach.soLuong}" class="text-center"></td> 
										<td><a
											th:href="@{/admin/muonsach/tuchoi/{id}(id = ${muonSach.maMuonSach})}"
											class="btn btn-outline-danger ">Từ chối</a> <a
											th:href="@{/admin/muonsach/chapnhan/{id}(id=${muonSach.maMuonSach})}"
											class="btn btn-outline-success">Đồng ý</a></td>
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