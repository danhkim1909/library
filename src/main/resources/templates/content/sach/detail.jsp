<!DOCTYPE html>
<html layout:decorate="~{content/layout}">

<head>
<meta charset="UTF-8">
<title th:text="${sach.tenSach}">TieuDe</title>
</head>

<body layout:fragment="content">

	<!-- breadcrumb area  -->
	<section class="bj_breadcrumb_area text-center banner_animation_03"
		data-bg-color="#f5f5f5">
		<div class="bg_one"
			th:attr="data-bg-image=@{/assets/img/breadcrumb/breadcrumb_banner_bg.png}"></div>
		<div class="bd_shape one wow fadeInDown layer" data-wow-delay="0.3s"
			data-depth="0.5">
			<img data-parallax='{"y": -50}'
				th:src="@{/assets/img/breadcrumb/book_left1.png}" alt="">
		</div>
		<div class="bd_shape two wow fadeInUp layer" data-depth="0.6"
			data-wow-delay="0.4s">
			<img data-parallax='{"y": 30}'
				th:src="@{/assets/img/breadcrumb/book-left2.png}" alt="">
		</div>
		<div class="bd_shape three wow fadeInDown layer" data-wow-delay="0.3s"
			data-depth="0.5">
			<img data-parallax='{"y": -50}'
				th:src="@{/assets/img/breadcrumb/plane-1.png}" alt="">
		</div>
		<div class="bd_shape four wow fadeInUp layer" data-depth="0.6"
			data-wow-delay="0.4s">
			<img data-parallax='{"y": 30}'
				th:src="@{/assets/img/breadcrumb/plan-3.png}" alt="">
		</div>
		<div class="bd_shape five wow fadeInUp layer" data-depth="0.6"
			data-wow-delay="0.4s">
			<img data-parallax='{"y": 80}'
				th:src="@{/assets/img/breadcrumb/plan-2.png}" alt="">
		</div>
		<div class="bd_shape six wow fadeInDown layer" data-wow-delay="0.3s"
			data-depth="0.5">
			<img data-parallax='{"y": -60}'
				th:src="@{/assets/img/breadcrumb/book-right.png}" alt="">
		</div>
		<div class="bd_shape seven wow fadeInUp layer" data-depth="0.6"
			data-wow-delay="0.4s">
			<img data-parallax='{"x": 50}'
				th:src="@{/assets/img/breadcrumb/book-right2.png}" alt="">
		</div>
		<div class="container">
			<h2 class="title wow fadeInUp" data-wow-delay="0.2s"
				th:text="${sach.tenSach}">tensach</h2>
			<ol class="breadcrumb justify-content-center wow fadeInUp"
				data-wow-delay="0.3s">
				<li><a th:href="@{/}">Home</a></li>
				<li><a th:href="@{/sach}">Sách</a></li>
				<li class="active" th:text="${sach.tenSach}">Shop Single</li>
			</ol>
		</div>
	</section>
	<!-- breadcrumb area  -->
	<section class="product_details_area sec_padding"
		data-bg-color="#f5f5f5">
		<div class="container">
			<div class="row gy-xl-0 gy-3">
				<div class="col-xl-9">
					<div class="bj_book_single me-xl-3">
						<div class="bj_book_img flip">
							<div class="front">
								<img class="img-fluid" th:src="@{/assets/img/book-single1.jpg}"
									alt="">
							</div>
							<div class="back">
								<img class="img-fluid" th:src="@{/assets/img/book-single.jpg}"
									alt="">
							</div>
							<div class="pr_ribbon" th:if="${sach.isMoi}">
								<span class="product-badge">Sách mới</span>
							</div>
						</div>
						<div class="bj_book_details">
							<h2 th:text="${sach.tenSach}">A Storytelling Workbook</h2>
							<div class="ratting review">
								<div class="star-rating">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star-half-stroke"></i> <span>4.5</span>
								</div>
								<a href="#product_review" class="woocommerce-review-link"> <span
									class="count"> 50 </span>Reviews
								</a>
							</div>
							<ul class="product_meta list-unstyled">
								<li><span>Tác giả:</span>
									<p th:each="tacGia, i : ${sach.tacGias}"
										th:text="${i.count == 1 ? tacGia.tenTacGia : ', ' + tacGia.tenTacGia}"></p></li>
								<li><span>Thể loại:</span>
									<p th:each="theLoai, i : ${sach.theLoais}"
										th:text="${i.count == 1 ? theLoai.tenTheLoai : ', ' + theLoai.tenTheLoai}"></p></li>
								<li><span>Nhà xuất bản: </span>
									<p th:text="${sach.nxb.tenNhaXuatBan}">nxb</p></li>

								<li><span>Năm xuất bản: </span>
									<p th:text="${sach.namXuatBan}"></p></li>
							</ul>
						</div>
					</div>
					<div class="bj_book_single_tab_area me-xl-3">
						<ul class="nav nav-tabs bj_book_single_tab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="product_description-tab"
									data-bs-toggle="tab" data-bs-target="#product_description"
									type="button" role="tab" aria-controls="product_description"
									aria-selected="true">Mô tả</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="product_aurhor_desc-tab"
									data-bs-toggle="tab" data-bs-target="#product_aurhor_desc"
									type="button" role="tab" aria-controls="product_aurhor_desc"
									aria-selected="false">Về tác giả</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="product_review-tab"
									data-bs-toggle="tab" data-bs-target="#product_review"
									type="button" role="tab" aria-controls="product_review"
									aria-selected="false">Đánh giá</button>
							</li>
						</ul>
						<div class="tab-content bj_book_single_tab_content mt-4">
							<div class="tab-pane fade show active" id="product_description"
								role="tabpanel" aria-labelledby="product_description-tab">
								<div class="product_book_content_details">
									<div>
										<h5 class="content_header mb-2">Mô tả</h5>
										<p class="content_text mb-2" th:utext="${sach.moTa}">Python
											Machine Learning, Third Edition is a comprehensive guide to
											machine learning and deep learning with Python. It acts as
											both a step-by-step tutorial, and a reference you'll keep
											coming back to as you build your machine learning systems.
											Packed with clear.</p>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="product_aurhor_desc"
								role="tabpanel" aria-labelledby="product_aurhor_desc-tab">
								<div class="tab_slider_content">
									<div class="bj_author_single d-flex align-items-center">
										<img th:src="@{/assets/img/home/author.jpg}" alt="">
										<div class="bj_author_single_content">
											<h2>Phillip Siphron</h2>
											<p>Diam, urna, ornare leo facilisis suspendisse eu rutrum
												id augue cursus tincidunt nisl eget ornare pharetra ac
												pharetra, pulvinar ipsum.</p>
											<ul class="book_info">
												<li><span>Position:</span> Book Writer</li>
												<li><span>Book Count:</span>23</li>
												<li><span>Born:</span>1973</li>
												<li><span>Category:</span><a href="#">Biography,</a><a
													href="#">Fantasy,</a><a href="#">Sci-Fi</a></li>
												<li><span>Language:</span><a href="#">English,</a><a
													href="#">German</a></li>
											</ul>
											<ul class="list-unstyled f_social_round">
												<li><a href="#"><i class="fa-brands fa-facebook-f"></i></a></li>
												<li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
												<li><a href="#"><i class="fa-brands fa-reddit"></i></a>
												</li>
												<li><a href="#"><i class="fa-brands fa-quora"></i></a>
												</li>
											</ul>
											<a href="author-single.html" class="bj_theme_btn text_btn">More
												Details<i class="arrow_right"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="product_review" role="tabpanel"
								aria-labelledby="product_review-tab">
								<div class="reviews-item " id="scrollspyReviews">
									<div
										class="d-flex flex-wrap justify-content-between mb-40 gap-3">
										<h4 class="review-title d-flex flex-wrap">
											50 Reviews <span><i class="fas fa-star"></i><i
												class="fas fa-star"></i><i class="fas fa-star"></i><i
												class="fas fa-star"></i><i class="fas fa-star"></i> 4.9</span>
										</h4>
										<div>
											<!-- Button trigger modal -->
											<button type="button" class="modal-btn"
												data-bs-toggle="modal" data-bs-target="#exampleModal">
												<i class="fas fa-edit"></i>Write a Review
											</button>

											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog  modal-dialog-centered">
													<div class="modal-content modal-item">
														<div class="modal-header border-0 p-0">
															<h4 class="modal-title mb-50" id="exampleModalLabel">
																Hello Jason</h4>
															<button type="button" class="close-btn"
																data-bs-dismiss="modal" aria-label="Close">
																<i class="icon_close"></i>
															</button>
														</div>
														<div class="d-flex admin-content">
															<div class="user-img">
																<img th:src="@{/assets/img/profile-img.png}" alt="Admin">
															</div>
															<div>
																<p class="admin-title">Corey Baptista</p>
																<p class="admin-sub-title">Posting publicly</p>
															</div>
														</div>
														<div class="star-icon">
															<div class="dynamic-star-rating">
																<i class="fas fa-star"></i> <i class="fas fa-star"></i>
																<i class="fas fa-star"></i> <i class="fas fa-star"></i>
																<i class="fas fa-star"></i>

															</div>
															<input type="hidden" name="rating"
																class="dynamic-star-rating-input" value="0">
															<textarea
																class="admin-text form-control dynamic-rating-text"
																placeholder="Share details of your own experience at this place"
																cols="30" rows="5"></textarea>
														</div>
														<div class="admin-galley">
															<label for="formAdminImgFile"> <i
																class="fas fa-image"></i>
															</label> <input class="d-none" id="formAdminImgFile" type="file">
														</div>
														<div class="modal-footer border-0">
															<button type="button" class="cancel-btn"
																data-bs-dismiss="modal">Cancel</button>
															<button type="button" class="post-btn">Post</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row gy-lg-0 gy-3">
										<div class="col-lg-5">
											<div class="your-rating-review">
												<h5>Your rating & review</h5>
												<div class="rating">
													<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i>

												</div>
												<p class="review">Good book, I understood many important
													theories from the book.</p>
												<button type="button"
													class="bj_theme_btn strock_btn btn_small_two"
													data-bs-toggle="modal" data-bs-target="#editReviewModal">Update
													Your Review</button>

												<!-- Modal -->
												<div class="modal fade" id="editReviewModal" tabindex="-1"
													aria-labelledby="editReviewModalLabel" aria-hidden="true">
													<div class="modal-dialog  modal-dialog-centered">
														<div class="modal-content modal-item">
															<div class="modal-header border-0 p-0">
																<h4 class="modal-title mb-50" id="editReviewModalLabel">
																	Hello Jason</h4>
																<button type="button" class="close-btn"
																	data-bs-dismiss="modal" aria-label="Close">
																	<i class="icon_close"></i>
																</button>
															</div>
															<div class="d-flex admin-content">
																<div class="user-img">
																	<img th:src="@{/assets/img/profile-img.png}"
																		alt="Admin">
																</div>
																<div>
																	<p class="admin-title">Corey Baptista</p>
																	<p class="admin-sub-title">Posting publicly</p>
																</div>
															</div>
															<div class="star-icon">
																<div class="dynamic-star-rating">
																	<i class="fas fa-star active"></i> <i
																		class="fas fa-star active"></i> <i
																		class="fas fa-star active"></i> <i
																		class="fas fa-star active"></i> <i
																		class="fas fa-star active"></i>

																</div>
																<input type="hidden" name="rating"
																	class="dynamic-star-rating-input" value="0">
																<textarea
																	class="admin-text form-control dynamic-rating-text"
																	placeholder="Share details of your own experience at this place"
																	cols="30" rows="5">Good book, I understood many important theories from the book.</textarea>
															</div>
															<div class="admin-galley">
																<div class="gallery-item">
																	<button class="delete-btn">
																		<i class="fa-regular fa-trash-can"></i>
																	</button>
																	<img th:src="@{/assets/img/shop/best_book1.jpg}" alt="">
																</div>

																<label for="formAdminImgFile2"> <i
																	class="fas fa-image"></i>
																</label> <input class="d-none" id="formAdminImgFile2"
																	type="file">
															</div>
															<div class="modal-footer border-0">
																<button type="button" class="cancel-btn"
																	data-bs-dismiss="modal">Cancel</button>
																<button type="button" class="post-btn">Update</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-7">
											<ul class="reviews-box list-unstyled">
												<li class="d-flex">5 Stars <span><span></span></span>
													(35)
												</li>
												<li>4 Stars <span><span></span></span> (10)
												</li>
												<li>3 Stars <span><span></span></span> (3)
												</li>
												<li>2 Stars <span><span></span></span> (2)
												</li>
												<li>1 Stars <span><span></span></span> (0)
												</li>
											</ul>
										</div>

									</div>
									<div class="review-content">
										<div
											class="d-flex flex-sm-row flex-column justify-content-between gap-3 mb-40">
											<h4>Reviews</h4>
											<div class="review-right">
												<div class="sorting-select review-sort selectpickers">
													<select id="sort-select">
														<option value="SortBy Newest" selected>Relevent</option>
														<option value="SortBy Oldest">Newest</option>
														<option value="SortBy Popular">Oldest</option>
													</select>
												</div>
											</div>
										</div>
										<div class="d-md-flex">
											<div>
												<img class="admin-img"
													th:src="@{/assets/img/profile-img.png}" alt="Admin">
											</div>
											<div class="review-text">
												<p class="r-title sub-regular-2">Muaz Bin</p>
												<div class="r-icon">
													<div>
														<i class="fas fa-star"></i><i class="fas fa-star"></i><i
															class="fas fa-star"></i><i class="fas fa-star"></i><i
															class="fas fa-star"></i> 5
													</div>
													<span>⋅ Nov 5, 2021</span>
												</div>
												<p class="small-2">A Storytelling Workbook is a gem for
													anyone looking to enhance their narrative skills! The
													exercises are engaging and practical, making it easy to
													dive into storytelling with confidence. A must-have for
													aspiring writers!</p>
											</div>
										</div>
									</div>
									<div class="d-md-flex">
										<div>
											<img class="admin-img"
												th:src="@{/assets/img/profile-img.png}" alt="Admin">
										</div>
										<div class="review-text">
											<p class="r-title sub-regular-2">Ryan Aminoff</p>
											<div class="r-icon">
												<div>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i> 5
												</div>
												<span>⋅ Nov 5, 2021</span>
											</div>
											<p class="small-2 mb-30">A Storytelling Workbook is a
												fantastic resource for honing storytelling skills! It's
												packed with creative exercises that spark inspiration and
												help build strong narrative techniques. Highly recommended
												for writers at any level!</p>
											<div class="d-flex flex-wrap review-img">
												<a data-fancybox="gallery"
													th:href="@{/assets/img/shop/best_book1.jpg}"><img
													th:src="@{/assets/img/shop/best_book1.jpg}" alt="Image"></a>
												<a data-fancybox="gallery"
													th:href="@{/assets/img/shop/best_book2.jpg}"><img
													th:src="@{/assets/img/shop/best_book2.jpg}" alt="Image"></a>
												<a data-fancybox="gallery"
													th:href="@{/assets/img/shop/best_book3.jpg}"><img
													th:src="@{/assets/img/shop/best_book3.jpg}" alt="Image"></a>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3">
					<form th:action="@{/muonsach/{id}(id = ${sach.maSach})}" th:object="${muonSach}"  class="product_sidbar" method="post">
						<div class="price_head">
							Đang còn: <span class="price" th:text="${sach.kho != null ? sach.kho.soLuong : '0'}"></span> quyển
						</div>

						<div class="product-qty">
							Số quyển
							<div class="cart_quantity">
								<button class="quantity_btn minus" type="button">
									<i class="icon_minus-06"></i>
								</button>
								<input type="number" min="1" max="3" step="1" th:field="*{soLuong}">
								<button class="quantity_btn plus" type="button">
									<i class="icon_plus"></i>
								</button>
							</div>
						</div>

						<div class="d-flex flex-column gap-3">
							<button type="submit" href="checkout.html" class="bj_theme_btn"> Mượn ngay</button>
						</div>
						<div th:if="${#fields.hasErrors('soLuong')}" th:errors="*{soLuong}" class="text-danger"></div>
					</form>

					<div class="product_details_sidebar">
						<a class="details_header" data-bs-toggle="collapse"
							href="#product_details_collapse" role="button"
							aria-expanded="false" aria-controls="product_details_collapse">
							<h6 class="mb-0">Product Details</h6> <i
							class="fa-solid fa-chevron-up"></i>
						</a>
						<div class="collapse show" id="product_details_collapse">
							<div class="product_details_section_wrap">
								<div class="product_details_section_content mb-3 mt-3">
									<span class="product_details_section_key">Publication
										date :</span> <span class="product_details_section_value">Dec
										12, 2019</span>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Length</span> <span
										class="product_details_section_value">772 pages</span>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Edition :</span> <span
										class="product_details_section_value">3rd Edition</span>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Language :</span> <span
										class="product_details_section_value">English</span>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">ISBN-13 :</span> <span
										class="product_details_section_value">9781789955750</span>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Vendor :</span>
									<div class="product_details_section_value">
										<span> Google </span>
									</div>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Category :</span>
									<div class="product_details_section_value">
										<a href="https://www.packtpub.com/en-us/data" class="fw-600">
											Data </a>
									</div>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Languages :</span>
									<div class="product_details_section_value">
										<a href="https://www.packtpub.com/en-us/data/language/python"
											class="fw-600"> Python (Expert) </a>
									</div>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Concepts :</span>
									<div class="product_details_section_value">
										<a
											href="https://www.packtpub.com/en-us/data/concept/machine-learning"
											class="fw-600"> Machine Learning </a>
									</div>
								</div>
								<div class="product_details_section_content mb-3">
									<span class="product_details_section_key">Tools :</span>
									<div class="product_details_section_value">
										<a href="https://www.packtpub.com/en-us/data/tool/tensorflow"
											class="fw-600"> TensorFlow (Intermediate) , </a> <a
											href="https://www.packtpub.com/en-us/data/tool/keras"
											class="fw-600"> Keras (Intermediate) </a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<section class="bj_frequently_bought_area sec_padding pt-0"
		data-bg-color="#f5f5f5">
		<div class="container">
			<div class="section_title text-center">
				<h2 class="title_two">Frequently Bought Together</h2>
				<p>Get Special Promo All Books Are 50% Off Now!</p>
			</div>
			<div class="row gy-xl-0 gy-4">
				<div class="col-xl-3 col-lg-4 col-sm-6">
					<div class="bj_new_pr_item mb-0 wow fadeInUp" data-wow-delay="0.2s">
						<label class="select-box" for="fbt-box-1"> <input
							type="checkbox" class="form-check-input" id="fbt-box-1" checked>
						</label> <a href="#" class="img"><img
							th:src="@{/assets/img/home/book5.jpg}" alt="book"></a>
						<div class="bj_new_pr_content">
							<a href="product-single.html">
								<h4 class="bj_new_pr_title">The Sun And The Star</h4>
							</a>
							<div class="bj_pr_meta d-flex">
								<div class="norm_text">Dec 2019</div>
								<div class="norm_text">77 pages</div>
								<div class="ratting">
									<i class="fas fa-star"></i> <span>4.7</span>
								</div>
							</div>
							<div class="product_varaiation">
								<select class="selectpickers">
									<option th:attr="data-img=@{/assets/img/shop/ereader.png}"
										value="">eBook</option>
									<option th:attr="data-img=@{/assets/img/shop/book.png}"
										value="">paperback</option>
								</select>
								<div class="book_price mt-2">
									<del class="me-2">410</del>
									$100
								</div>
							</div>
							<button type="button"
								class="bj_theme_btn strock_btn add-to-cart-automated"
								data-name="The Sun And The Star" data-price="125" data-mrp="350"
								th:attr="data-img=@{/assets/img/home/book5.jpg}">Add To
								Cart</button>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-4 col-sm-6">
					<div class="bj_new_pr_item mb-0 wow fadeInUp" data-wow-delay="0.3s">
						<label class="select-box" for="fbt-box-2"> <input
							type="checkbox" class="form-check-input" id="fbt-box-2" checked>
						</label> <a href="#" class="img"><img
							th:src="@{/assets/img/home/book6.jpg}" alt="book"></a>
						<div class="bj_new_pr_content">
							<a href="product-single.html">
								<h4 class="bj_new_pr_title">The Most Fun</h4>
							</a>
							<div class="bj_pr_meta d-flex">
								<div class="norm_text">Oct 2024</div>
								<div class="norm_text">55 pages</div>
								<div class="ratting">
									<i class="fas fa-star"></i> <span>4.7</span>
								</div>
							</div>
							<div class="product_varaiation">
								<select class="selectpickers">
									<option th:attr="data-img=@{/assets/img/shop/ereader.png}"
										value="">eBook</option>
									<option th:attr="data-img=@{/assets/img/shop/book.png}"
										value="">paperback</option>
								</select>
								<div class="book_price mt-2">
									<del class="me-2">410</del>
									$100
								</div>
							</div>
							<button type="button"
								class="bj_theme_btn strock_btn add-to-cart-automated"
								data-name="The Sun And The Star" data-price="125" data-mrp="250"
								th:attr="data-img=@{/assets/img/home/book6.jpg}">Add To
								Cart</button>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-4 col-sm-6">
					<div class="bj_new_pr_item mb-0 wow fadeInUp" data-wow-delay="0.4s">
						<label class="select-box" for="fbt-box-3"> <input
							type="checkbox" class="form-check-input" id="fbt-box-3" checked>
						</label> <a href="#" class="img"><img
							th:src="@{/assets/img/home/book7.jpg}" alt="book"></a>
						<div class="bj_new_pr_content">
							<a href="product-single.html">
								<h4 class="bj_new_pr_title">The Magic and Fear</h4>
							</a>
							<div class="bj_pr_meta d-flex">
								<div class="norm_text">Jan 2010</div>
								<div class="norm_text">27 pages</div>
								<div class="ratting">
									<i class="fas fa-star"></i> <span>4.7</span>
								</div>
							</div>
							<div class="product_varaiation">
								<select class="selectpickers">
									<option th:attr="data-img=@{/assets/img/shop/ereader.png}"
										value="">eBook</option>
									<option th:attr="data-img=@{/assets/img/shop/book.png}"
										value="">paperback</option>
								</select>
								<div class="book_price mt-2">
									<del class="me-2">410</del>
									$100
								</div>
							</div>
							<button type="button"
								class="bj_theme_btn strock_btn add-to-cart-automated"
								data-name="The Sun And The Star" data-price="125" data-mrp="250"
								th:attr="data-img=@{/assets/img/home/book7.jpg}">Add To
								Cart</button>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-12 col-sm-6">
					<div class="added_cart_total">
						<h4 class="mt-auto">Total</h4>
						<div class="price">$265</div>
						<del>$740</del>
						<div>$375.00 saved</div>
						<a href="#" class="bj_theme_btn w-100 mt-auto">Add selected to
							cart</a>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>

</html>
