<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	xmlns:th="http://www.thymeleaf.org">
<head>
<title>Tạo Phiếu Xuất Sách</title>
</head>
<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4>Tạo Phiếu Xuất Sách Mới</h4>
						</div>

						<form class="card-body" th:object="${phieuXuatDto}" method="post"
							th:action="@{/admin/kho/subtract}">

							<div class="row">

								<div class="form-group col-12">
									<label>Ghi chú</label> <input type="text" class="form-control"
										th:field="*{ghiChu}" placeholder="Ghi chú (nếu có)">
								</div>
								<div class="text-danger" th:if="${#fields.hasErrors('ghiChu')}"
									th:errors="*{ghiChu}"></div>
							</div>

							<hr>
							<h5>Chi tiết phiếu Xuất</h5>

							<div class="form-group">
								<button type="button" id="them-chi-tiet-btn"
									class="btn btn-info">
									<i class="fas fa-plus"></i> Thêm Sách
								</button>
							</div>

							<div id="chi-tiet-container"></div>
							<div class="text-danger" th:if="${#fields.hasErrors()}"
								th:text="${#fields.allErrors()[0]}"></div>
							<div class="card-footer text-right">
								<button class="btn btn-primary mr-1" type="submit">Lưu
									Phiếu Xuất</button>
								<a class="btn btn-secondary" th:href="@{/admin/sach}">Danh sách</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<template id="chi-tiet-template">
			<div class="row chi-tiet-row mb-3">
				<div class="form-group col-md-7">
					<label>Sách</label> <select name="chiTietList[__INDEX__].maSach"
						class="form-control select-sach" style="width: 100%;">
						<option value="">-- Vui lòng chọn sách --</option>
						<option th:each="sach : ${sachs}" th:value="${sach.maSach}"
							th:text="${sach.tenSach + ' - nhà xuất bản ' + sach.nxb.tenNhaXuatBan + '- Còn : ' + sach.getSoLuong() + ' quyển'}"></option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label>Số lượng</label> <input type="number"
						name="chiTietList[__INDEX__].soLuong" class="form-control"
						value="1" min="1">
				</div>
				<div class="form-group col-md-2 d-flex align-items-end">
					<button type="button" class="btn btn-danger btn-xoa-chi-tiet"
						style="width: 100%;">Xóa</button>

				</div>

			</div>

		</template>

	</section>

	<script layout:fragment="scripts">
		$(document).ready(function() {
			let index = 0;
			const container = $('#chi-tiet-container');

			const templateHtml = $('#chi-tiet-template').html();

			function themDongMoi() {
				const newRowHtml = templateHtml.replace(/__INDEX__/g, index);

				container.append(newRowHtml);
				container.find('.chi-tiet-row:last .select-sach').select2({
					theme : "bootstrap4"
				});

				index++;
			}

			$('#them-chi-tiet-btn').on('click', function() {
				themDongMoi();
			});

			container.on('click', '.btn-xoa-chi-tiet', function() {
				$(this).closest('.chi-tiet-row').remove();
			});
			themDongMoi();
		});
	</script>
</body>
</html>