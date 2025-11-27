<!doctype html>
<html lang="en">


<!-- Mirrored from html-template.spider-themes.net/bookjar/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:17 GMT -->
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" th:href="@{/assets/img/favicon.png}">
    <!-- Bootstrap CSS -->
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
                    <h4><span>Bookjar</span></h4>
                </div>
            </div>
            <h2 class="head">Did You Know?</h2>
            <p></p>
        </div>
    </div>

    <div class="body_wrapper">
        <div class="login-area">
            <div class="bg-shapes">
                <img class="wow fadeIn" th:src="@{/assets/img/login/heart-shape-01.png}" alt="Image">
                <img class="wow fadeInLeft" th:src="@{/assets/img/login/heart-shape-02.png}" alt="Image">
                <img class="wow fadeInLeft" th:src="@{/assets/img/login/heart-shape-03.png}" alt="Image">
                <img class="wow " th:src="@{/assets/img/login/heart-shape-04.png}" alt="Image">
            </div>
            <div class="login-wrapper">
                <div class="login-left">
                    <a th:href="@{/}" class="logo"><img th:src="@{/assets/img/home-two/logo-dark.svg}" alt="Image"></a>
                    <h2 class="title">Login to Your Account</h2>
                    <div class="sibtitle">Welcome Back! Select Method to login:</div>

                    <div class="social-links">
                        <a href="#"><img th:src="@{/assets/img/login/google-icon.svg}" alt="Image"></a>
                        <a href="#"><img th:src="@{/assets/img/login/fb-icon.svg}" alt="Image"></a>
                        <a href="#"><img th:src="@{/assets/img/login/apple-icon.png}" alt="Image"></a>
                    </div>
                    <div class="divider"><span>or</span></div>
                    <form th:action="@{/login}" method="post">
                        <div class="input-field">
                            <input type="text" class="form-control" placeholder="Tài khoản" name="username">
                        </div>
                        <div class="input-field pass-field-with-icon">
                            <input type="password" class="form-control" id="toggle_passowrd_field" name="password" placeholder="Password">
                            <i data-toggleTarget="#toggle_passowrd_field" class="icon fas fa-eye toggle-password"></i>
                        </div>
                        <div class="d-flex justify-content-between input-field">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                                <label class="form-check-label" for="flexCheckChecked">
                                    Remember me
                                </label>
                            </div>
                            <a href="#" class="forget-password">Forgot Password?</a>
                        </div>
                        <div class="alert alert-danger" th:text="${error}"></div>
                        <button type="submit" class="bj_theme_btn w-100 border-0">Log In</button>
                    </form>
                    <div class="new-user">
                        New user?<a th:href="@{/register}"> Create an account</a>
                    </div>
                </div>
                <div class="login-right">
                    <img th:src="@{/assets/img/login/login-img.png}" alt="Image">
                </div>
            </div>
        </div>
    </div>
    <!-- Optional JavaScript; choose one of the two! -->
    <script th:src="@{/assets/js/jquery-3.6.0.min.js}"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->

    <script th:src="@{/assets/js/preloader.js}"></script>
    <script th:src="@{/assets/vendors/bootstrap/js/popper.min.js}"></script>
    <script th:src="@{/assets/vendors/bootstrap/js/bootstrap.min.js}"></script>
    <script th:src="@{/assets/vendors/wow/wow.min.js}"></script>
    <script th:src="@{/assets/js/custom.js}"></script>

</body>


<!-- Mirrored from html-template.spider-themes.net/bookjar/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:20 GMT -->
</html>