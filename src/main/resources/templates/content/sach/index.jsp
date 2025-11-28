<!DOCTYPE html>
<html layout:decorate="~{content/layout}">

<head>
	<title>Quản lý sách</title>
</head>

<body layout:fragment="content">

	<!-- breadcrumb area  -->
	<section class="bj_breadcrumb_area text-center banner_animation_03" data-bg-color="#f5f5f5">
		<div class="bg_one" data-bg-image="assets/img/breadcrumb/breadcrumb_banner_bg.png"></div>
		<div class="bd_shape one wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5">
			<img data-parallax='{"y": -50}' src="assets/img/breadcrumb/book_left1.png" alt="">
		</div>
		<div class="bd_shape two wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s">
			<img data-parallax='{"y": 30}' src="assets/img/breadcrumb/book-left2.png" alt="">
		</div>
		<div class="bd_shape three wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5">
			<img data-parallax='{"y": -50}' src="assets/img/breadcrumb/plane-1.png" alt="">
		</div>
		<div class="bd_shape four wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s">
			<img data-parallax='{"y": 30}' src="assets/img/breadcrumb/plan-3.png" alt="">
		</div>
		<div class="bd_shape five wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s">
			<img data-parallax='{"y": 80}' src="assets/img/breadcrumb/plan-2.png" alt="">
		</div>
		<div class="bd_shape six wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5">
			<img data-parallax='{"y": -60}' src="assets/img/breadcrumb/book-right.png" alt="">
		</div>
		<div class="bd_shape seven wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s">
			<img data-parallax='{"x": 50}' src="assets/img/breadcrumb/book-right2.png" alt="">
		</div>
		<div class="container">
			<h2 class="title wow fadeInUp" data-wow-delay="0.2s">Sách</h2>
			<ol class="breadcrumb justify-content-center wow fadeInUp" data-wow-delay="0.3s">
				<li><a href="/">Trang chủ</a></li>
				<li class="active">Sách</li>
			</ol>
		</div>
	</section>
	<!-- breadcrumb area  -->


	<!-- shop area  -->
	<section class="bj_shop_area sec_padding" data-bg-color="#f5f5f5">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop_sidebar">
						<div class="widget filter_widget">
							<h3 class="shop_sidebar_title">
								<a href="#"><img src="assets/img/shop/filter.svg" alt=""></a>Filter
							</h3>
						</div>
						<div class="widget shop_category_widget">
							<h4 class="shop_sidebar_title_small">
								<i class="icon-category-icon"></i>Thể loại
							</h4>
							<ul class="list-unstyled shop_category_list">
								<li><a th:href="@{/sach?tuKhoa={tK}&maTacGia={maTG}&maTheLoai=0(tK = ${tuKhoa}, maTG = ${maTacGia})}"
										th:class="${maTheLoai == 0 ? 'text-primary' : '' }">Tất cả</a></li>
								<li th:each="theLoai : ${theLoais}"><a
										th:href="@{/sach?tuKhoa={tuKhoa}&maTacGia={maTG}&maTheLoai={maTL}(tuKhoa = ${tuKhoa}, maTG= ${maTacGia}, maTL=${theLoai.maTheLoai})}"
										th:class="${maTheLoai == theLoai.maTheLoai ? 'text-primary' : '' }"
										th:text="${theLoai.tenTheLoai}">The loai</a></li>
							</ul>

						</div>
						<div class="widget author_widget">
							<h4 class="shop_sidebar_title_small">
								<i class="icon-pen"></i>Tác giả
							</h4>

							<ul class="list-unstyled shop_category_list">
								<li><a th:href="@{/sach?tuKhoa={tK}&maTacGia=0&maTheLoai={maTL}(tK = ${tuKhoa}, maTL = ${maTheLoai})}"
										th:class="${maTacGia == 0 ? 'text-primary' : '' }">Tất cả</a></li>
								<li th:each="tacGia : ${tacGias}"><a
										th:href="@{/sach?tuKhoa={tK}&maTacGia={maTG}&maTheLoai={maTL}(tK = ${tuKhoa}, maTL = ${maTheLoai}, maTG = ${tacGia.maTacGia})}"
										th:class="${maTacGia == tacGia.maTacGia ? 'text-primary' : '' }"
										th:text="${tacGia.tenTacGia}">Tac gia</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<form role="search" method="get" class="pr_search_form input-group" th:action="@{/sach}">
						<input type="text" name="tuKhoa" value="" class="form-control search-field" id="search"
							placeholder="Tìm sách" th:value="${tuKhoa}">
						<button type="submit">
							<i class="ti-search"></i>
						</button>
					</form>
					<div class="shop_top d-flex align-items-center justify-content-between">
						<div class="shop_menu_left" th:text="${'Tìm được ' + truyVan.totalElements + ' sách'}">500
							sach</div>
						<div class="shop_menu_right d-flex align-items-center justify-content-end">
							Sắp xếp theo:
							<div class="woocommerce-ordering" method="get">
								<select name="orderby" class="orderby selectpickers" id="selectOrder">
									<option value="ngayNhap_asc" th:selected="${sapXepTheo == 'ngayNhap_asc'}">Mới
										nhất</option>
									<option value="ngayNhap_desc" th:selected="${sapXepTheo == 'ngayNhap_desc'}">Cũ nhất
									</option>
									<option value="tenSach_asc" th:selected="${sapXepTheo == 'tenSach_asc'}">Tên từ A
										đến Z</option>
									<option value="tenSach_desc" th:selected="${sapXepTheo == 'tenSach_desc'}">Tên từ Z
										đến A</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-3 col-lg-4 col-sm-6 projects_item" th:each="sach : ${truyVan.content}">
							<div class="best_product_item best_product_item_two shop_product">
								<div class="img">
									<a th:href="@{/sach/{id}(id = ${sach.maSach})}"><img th:src="${sach.anhBia}"
											th:alt="${sach.tenSach}"></a>
									<div class="pr_ribbon">
										<span class="product-badge" th:if="${sach.isMoi()}">Sách
											mới</span>
										<div class="ratting">
											<!-- <img src="assets/img/star-1.png" alt="">4.9 -->
										</div>
									</div>
									<div class="hover_item">
										<a class="quick_button" href="my-wishlist.html" data-bs-toggle="tooltip"
											data-bs-placement="right" title="Wishlist"><i
												class="icon_heart_alt"></i></a> <span data-bs-toggle="tooltip"
											data-bs-placement="right" title="Quickview"><button class="quick_button"
												data-bs-toggle="modal" data-bs-target="#productQuickView">
												<i class="arrow_move"></i>
											</button></span> <a class="quick_button" href="#" data-bs-toggle="tooltip"
											data-bs-placement="right" title="Compare"><i
												class="ti-control-shuffle"></i></a>
									</div>
									<button type="button" class="bj_theme_btn add-to-cart-automated"
										data-name="A Storytelling Workbook" data-img="assets/img/author_book1.jpg"
										data-price="25" data-mrp="120">
										<i class="icon_cart_alt"></i>Mượn sách
									</button>
								</div>
								<div class="bj_new_pr_content">
									<a th:href="@{/sach/{id}(id = ${sach.maSach})}">
										<h4 class="bj_new_pr_title" th:text="${sach.tenSach}">ten
											sach</h4>
									</a>
									<div class="bj_pr_meta d-flex">
										<div class="book_price" th:text="${sach.moTa}">mota</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="text-center">
						<nav aria-label="...">
							<ul class="pagination pagi-content">
								<li class="page-item"><a class="page-link" href="#"><i
											class="ti-angle-left"></i>Trước</a></li>
								<li th:each="i : ${#numbers.sequence(1, truyVan.totalPages)}" class="page-item"
									aria-current="page" th:classappend="${truyVan.number + 1 == i? 'active' : ''}"><a
										class="page-link" th:text="${i}"
										th:href="@{/sach?tuKhoa={tK}&maTacGia={maTG}&maTheLoai={maTL}&sapXepTheo={sX}&trang={t}(tK = ${tuKhoa}, maTG = ${maTacGia}, maTL=${maTheLoai}, sX=${sapXepTheo}, t = ${i})}">1</a>
								</li>
								<li class="page-item"><a class="page-link">Sau<i class="ti-angle-right"></i></a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script th:inline="javascript" layout:fragment="scripts">
		document
			.addEventListener(
				'DOMContentLoaded',
				function () {
					const selectOrder = document
						.getElementById('selectOrder');
					$('#selectOrder')
						.on(
							'change',
							function () {
								let maTG = /*[[${maTacGia}]] */0;
								let maTL = /*[[${maTheLoai}]] */0;
								let tK = /*[[${tuKhoa}]] */'';
								let url = `/sach?tuKhoa=${tK}&maTheLoai=${maTL}&maTacGia=${maTG}&sapXepTheo=${selectOrder.value}`
								window.location.href = url;
							});
				});
	</script>
</body>

</html>