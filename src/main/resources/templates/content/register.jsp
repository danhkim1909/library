<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" th:href="@{/assets/img/favicon.png}">
	<link th:href="@{/assets/vendors/bootstrap/css/bootstrap.min.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/elagent-icon/style.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/font-awesome/css/all.min.css}" rel="stylesheet">
	<link th:href="@{/assets/vendors/animation/animate.css}" rel="stylesheet">
	<link th:href="@{/assets/css/style.css}" rel="stylesheet">
	<link th:href="@{/assets/css/responsive.css}" rel="stylesheet">
	<title>Bookjar</title>
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
		<div class="login-area registration-area">
			<div class="login-wrapper">
				<div class="login-left">
					<a th:href="@{/}" class="logo"><img th:src="@{/assets/img/home-two/logo-dark.svg}" alt="Image"></a>
					<h2 class="title">Đăng ký</h2>
					<div class="sibtitle">Đăng ký tài khoản</div>
					<form th:action="@{/register}" th:object="${user}" method="post">
						<div class="input-field">
							<input type="text" name="tenDangNhap" class="form-control" placeholder="Tên đăng nhập">
							<div th:if="${#fields.hasErrors('tenDangNhap')}" class="text-danger"
								th:errors="*{tenDangNhap}"></div>
						</div>
						<div class="input-field pass-field-with-icon">
							<input type="password" name="matKhau" class="form-control" id="toggle_passowrd_field"
								placeholder="Mật khẩu"> <i data-toggleTarget="#toggle_passowrd_field"
								class="icon fas fa-eye toggle-password"></i>
							<div th:if="${#fields.hasErrors('matKhau')}" class="text-danger" th:errors="*{matKhau}">
							</div>
						</div>
						<div class="input-field">
							<input type="text" name="tenDocGia" class="form-control" placeholder="Tên hiển thị">
							<div th:if="${#fields.hasErrors('tenDocGia')}" class="text-danger" th:errors="*{tenDocGia}">
							</div>
						</div>
						<div class="input-field">
							<input type="text" name="email" class="form-control" placeholder="email">
							<div th:if="${#fields.hasErrors('email')}" class="text-danger" th:errors="*{email}">
							</div>
						</div>
						<div class="input-field">
							<input type="text" name="diaChi" class="form-control" placeholder="Địa chỉ">
							<div th:if="${#fields.hasErrors('diaChi')}" class="text-danger" th:errors="*{diaChi}"></div>
						</div>
						<div class="input-field">
							<input type="text" name="soDt" class="form-control" placeholder="Số điện thoại">
							<div th:if="${#fields.hasErrors('soDt')}" class="text-danger" th:errors="*{soDt}"></div>
						</div>
						<div class="input-field">
							<input type="text" name="lop" class="form-control" placeholder="Lớp">
							<div th:if="${#fields.hasErrors('lop')}" class="text-danger" th:errors="*{lop}"></div>
						</div>
						<div class="input-field">
							<select name="gioiTinh" class="form-control">
								<option value="Nam">Nam</option>
								<option value="Nữ">Nữ</option>
							</select>
							<div th:if="${#fields.hasErrors('gioiTinh')}"></div>
						</div>
						<div class="d-flex justify-content-between input-field">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked"> <label
									class="form-check-label" for="flexCheckChecked"> Tôi đồng ý với <a
										th:href="@{/privacy-policy}">Điều khoản bảo mật</a>
								</label>
							</div>
						</div>
						<button type="submit" class="bj_theme_btn w-100 border-0">Đăng
							ký</button>
					</form>
					<div class="new-user">
						Quay lại<a th:href="@{/login}"> Đăng nhập</a>
					</div>
				</div>
				<div class="login-right">
					<img class="mt-auto" th:src="@{/assets/img/login/reginstration-img.png}" alt="Image">
				</div>
			</div>
		</div>
	</div>
	<script th:src="@{/assets/js/jquery-3.6.0.min.js}"></script>

	<script th:src="@{/assets/js/preloader.js}"></script>
	<script th:src="@{/assets/vendors/bootstrap/js/popper.min.js}"></script>
	<script th:src="@{/assets/vendors/bootstrap/js/bootstrap.min.js}"></script>
	<script th:src="@{/assets/vendors/wow/wow.min.js}"></script>
	<script th:src="@{/assets/js/custom.js}"></script>

</body>

</html>