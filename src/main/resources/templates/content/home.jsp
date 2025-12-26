<html xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	layout:decorate="~{content/layout}">

<head>
	<meta charset="UTF-8">
	<title>Thư viện trực tuyến</title>
</head>

<body>
	<div layout:fragment="content">
		<section class="banner_area_three banner_animation_03" data-bg-color="#CDF0F0">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6">
						<div class="bj_banner_content_three">
							<h2 class="banner_title wow fadeInUp" data-wow-delay="0.2s">Thư
								viện trực tuyến - Mượn và Trả sách</h2>
							<p class="wow fadeInUp" data-wow-delay="0.3s">Hệ thống thư
								viện trực tuyến giúp bạn tìm, mượn và trả sách dễ dàng. Tìm kiếm
								nhanh, quản lý mượn trả thuận tiện.</p>
							<form action="#" class="search_form wow fadeInUp" data-wow-delay="0.4s"
								style="max-width: 700px; margin: 0 auto;">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Tìm sách theo tiêu đề, tác giả hoặc ISBN">
									<button type="submit" class="btn bj_theme_btn strock_btn"
										style="white-space:nowrap;">
										Tìm <i class="ti-search"></i>
									</button>
								</div>
							</form>

							<h5 class="wow fadeInUp" data-wow-delay="0.5s">Mượn 3 cuốn
								trở lên - có thể trở thành người đọc tiềm năng</h5>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="banner_shop_img">
							<img class="wow fadeInRight" data-wow-delay="0.3s"
								th:src="@{/assets/img/home-three/banner/shop-img.png}" alt="">
							<img class="round" data-parallax='{"x": -10, "y": -80}'
								th:src="@{/assets/img/home-three/banner/round.png}" alt="">
							<div class="women wow fadeInLeft" data-wow-delay="0.5s">
								<img data-parallax='{"x":-50, "y": -20}'
									th:src="@{/assets/img/home-three/banner/women-img.png}" alt="">
							</div>
						</div>
					</div>
				</div>


				<div class="borrow_return_panel mt-4 wow fadeInUp" data-wow-delay="0.6s">
					<div class="row justify-content-center">
						<div class="col-lg-10 col-md-11 col-sm-12"> <!-- nới rộng hơn -->
							<div class="card p-4 shadow-sm">
								<h4 class="mb-3">Giao diện mượn / trả sách</h4>

								<form action="#" class="row g-2 align-items-center">
									<!-- Ô nhập mã sách hoặc tiêu đề -->
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="Mã sách hoặc tiêu đề">
									</div>

									<!-- Chọn hành động -->
									<div class="col-md-2">
										<select class="form-control">
											<option value="borrow">Mượn</option>
											<option value="return">Trả</option>
										</select>
									</div>

									<!-- Mã người mượn -->
									<div class="col-md-4">
										<input type="text" class="form-control" placeholder="Mã người mượn (Tùy chọn)">
									</div>

									<!-- Nút xác nhận -->
									<div class="col-md-2 d-grid">
										<button type="submit" class="bj_theme_btn strock_btn"
											style="white-space:nowrap; padding: 10px 20px;">
											Xác nhận
										</button>
									</div>
								</form>

								<p class="mt-3 mb-0 text-muted text-center">
									Ghi chú: Hệ thống sẽ hướng dẫn quy trình mượn/trả sau khi xác nhận.
								</p>
							</div>
						</div>
					</div>
				</div>

		</section>
		<section class="product_introduce_area sec_padding" data-bg-color="#f5f5f5">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6">
						<img class="pr_intro_img wow fadeInLeft" data-wow-delay="0.2s"
							th:src="@{/assets/img/home-three/intro-books.png}" alt="">
					</div>
					<div class="col-lg-6">
						<div class="pr_introduce_content wow fadeInRight" data-wow-delay="0.4s">
							<h5>GIỚI THIỆU</h5>
							<h2 class="title">Đăng ký đơn giản cho mọi sách của bạn</h2>
							<p>Hầu hết sinh viên không có khả năng mua sách giáo khoa.
								Truy cập không giới hạn vào tài liệu học tập bất cứ khi nào bạn
								cần, với mức giá phù hợp. Chọn gói tháng linh hoạt hoặc tiết
								kiệm hơn với gói năm.</p>
							<div class="d-flex align-items-center">
								<a th:href="@{/}" class="bj_theme_btn">Mượn ngay</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="bj_best_book_area_two sec_padding">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-9">
						<div class="section_title wow fadeInLeft" data-wow-delay="0.2s">
							<h2 class="title">Sách được mượn nhiều nhất</h2>
						</div>
					</div>
					<div class="col-lg-3 text-end wow fadeInRight" data-wow-delay="0.3s">
						<a th:href="@{/sach}" class="bj_theme_btn_two style_two">Xem
							Tất cả <i class="arrow_right"></i>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-4 col-6" th:each="sach : ${sachMuonNhieus}">
						<div class="bj_best_book_item wow fadeInUp" data-wow-delay="0.2s">
							<div class="bj_book_img">
								<img th:src="${sach.anhBia}" alt="" width="180" height="250">
							</div>
							<div class="text">
								<a th:href="@{/sach/{id}(id=${sach.maSach})}">
									<h4 class="bj_new_pr_title" th:text="${sach.tenSach}">The Art of Fashion</h4>
								</a>
								<div class="bj_pr_meta">
									<strong>Nhà xuất bản:</strong>
									<div class="writer_name">
										<a th:href="@{/author-single}" th:text="${sach.nxb.tenNhaXuatBan}"></a>
									</div>
									<strong>Từng được mượn:</strong>
									<div class="writer_name">
										<div th:text="${sach.soLanMuon + ' lần'}"></div>
									</div>

								</div>
								<a th:href="@{/sach/{id}(id=${sach.maSach})}" class="bj_theme_btn strock_btn">Xem
									chi tiết</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="booklist_area sec_padding" data-bg-color="#f5f5f5">
			<div class="container">
				<div class="section_title text-center wow fadeInUp" data-wow-delay="0.2s">
					<h2 class="title">Mở rộng danh sách đọc của bạn</h2>
					<p>với hơn 100+ chủ đề và chuyên đề để khám phá</p>
				</div>
				<div class="row">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.2s">
							<img th:src="@{/assets/img/home-three/architecture.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Kiến trúc</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.3s">
							<img th:src="@{/assets/img/home-three/design.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Thiết kế</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.4s">
							<img th:src="@{/assets/img/home-three/bio.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Tiểu sử</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.5s">
							<img th:src="@{/assets/img/home-three/economics.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Kinh tế</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.6s">
							<img th:src="@{/assets/img/home-three/bag.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Doanh nhân</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.7s">
							<img th:src="@{/assets/img/home-three/education.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Giáo dục</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.8s">
							<img th:src="@{/assets/img/home-three/art.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Nghệ thuật</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="booklist_item wow fadeInUp" data-wow-delay="0.9s">
							<img th:src="@{/assets/img/home-three/history.png}" alt="">
							<div class="text">
								<a th:href="@{/shop-sidebar}">
									<h5>Lịch sử</h5>
								</a>
								<p>512 sách</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="best_selling_pr_area sec_padding" data-bg-color="#fff">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-7">
						<div class="section_title wow fadeInLeft">
							<h2 class="title">Lựa chọn của bạn đọc</h2>
							<p>Những cuốn sách mới nhất vừa có tại thư viện của chúng
								tôi.</p>
						</div>
					</div>
					<div class="col-lg-5">
						<ul class="nav nav-pills best_pr_tab_btn d-flex justify-content-end wow fadeInRight"
							data-wow-delay="0.2s" id="pills-tab" role="tablist">
							<li role="presentation" class="nav-item"><a class="nav-link active" id="pills-best-tab"
									data-bs-toggle="pill" data-bs-target="#pills-best" role="tab"
									aria-controls="pills-best" aria-selected="true">Có thể bạn chưa biết</a></li>
							<li role="presentation" class="nav-item"><a class="nav-link" id="pills-offer-tab"
									data-bs-toggle="pill" data-bs-target="#pills-offer" role="tab"
									aria-controls="pills-offer" aria-selected="false">Đánh giá cao</a></li>
							<li role="presentation" class="nav-item"><a class="nav-link" id="pills-featured-tab"
									data-bs-toggle="pill" data-bs-target="#pills-featured" role="tab"
									aria-controls="pills-featured" aria-selected="false">Mới
									nhất</a></li>
						</ul>
					</div>
				</div>
				<div class="tab-content wow fadeInUp" id="pills-tabContent">
					<div class="tab-pane fade explore-menu show active" id="pills-best" role="tabpanel"
						aria-labelledby="pills-best-tab">
						<div class="row gx-xl-5">
							<div class="col-lg-3 col-md-4 col-sm-6" th:each="sach : ${sachMuonIts}">
								<div class="best_product_item best_product_item_two box-shadow">
									<div class="img">
										<a th:href="@{/sach/{id}(id=${sach.maSach})}"><img th:src="${sach.anhBia}"
												th:alt="${sach.tenSach}"></a>
										<div class="hover_item">
											<form th:action="@{/yeuthich}" method="post">
												<input type="hidden" name="idSach" th:value="${sach.maSach}">
												<button type="submit" class="quick_button" data-bs-toggle="tooltip"
													data-bs-placement="right" title="Yêu thích"><i
														th:style="${sach.daThich == true ? 'color: red' : ''}"
														class="icon_heart_alt"></i></button>
											</form>
											<span data-bs-toggle="tooltip" data-bs-placement="right"
												title="Quickview"><button class="quick_button" data-bs-toggle="modal"
													data-bs-target="#productQuickView">
													<i class="arrow_move"></i>
												</button>
											</span> <a class="quick_button" href="#" data-bs-toggle="tooltip"
												data-bs-placement="right" title="Compare"><i
													class="ti-control-shuffle"></i></a>
										</div>
										<button type="button" class="bj_theme_btn add-to-cart-automated"
											data-name="Enemy – Jake Gyllenhaal"
											data-img="assets/img/home-two/choice1.png" data-price="25">
											<i class="icon_cart_alt"></i>Thêm vào danh sách mượn
										</button>
									</div>
									<div class="bj_new_pr_content">
										<a th:href="@{/sach/{id}(id=${sach.maSach})}">
											<h4 class="bj_new_pr_title" th:text="${sach.tenSach}"></h4>
										</a>
										<div class="writer_name">
											Nhà xuất bản: <a th:href="@{/sach}" th:text="${sach.nxb.tenNhaXuatBan}"></a>
										</div>
										<div class="bj_pr_meta d-flex">
											<div class="book_price">$25</div>
											<div class="ratting">
												<img th:src="@{/assets/img/home/raiting.png}" alt="">
												1221
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade explore-menu" id="pills-offer" role="tabpanel"
						aria-labelledby="pills-best-tab">
						<div class="row gx-xl-5">

							<div class="col-lg-3 col-md-4 col-sm-6">
								<div class="best_product_item best_product_item_two box-shadow">
									<div class="img">
										<a th:href="@{/product-single}"><img
												th:src="@{/assets/img/home-two/choice4.jpg}" alt="book"></a>
										<div class="hover_item">
											<a class="quick_button" th:href="@{/my-wishlist}" data-bs-toggle="tooltip"
												data-bs-placement="right" title="Wishlist"><i
													class="icon_heart_alt"></i></a> <span data-bs-toggle="tooltip"
												data-bs-placement="right" title="Quickview"><button class="quick_button"
													data-bs-toggle="modal" data-bs-target="#productQuickView">
													<i class="arrow_move"></i>
												</button></span> <a class="quick_button" href="#"
												data-bs-toggle="tooltip" data-bs-placement="right" title="Compare"><i
													class="ti-control-shuffle"></i></a>
										</div>
										<button type="button" class="bj_theme_btn add-to-cart-automated"
											data-name="Create Your Own Bustiness"
											data-img="assets/img/home-two/choice4.jpg" data-price="25">
											<i class="icon_cart_alt"></i>Thêm vào danh sách mượn
										</button>
									</div>
									<div class="bj_new_pr_content">
										<a th:href="@{/product-single}">
											<h4 class="bj_new_pr_title">Create Your Own Bustiness</h4>
										</a>
										<div class="writer_name">
											By -<a th:href="@{/author-single}"> Muaz Bk </a>
										</div>
										<div class="bj_pr_meta d-flex">
											<div class="book_price">$25</div>
											<div class="ratting">
												<img th:src="@{/assets/img/home/raiting.png}" alt="">
												1221
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-6">
								<div class="best_product_item best_product_item_two box-shadow">
									<div class="img">
										<a th:href="@{/product-single}"><img
												th:src="@{/assets/img/home-two/choice1.png}" alt="book"></a>
										<div class="hover_item">
											<a class="quick_button" th:href="@{/my-wishlist}" data-bs-toggle="tooltip"
												data-bs-placement="right" title="Wishlist"><i
													class="icon_heart_alt"></i></a> <span data-bs-toggle="tooltip"
												data-bs-placement="right" title="Quickview"><button class="quick_button"
													data-bs-toggle="modal" data-bs-target="#productQuickView">
													<i class="arrow_move"></i>
												</button></span> <a class="quick_button" href="#"
												data-bs-toggle="tooltip" data-bs-placement="right" title="Compare"><i
													class="ti-control-shuffle"></i></a>
										</div>
										<button type="button" class="bj_theme_btn add-to-cart-automated"
											data-name="Enemy – Jake Gyllenhaal"
											data-img="assets/img/home-two/choice1.png" data-price="25">
											<i class="icon_cart_alt"></i>Thêm vào danh sách mượn
										</button>
									</div>
									<div class="bj_new_pr_content">
										<a th:href="@{/product-single}">
											<h4 class="bj_new_pr_title">Enemy – Jake Gyllenhaal</h4>
										</a>
										<div class="writer_name">
											By -<a th:href="@{/author-single}"> Muaz Bk </a>
										</div>
										<div class="bj_pr_meta d-flex">
											<div class="book_price">$25</div>
											<div class="ratting">
												<img th:src="@{/assets/img/home/raiting.png}" alt="">
												1221
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-3 col-md-4 col-sm-6">
								<div class="best_product_item best_product_item_two box-shadow">
									<div class="img">
										<a th:href="@{/product-single}"><img
												th:src="@{/assets/img/home-two/choice2.png}" alt="book"></a>
										<div class="hover_item">
											<a class="quick_button" th:href="@{/my-wishlist}" data-bs-toggle="tooltip"
												data-bs-placement="right" title="Wishlist"><i
													class="icon_heart_alt"></i></a> <span data-bs-toggle="tooltip"
												data-bs-placement="right" title="Quickview"><button class="quick_button"
													data-bs-toggle="modal" data-bs-target="#productQuickView">
													<i class="arrow_move"></i>
												</button></span> <a class="quick_button" href="#"
												data-bs-toggle="tooltip" data-bs-placement="right" title="Compare"><i
													class="ti-control-shuffle"></i></a>
										</div>
										<button type="button" class="bj_theme_btn add-to-cart-automated"
											data-name="Knowledge of eart" data-img="assets/img/home-two/choice2.png"
											data-price="25">
											<i class="icon_cart_alt"></i>Thêm vào danh sách mượn
										</button>
									</div>
									<div class="bj_new_pr_content">
										<a th:href="@{/product-single}">
											<h4 class="bj_new_pr_title">Knowledge of eart</h4>
										</a>
										<div class="writer_name">
											By -<a th:href="@{/author-single}"> Muaz Bk </a>
										</div>
										<div class="bj_pr_meta d-flex">
											<div class="book_price">$25</div>
											<div class="ratting">
												<img th:src="@{/assets/img/home/raiting.png}" alt="">
												1221
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-3 col-md-4 col-sm-6">
								<div class="best_product_item best_product_item_two box-shadow">
									<div class="img">
										<a th:href="@{/product-single}"><img
												th:src="@{/assets/img/home-two/choice3.jpg}" alt="book"></a>
										<div class="hover_item">
											<a class="quick_button" th:href="@{/my-wishlist}" data-bs-toggle="tooltip"
												data-bs-placement="right" title="Wishlist"><i
													class="icon_heart_alt"></i></a> <span data-bs-toggle="tooltip"
												data-bs-placement="right" title="Quickview"><button class="quick_button"
													data-bs-toggle="modal" data-bs-target="#productQuickView">
													<i class="arrow_move"></i>
												</button></span> <a class="quick_button" href="#"
												data-bs-toggle="tooltip" data-bs-placement="right" title="Compare"><i
													class="ti-control-shuffle"></i></a>
										</div>
										<button type="button" class="bj_theme_btn add-to-cart-automated"
											data-name="Book Cover Mockup" data-img="assets/img/home-two/choice3.jpg"
											data-price="35">
											<i class="icon_cart_alt"></i>Thêm vào danh sách mượn
										</button>
									</div>
									<div class="bj_new_pr_content">
										<a th:href="@{/product-single}">
											<h4 class="bj_new_pr_title">Book Cover Mockup</h4>
										</a>
										<div class="writer_name">
											By -<a th:href="@{/author-single}"> Muaz Bk </a>
										</div>
										<div class="bj_pr_meta d-flex">
											<div class="book_price">$35</div>
											<div class="ratting">
												<img th:src="@{/assets/img/home/raiting.png}" alt="">
												1220
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-3 col-md-4 col-sm-6">
								<div class="best_product_item best_product_item_two box-shadow">
									<div class="img">
										<a th:href="@{/product-single}"><img
												th:src="@{/assets/img/home-two/choice4.jpg}" alt="book"></a>
										<div class="hover_item">
											<a class="quick_button" th:href="@{/my-wishlist}" data-bs-toggle="tooltip"
												data-bs-placement="right" title="Wishlist"><i
													class="icon_heart_alt"></i></a> <span data-bs-toggle="tooltip"
												data-bs-placement="right" title="Quickview"><button class="quick_button"
													data-bs-toggle="modal" data-bs-target="#productQuickView">
													<i class="arrow_move"></i>
												</button></span> <a class="quick_button" href="#"
												data-bs-toggle="tooltip" data-bs-placement="right" title="Compare"><i
													class="ti-control-shuffle"></i></a>
										</div>
										<button type="button" class="bj_theme_btn add-to-cart-automated"
											data-name="Create Your Own Bustiness"
											data-img="assets/img/home-two/choice4.jpg" data-price="25">
											<i class="icon_cart_alt"></i>Thêm vào danh sách mượn
										</button>
									</div>
									<div class="bj_new_pr_content">
										<a th:href="@{/product-single}">
											<h4 class="bj_new_pr_title">Create Your Own Bustiness</h4>
										</a>
										<div class="writer_name">
											By -<a th:href="@{/author-single}"> Muaz Bk </a>
										</div>
										<div class="bj_pr_meta d-flex">
											<div class="book_price">$25</div>
											<div class="ratting">
												<img th:src="@{/assets/img/home/raiting.png}" alt="">
												1221
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade explore-menu" id="pills-featured" role="tabpanel"
						aria-labelledby="pills-best-tab">
						<div class="row gx-xl-5">

							<div class="col-lg-3 col-md-4 col-sm-6" th:each="sach : ${sachMois}">
								<div class="best_product_item best_product_item_two box-shadow">
									<div class="img">
										<a th:href="@{/sach/{id}(id=${sach.maSach})}"><img th:src="${sach.anhBia}"
												th:alt="${sach.tenSach}"></a>
										<div class="hover_item">
											<form th:action="@{/yeuthich}" method="post">
												<input type="hidden" name="idSach" th:value="${sach.maSach}">
												<button type="submit" class="quick_button" data-bs-toggle="tooltip"
													data-bs-placement="right" title="Yêu thích"><i
														th:style="${sach.daThich == true ? 'color: red' : ''}"
														class="icon_heart_alt"></i></button>
											</form>
											<span data-bs-toggle="tooltip" data-bs-placement="right"
												title="Quickview"><button class="quick_button" data-bs-toggle="modal"
													data-bs-target="#productQuickView">
													<i class="arrow_move"></i>
												</button></span> <a class="quick_button" href="#"
												data-bs-toggle="tooltip" data-bs-placement="right" title="Compare"><i
													class="ti-control-shuffle"></i></a>
										</div>
										<button type="button" class="bj_theme_btn add-to-cart-automated"
											data-name="Book Cover" data-img="assets/img/home-two/choice2.png"
											data-price="25">
											<i class="icon_cart_alt"></i>Thêm vào danh sách mượn
										</button>
									</div>
									<div class="bj_new_pr_content">
										<a th:href="@{/sach/{id}(id=${sach.maSach})}">
											<h4 class="bj_new_pr_title" th:text="${sach.tenSach}">title</h4>
										</a>
										<div class="writer_name">
											Nhà xuất bản: <a th:href="@{/sach}" th:text="${sach.nxb.tenNhaXuatBan}"></a>
										</div>
										<div class="bj_pr_meta d-flex">
											<div class="book_price">$25</div>
											<div class="ratting">
												<img th:src="@{/assets/img/home/raiting.png}" alt="">
												1221
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="text-center mt-5">
					<a th:href="@{/shop}" class="bj_theme_btn strock_btn wow fadeInUp" data-wow-delay="0.4s">Xem thêm <i
							class="arrow_right"></i></a>
				</div>
			</div>
		</section>

		<section class="shortlist_product_promo_area" data-bg-color="#cdf0f080">
			<img class="bg_top wow fadeInDown" data-wow-delay="0.4s"
				th:src="@{/assets/img/home-three/short-list-bg-shap.png}" alt="">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-6">
						<h2 class="title wow fadeInLeft" data-wow-delay="0.2s">Các
							loại sách nước ngoài.</h2>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="shortlist_book">
							<div class="round wow zoomIn" data-wow-delay="0.2s"></div>
							<img class="wow fadeInRight" data-wow-delay="0.4s"
								th:src="@{/assets/img/home-three/short-list-book.png}" alt="">
						</div>
					</div>
				</div>
			</div>
		</section>


		<section class="bj_home_blog_area sec_padding pt-0" data-bg-color="#f5f5f5">
			<div class="container">
				<div class="section_title text-center wow fadeInUp" data-wow-delay="0.2s">
					<h2 class="title">Bài viết &amp; Mẹo</h2>
					<p>Duyệt các bài viết và mẹo mới nhất từ blog của chúng tôi.</p>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="bj_blog_grid_item wow fadeInUp" data-wow-delay="0.3s">
							<div class="bj_blog_img">
								<a href="#"><img class="img-fluid" th:src="@{/assets/img/home-two/blog_img1.jpg}"
										alt=""></a> <a href="#" class="blog_category">Book Journeys</a>
							</div>
							<a th:href="@{/blog-details}">
								<h3 class="blog_title">Uncover Your Next Great Read: A
									Journey Through BookJar</h3>
							</a>
							<div class="blog_meta">
								<div class="post_author">
									<img th:src="@{/assets/img/home-two/author1.jpg}" alt="">
									<a th:href="@{/author-single}">Talan Torff</a>
								</div>
								<div class="post_date">
									<i class="icon_calendar"></i>Nov 08, 2024
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="bj_blog_grid_item wow fadeInUp" data-wow-delay="0.4s">
							<div class="bj_blog_img">
								<a href="#"><img class="img-fluid" th:src="@{/assets/img/home-two/blog_img2.jpg}"
										alt=""></a> <a href="#" class="blog_category">Stories Uncovered</a>
							</div>
							<a th:href="@{/blog-details}">
								<h3 class="blog_title">Beyond the Pages: Discover the Magic
									Inside BookJar</h3>
							</a>
							<div class="blog_meta">
								<div class="post_author">
									<img th:src="@{/assets/img/home-two/author1.jpg}" alt="">
									<a th:href="@{/author-single}">Muaz Bk</a>
								</div>
								<div class="post_date">
									<i class="icon_calendar"></i>Nov 08, 2024
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="bj_blog_grid_item wow fadeInUp" data-wow-delay="0.5s">
							<div class="bj_blog_img">
								<a href="#"><img class="img-fluid" th:src="@{/assets/img/home-two/blog_img3.jpg}"
										alt=""></a> <a href="#" class="blog_category">Reader's Haven</a>
							</div>
							<a th:href="@{/blog-details}">
								<h3 class="blog_title">Stories Await: Dive into a World of
									Books at BookJar</h3>
							</a>
							<div class="blog_meta">
								<div class="post_author">
									<img th:src="@{/assets/img/home-two/author1.jpg}" alt="">
									<a th:href="@{/author-single}">Jason Moe</a>
								</div>
								<div class="post_date">
									<i class="icon_calendar"></i>Nov 08, 2024
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<script>
			// Khi form mượn/trả được submit, hiển thị xác nhận tạm thời trong giao diện
			document
				.addEventListener(
					'DOMContentLoaded',
					function () {
						var form = document
							.querySelector('.borrow_return_panel form');
						if (form) {
							form
								.addEventListener(
									'submit',
									function (e) {
										e.preventDefault();
										var code = form
											.querySelector('input[placeholder="Mã sách hoặc tiêu đề"]').value
											.trim();
										var action = form
											.querySelector('select').value;
										var user = form
											.querySelector('input[placeholder^="Mã người"]').value
											.trim();
										var card = form
											.closest('.card');
										if (!code) {
											alert('Vui lòng nhập mã sách hoặc tiêu đề.');
											return;
										}
										// Hiển thị thông báo xác nhận (thay bằng gọi API ở backend)
										card.innerHTML = '<div class="p-3"><h5>Yêu cầu đã được gửi</h5><p>Hành động: '
											+ (action == 'borrow' ? 'Mượn'
												: 'Trả')
											+ '<br>Sách: '
											+ code
											+ '<br>Người mượn: '
											+ (user || 'Không cung cấp')
											+ '</p><p class="text-muted">Hệ thống sẽ xử lý và thông báo trạng thái.</p><a href="javascript:location.reload()" class="bj_theme_btn strock_btn">Quay lại</a></div>';
									});
						}
					});
		</script>
	</div>
</body>

</html>