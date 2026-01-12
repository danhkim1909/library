<!doctype html>
<html xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" th:href="@{/assets/img/favicon.png}" />
	<!-- Bootstrap CSS -->
	<link th:href="@{/assets/vendors/bootstrap/css/bootstrap.min.css}" rel="stylesheet" />
	<link th:href="@{/assets/vendors/elagent-icon/style.css}" rel="stylesheet" />
	<link th:href="@{/assets/vendors/icomoon/style.css}" rel="stylesheet" />
	<link th:href="@{/assets/vendors/themify-icon/themify-icons.css}" rel="stylesheet" />
	<link th:href="@{/assets/vendors/font-awesome/css/all.min.css}" rel="stylesheet" />
	<link th:href="@{/assets/vendors/animation/animate.css}" rel="stylesheet" />
	<link th:href="@{/assets/vendors/izitoast/css/iziToast.min.css}" rel="stylesheet" />
	<link th:href="@{/assets/vendors/nice-select/css/nice-select.css}" rel="stylesheet" />
	<link th:href="@{/assets/css/style.css}" rel="stylesheet" />
	<link th:href="@{/assets/css/responsive.css}" rel="stylesheet" />

	<title layout:title-pattern="$LAYOUT_TITLE - $CONTENT_TITLE">Bookjar</title>
</head>

<body data-scroll-animation="true">
	<div id="preloader">
		<div id="ctn-preloader" class="ctn-preloader">
			<div class="round_spinner">
				<div class="spinner"></div>
				<div class="text">
					<img th:src="@{/assets/img/favicon.png}" alt="Image" />
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
								<img class="img-fluid" src="assets/img/book-single1.jpg" alt="" />
							</div>
							<div class="back">
								<img class="img-fluid" src="assets/img/book-single.jpg" alt="" />
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
										<input type="number" min="1" max="99" step="1" value="1" />
										<button class="quantity_btn plus">
											<i class="icon_plus"></i>
										</button>
									</div>
								</div>

								<div class="single_product_price_variation mb-3">
									<label class="variation_single"> <input class="variation_single_input"
											name="variation_single" type="radio" checked /> <span class="price-details">
											<span class="price-type">Handcover</span> <span
												class="price-cost">$10</span>
										</span>
									</label> <label class="variation_single"> <input class="variation_single_input"
											name="variation_single" type="radio" /> <span class="price-details"> <span
												class="price-type">eBook</span> <span class="price-cost">$20</span>
										</span>
									</label> <label class="variation_single"> <input class="variation_single_input"
											name="variation_single" type="radio" /> <span class="price-details"> <span
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
							alt="logo" /></a>
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
									th:href="@{/sachmuon}"> Sách tôi mượn</a></li>
							<li class="nav-item dropdown submenu"><a class="nav-link dropdown-toggle"
									th:href="@{/baiviet}" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									Bài viết </a>

								<ul class="dropdown-menu">
									<li th:each="danhMuc : ${menuData.danhMucBaiViets}" class="nav-item"><a
											th:href="@{/baiviet(category=${danhMuc.key})}" class="nav-link"
											th:text="${danhMuc.value}"></a></li>
								</ul>
							</li>
						</ul>
						<div class="alter_nav">
							<ul class="navbar-nav search_cart menu">
								<li class="nav-item search"><a class="nav-link search-btn" href="javascript:void(0);"><i
											class="ti-search"></i></a>
									<form action="#" method="get" class="menu-search-form">
										<div class="input-group">
											<input type="search" class="form-control" placeholder="Search here.." />
											<button type="submit">
												<i class="ti-arrow-right"></i>
											</button>
										</div>
									</form>
								</li>
								<li class="nav-item shpping-cart "><a class="cart-btn nav-link"
										sec:authorize="hasRole('docgia')" th:href="@{/danhsachyeuthich}"><i
											class="far fa-heart"></i></a>
								</li>
							</ul>
						</div>

						<a sec:authorize="isAnonymous()" class="bj_theme_btn strock_btn hidden-sm hidden-xs"
							th:href="@{/login}"><i class="fa-regular fa-user"></i>Đăng
							nhập</a>
						<a sec:authorize="hasRole('nhanvien')" class="bj_theme_btn strock_btn hidden-sm hidden-xs"
							th:href="@{/admin}"><i class="fa-regular fa-user"></i>Trang
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
								<a href="#" class="f_logo"> <img src="assets/img/home-two/logo-dark.svg" alt="f_logo" />
								</a>
								<div class="footer_subscribes">
									<h2 class="f_widget_title dark">Subscribe Now</h2>
									<form action="#">
										<div class="footer_subscribe_form">
											<input type="text" placeholder="Enter your Email" class="form-control" />
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
	<script th:src="@{/assets/vendors/izitoast/js/iziToast.min.js}"></script>
	<script type="text/javascript" th:inline="javascript">
		document.addEventListener("DOMContentLoaded", function () {
			const success = /*[[${success}]]*/ null;
			const error = /*[[${error}]]*/ null;
			const info = /*[[${info}]]*/ null;

			if (success && success.trim() !== '') {
				iziToast.success({
					title: 'Thành công',
					message: success,
					position: 'topRight'
				});
			} else if (error && error.trim() !== '') {
				iziToast.error({
					title: 'Thất bại',
					message: error,
					position: 'topRight'
				});
			} else if (info && info.trim() !== '') {
				iziToast.info({
					title: 'Thông báo',
					message: info,
					position: 'topRight'
				});
			}
		});
	</script>

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

	<link th:href="@{/assets/css/chatbot.css}" rel="stylesheet" />

	<button id="chat-widget-btn" onclick="batTatChat()"><i class="fa fa-commenting"></i></button>

	<div id="chat-box">
		<div class="chat-header">
			<span>Trợ lý AI</span>
			<button class="close-btn" onclick="batTatChat()">✕</button>
		</div>
		<div id="messages-area">
			<div class="message bot">Xin chào! Tôi có thể giúp gì cho bạn?</div>
		</div>
		<div class="input-area">
			<input type="text" id="msg-input" placeholder="Nhập tin nhắn..." onkeypress="xuLyEnter(event)" />
			<button id="send-btn" onclick="guiTinNhan()">Gửi</button>
		</div>
	</div>


	<script th:src="@{/assets/js/sockjs.min.js}"></script>
	<script th:src="@{/assets/js/stomp.min.js}"></script>
	<script th:src="@{/assets/js/chatbot.js}"></script>


</body>


<!-- Mirrored from html-template.spider-themes.net/bookjar/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:51:41 GMT -->

</html>