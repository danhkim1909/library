<!doctype html>
<html xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" th:href="@{/assets/img/favicon.png}">
	<!-- Bootstrap CSS -->
	<link th:href="@{/assets/vendors/bootstrap/css/bootstrap.min.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/elagent-icon/style.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/icomoon/style.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/themify-icon/themify-icons.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/font-awesome/css/all.min.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/animation/animate.css}" rel="stylesheet">

	<link th:href="@{/assets/vendors/nice-select/css/nice-select.css}" rel="stylesheet">
	<link th:href="@{/assets/css/style.css}" rel="stylesheet">
	<link th:href="@{/assets/css/responsive.css}" rel="stylesheet">

	<title layout:title-pattern="$LAYOUT_TITLE - $CONTENT_TITLE">Bookjar</title>
</head>

<body data-scroll-animation="true">
	<div id="preloader">
		<div id="ctn-preloader" class="ctn-preloader">
			<div class="round_spinner">
				<div class="spinner"></div>
				<div class="text">
					<img th:src="@{/assets/img/favicon.png}" alt="Image">
					<h4>
						<span>Bookjar</span>
					</h4>
				</div>
			</div>
			<h2 class="head">Did You Know?</h2>
			<p></p>
		</div>
	</div>

	<div class="body_wrapper">
		<div class="toast-container position-fixed p-3">
			<div id="cartToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header">
					<strong class="me-auto">Cart Update</strong> <small>just
						now</small>
					<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
				</div>
				<div class="toast-body">Item added to the cart!</div>
			</div>
		</div>


		<!-- Modal -->
		<div class="modal fade product-quickview-modal" id="productQuickView" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog  modal-dialog-centered">
				<div class="modal-content">
					<button type="button" class="close-btn" data-bs-dismiss="modal" aria-label="Close">
						<i class="icon_close"></i>
					</button>
					<div class="bj_book_single">
						<div class="bj_book_img flip">
							<div class="front">
								<img class="img-fluid" src="assets/img/book-single1.jpg" alt="">
							</div>
							<div class="back">
								<img class="img-fluid" src="assets/img/book-single.jpg" alt="">
							</div>
							<div class="pr_ribbon">
								<span class="product-badge">New</span>
							</div>
						</div>
						<div class="bj_book_details">
							<h2>A Storytelling Workbook</h2>
							<ul class="list-unstyled book_meta">
								<li>By:<a href="author-single.html">Phillip Siphron</a></li>
								<li>Category:<a href="shop-sidebar.html">Drama</a></li>
								<li>Tag:<a href="shop-sidebar.html">Best Sellers</a></li>
							</ul>
							<div class="ratting review">
								<div class="star-rating">
									<span>4.9</span>
								</div>
								<a href="#product_review" class="woocommerce-review-link"> <span class="count"> 50
									</span>Reviews
								</a>
							</div>
							<div class="price">$10</div>
							<p>Dicta sunt explicabo. Nemo enim ipsam voluptatem voluptas
								sit odit aut fugit, sed quia consequuntur.</p>
							<ul class="product_meta list-unstyled">
								<li><span>Publisher:</span>Avery</li>
								<li><span>Publication date:</span>July 20, 2024</li>
								<li><span>Print length:</span>320 pages</li>
								<li><span>ISBN:</span>3288365629</li>
								<li><span>Language:</span>English</li>
							</ul>
							<div class="product_sidbar">
								<div class="product-qty">
									Qty:
									<div class="cart_quantity">
										<button class="quantity_btn minus">
											<i class="icon_minus-06"></i>
										</button>
										<input type="number" min="1" max="99" step="1" value="1">
										<button class="quantity_btn plus">
											<i class="icon_plus"></i>
										</button>
									</div>
								</div>

								<div class="single_product_price_variation mb-3">
									<label class="variation_single"> <input class="variation_single_input"
											name="variation_single" type="radio" checked> <span class="price-details">
											<span class="price-type">Handcover</span> <span
												class="price-cost">$10</span>
										</span>
									</label> <label class="variation_single"> <input class="variation_single_input"
											name="variation_single" type="radio"> <span class="price-details"> <span
												class="price-type">eBook</span> <span class="price-cost">$20</span>
										</span>
									</label> <label class="variation_single"> <input class="variation_single_input"
											name="variation_single" type="radio"> <span class="price-details"> <span
												class="price-type">Print</span> <span class="price-cost">$30</span>
										</span>
									</label>

								</div>
								<div class="d-flex flex-column gap-2">
									<a href="checkout.html" class="bj_theme_btn"> Buy Now</a>
									<button class="bj_theme_btn add-to-cart-automated" type="button"
										data-name="A Storytelling Workbook" data-price="10"
										data-img="assets/img/book-single1.jpg" data-mrp="15">
										<i class="icon_cart_alt"></i>Add to cart
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<header class="header_area">
			<nav class="navbar navbar-expand-lg menu_one" id="header">
				<div class="container">
					<a class="navbar-brand" th:href="@{/}"><img th:src="@{/assets/img/home-two/logo-dark.svg}"
							alt="logo"></a>
					<button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
						data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="menu_toggle"> <span class="hamburger">
								<span></span> <span></span> <span></span>
							</span> <span class="hamburger-cross"> <span></span> <span></span>
							</span>
						</span>
					</button>
					<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
						<ul class="navbar-nav menu w_menu ms-auto me-auto ">
							<li class="nav-item active"><a class="nav-link" th:href="@{/}"> Trang chủ </a></li>
							<li class="nav-item"><a class="nav-link" th:href="@{/sach}">
									Sách </a></li>

							<li class="nav-item" sec:authorize="hasRole('docgia')"><a class="nav-link"
									th:href="@{/sachmuon}">
									Sách tôi mượn</a></li>
							<li class="nav-item dropdown submenu mega_menu tab-demo"><a class="nav-link dropdown-toggle"
									href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">Explore </a>
								<ul class="dropdown-menu sub">
									<li>
										<div class="row">
											<div class="col-lg-5 tabHeader">
												<ul class="nav flex-column nav-pills" id="v-pills-tab" role="tablist"
													aria-orientation="vertical">
													<li class="nav-item active"><a class="nav-link"
															id="v-pills-tour-tab" data-toggle="pill"
															href="#v-pills-tour" role="tab" aria-controls="v-pills-tour"
															aria-selected="false">Utility
															Pages</a></li>
													<li class="nav-item"><a class="nav-link" id="v-others-menu-tab"
															data-toggle="pill" href="#v-others-menu" role="tab"
															aria-controls="v-others-menu"
															aria-selected="false">Company</a>
													</li>
													<li class="nav-item"><a class="nav-link" id="v-pills-doc-tab"
															data-toggle="pill" href="#v-pills-doc" role="tab"
															aria-controls="v-pills-doc" aria-selected="true">Shop
															Pages</a></li>
													<li class="nav-item"><a class="nav-link" id="v-pills-code-tab"
															data-toggle="pill" href="#v-pills-code" role="tab"
															aria-controls="v-pills-code"
															aria-selected="false">Dashboard</a>
													</li>
													<li class="nav-item"><a class="nav-link" id="v-pills-layout-tab"
															data-toggle="pill" href="#v-pills-layout" role="tab"
															aria-controls="v-pills-layout" aria-selected="false">Blog
															Author</a></li>
												</ul>
											</div>
											<div class="col-lg-7">
												<div class="tab-content tabContent" id="v-pills-tabContent">
													<div class="tab-pane fade active show" id="v-pills-tour"
														role="tabpanel" aria-labelledby="v-pills-tour-tab">
														<div class="d-flex">
															<ul class="list-unstyled tab_list w_100">
																<li><a href="login.html">Sign In</a></li>
																<li><a href="registration.html">Sign Up</a></li>
																<li><a href="typography.html">Typography</a></li>
																<li><a href="page-banner-style-2.html">Banner
																		style 02</a></li>
																<li><a href="page-banner-style-3.html">Banner
																		style 03</a></li>
															</ul>
														</div>
													</div>
													<div class="tab-pane fade" id="v-others-menu" role="tabpanel"
														aria-labelledby="v-others-menu-tab">
														<div class="d-flex">
															<ul class="list-unstyled tab_list w_100">
																<li><a href="book-listing.html">Book Listing</a></li>
																<li><a href="about.html">About</a></li>
																<li><a href="contact.html">Contact Us</a></li>
																<li><a href="terms-condition.html">Terms
																		Services</a></li>
																<li><a href="privacy-policy.html">Privacy
																		Policy</a></li>
															</ul>
														</div>
													</div>
													<div class="tab-pane fade" id="v-pills-doc" role="tabpanel"
														aria-labelledby="v-pills-doc-tab">
														<div class="d-flex">
															<ul class="list-unstyled tab_list">
																<li><a href="shop.html">Shop</a></li>
																<li><a href="shop-no-sidebar.html">Shop No
																		Sidebar</a></li>
																<li><a href="product-single.html">Product
																		Details</a></li>
																<li><a href="cart.html">Cart</a></li>
																<li><a href="cart-guest.html">Cart Guest</a></li>
															</ul>
															<ul class="list-unstyled tab_list">
																<li><a href="checkout.html">Checkout</a></li>
																<li><a href="checkout-gift.html">Checkout Gift</a>
																</li>
																<li><a href="checkout-login.html">Checkout
																		Login</a></li>

																<li><a href="my-wishlist.html">Wishlist</a></li>
															</ul>
														</div>
													</div>
													<div class="tab-pane fade" id="v-pills-code" role="tabpanel"
														aria-labelledby="v-pills-code-tab">
														<div class="d-flex">
															<ul class="list-unstyled tab_list">
																<li><a href="my-account.html">User Profile</a></li>
																<li><a href="my-orders.html">Orders</a></li>
																<li><a href="order-track.html">Order Tracking</a></li>
																<li><a href="order-confrmation.html">Thank You
																		Page</a></li>
																<li><a href="my-ebook-library.html">Ebook
																		Library</a></li>
																<li><a href="my-following-authors.html">Following
																		Authors</a></li>
																<li><a href="my-rating-reviews.html">Rating
																		Authors</a></li>

															</ul>
															<ul class="list-unstyled tab_list">
																<li><a href="my-list.html">Book List</a></li>
																<li><a href="my-list-details.html">Book List
																		Details</a></li>
																<li><a href="my-list-create.html">Create Book
																		List</a></li>
																<li><a href="my-address.html">Address Book</a></li>
																<li><a href="add-new-address.html">Add New
																		Address</a></li>

															</ul>
														</div>
													</div>
													<div class="tab-pane fade" id="v-pills-layout" role="tabpanel"
														aria-labelledby="v-pills-layout-tab">
														<div class="d-flex">
															<ul class="list-unstyled tab_list">
																<li><a href="blog-grid.html">Blog Grid</a></li>
																<li><a href="blog-extend-grid.html">Extended
																		Grid</a></li>
																<li><a href="blog-list.html">Blog List</a></li>
																<li><a href="blog-details.html">Blog Details</a></li>
																<li><a href="author.html">Author</a></li>
																<li><a href="author-single.html">Author Single</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</li>
							<li class="nav-item dropdown submenu"><a class="nav-link dropdown-toggle"
									href="blog-list.html" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Blog </a>

								<ul class="dropdown-menu">
									<li class="nav-item"><a href="blog-grid.html" class="nav-link">Blog Grid</a></li>
									<li class="nav-item"><a href="blog-extend-grid.html" class="nav-link">Extended
											Grid</a></li>
									<li class="nav-item"><a href="blog-list.html" class="nav-link">Blog List</a></li>
									<li class="nav-item"><a href="blog-details.html" class="nav-link">Blog Details</a>
									</li>
								</ul>
							</li>
						</ul>
						<div class="alter_nav">
							<ul class="navbar-nav search_cart menu">
								<li class="nav-item search"><a class="nav-link search-btn" href="javascript:void(0);"><i
											class="ti-search"></i></a>
									<form action="#" method="get" class="menu-search-form">
										<div class="input-group">
											<input type="search" class="form-control" placeholder="Search here..">
											<button type="submit">
												<i class="ti-arrow-right"></i>
											</button>
										</div>
									</form>
								</li>
								<li class="nav-item shpping-cart dropdown submenu"><a
										class="cart-btn nav-link dropdown-toggle" href="#" role="button"
										data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
											class="ti-shopping-cart"></i><span class="num total-cart-count">2</span></a>
									<div class="dropdown-menu">
										<ul class="cart-dropdown list-unstyled">
											<li class="cart-single-item clearfix">
												<div class="cart-img">
													<img src="assets/img/cart1.jpg" alt="styler">
												</div>
												<div class="cart-content text-left">
													<p class="cart-title">
														<a href="#">Pale pink and black buttoned dress</a>
													</p>
													<p>
														<del>$400.00</del>
														- $350.00
													</p>
												</div>
												<div class="cart-remove">
													<a href="#" class="action"><span class="ti-close"></span></a>
												</div>
											</li>
											<li class="cart-single-item clearfix">
												<div class="cart-img">
													<img src="assets/img/cart1.jpg" alt="styler">
												</div>
												<div class="cart-content text-left">
													<p class="cart-title">
														<a href="#">Vera bradley lug- gage large duffel</a>
													</p>
													<p>$350.00</p>
												</div>
												<div class="cart-remove">
													<a href="#" class="action"><span class="ti-close"></span></a>
												</div>
											</li>
										</ul>
										<div class="cart_f">
											<div class="cart-pricing">
												<p class="total">
													Subtotal :<span class="p-total text-end">$<span
															class="total-cart-amount"></span></span>
												</p>
											</div>
											<div class="cart-button text-center">
												<a href="cart.html" class="btn btn-cart get_btn pink">View
													Cart</a> <a href="checkout.html"
													class="btn btn-cart get_btn dark">Checkout</a>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>

						<a sec:authorize="isAnonymous()" class="bj_theme_btn strock_btn hidden-sm hidden-xs"
							th:href="@{/login}"><i class="fa-regular fa-user"></i>Đăng
							nhập</a> <a sec:authorize="hasRole('nhanvien')"
							class="bj_theme_btn strock_btn hidden-sm hidden-xs" th:href="@{/admin}"><i
								class="fa-regular fa-user"></i>Trang
							quản trị</a>
						<form sec:authorize="isAuthenticated()" th:action="@{/logout}" method="post">
							<button type="submit" class="bj_theme_btn strock_btn hidden-sm hidden-xs">Đăng
								xuất</button>
						</form>
					</div>
				</div>
			</nav>
		</header>

		<div layout:fragment="content"></div>

		<!-- footer area css  -->
		<footer class="bj_footer_area_two" data-bg-color="#CDF0F0">
			<div class="container">
				<div class="footer_top">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="f_widget f_widget_dark link_widget">
								<a href="#" class="f_logo"> <img src="assets/img/home-two/logo-dark.svg" alt="f_logo">
								</a>
								<div class="footer_subscribes">
									<h2 class="f_widget_title dark">Subscribe Now</h2>
									<form action="#">
										<div class="footer_subscribe_form">
											<input type="text" placeholder="Enter your Email" class="form-control">
											<button type="submit" class="bj_theme_btn">Subscribe</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-sm-6">
							<div class="f_widget f_widget_dark link_widget">
								<h2 class="f_widget_title dark">Company</h2>
								<ul class="list-unstyled list">
									<li><a href="about.html">About Us</a></li>
									<li><a href="contact.html">Contact us</a></li>
									<li><a href="blog-grid.html">Blog</a></li>
									<li><a href="author.html">Author</a></li>
									<li><a href="book-listing.html">Books</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 col-sm-6">
							<div class="f_widget f_widget_dark link_widget">
								<h2 class="f_widget_title dark">Services</h2>
								<ul class="list-unstyled list">
									<li><a href="shop.html">Shop</a></li>
									<li><a href="my-orders.html">Order</a></li>
									<li><a href="cart.html">Cart</a></li>
									<li><a href="checkout.html">Checkout</a></li>
									<li><a href="my-wishlist.html">Wishlist</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-2 col-sm-6">
							<div class="f_widget f_widget_dark link_widget">
								<h2 class="f_widget_title dark">Pages</h2>
								<ul class="list-unstyled list">
									<li><a href="login.html">Login</a></li>
									<li><a href="registration.html">Register</a></li>
									<li><a href="typography.html">Typography</a></li>
									<li><a href="404.html">404 Page</a></li>
									<li><a href="my-ebook-library.html">Ebook Library</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="f_widget f_widget_dark link_widget">
								<h2 class="f_widget_title dark">Contacs Us</h2>
								<ul class="list-unstyled list">
									<li><a href="tel:610383766284"><i class="fa-solid fa-phone-volume"></i>+61 (0) 3
											8376 6284</a></li>
									<li><a href="mailto:noreply@bookjar.com"><i
												class="fa-solid fa-envelope"></i>noreply@bookjar.com</a></li>
								</ul>
								<ul class="list-unstyled f_social_round">
									<li><a href="#"><i class="fa-brands fa-facebook-f"></i></a></li>
									<li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa-brands fa-google"></i></a></li>
									<li><a href="#"><i class="fa-brands fa-github"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="footer_bottom_dark d-flex  justify-content-center">
					<p>© 2024 Bookjar. All Rights Reserved</p>
				</div>
			</div>
		</footer>
	</div>
	<!-- Back to top button -->
	<a id="back-to-top" title="Back to Top"></a>
	<!-- Optional JavaScript; choose one of the two! -->
	<script th:src="@{/assets/js/jquery-3.6.0.min.js}"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<script th:src="@{/assets/js/preloader.js}"></script>
	<script th:src="@{/assets/vendors/bootstrap/js/popper.min.js}"></script>
	<script th:src="@{/assets/vendors/bootstrap/js/bootstrap.min.js}"></script>
	<script th:src="@{/assets/vendors/parallax/parallax.js}"></script>
	<script th:src="@{/assets/vendors/isotope/imagesloaded.pkgd.min.js}"></script>
	<script th:src="@{/assets/vendors/isotope/isotope.pkgd.min.js}"></script>
	<script th:src="@{/assets/vendors/parallax/jquery.parallax-scroll.js}"></script>
	<script th:src="@{/assets/vendors/wow/wow.min.js}"></script>
	<script th:src="@{/assets/vendors/ui-fliter/jquery-ui.js}"></script>
	<script th:src="@{/assets/vendors/nice-select/js/jquery.nice-select.min.js}"></script>
	<script th:src="@{/assets/js/custom.js}"></script>
	<th:block layout:fragment="scripts"></th:block>

	<link th:href="@{/assets/css/chatbot.css}" rel="stylesheet">

	<button id="chat-widget-btn" onclick="batTatChat()">💬</button>

	<div id="chat-box">
		<div class="chat-header">
			<span>Trợ lý AI</span>
			<button class="close-btn" onclick="batTatChat()">✕</button>
		</div>
		<div id="messages-area">
			<div class="message bot">Xin chào! Tôi có thể giúp gì cho bạn?</div>
		</div>
		<div class="input-area">
			<input type="text" id="msg-input" placeholder="Nhập tin nhắn..." onkeypress="xuLyEnter(event)">
			<button id="send-btn" onclick="guiTinNhan()">Gửi</button>
		</div>
	</div>

	<script th:src="@{/assets/js/sockjs.min.js}"></script>
	<script th:src="@{/assets/js/stomp.min.js}"></script>
	<script th:src="@{/assets/js/chatbot.js}"></script>

</body>


<!-- Mirrored from html-template.spider-themes.net/bookjar/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:51:41 GMT -->

</html>