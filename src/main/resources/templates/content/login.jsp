<html lang="en" layout:decorate="~{content/auth}">

<body data-scroll-animation="true">

    <div class="login-area" layout:fragment="content">
        <div class="bg-shapes">
            <img class="wow fadeIn" th:src="@{/assets/img/login/heart-shape-01.png}" alt="Image">
            <img class="wow fadeInLeft" th:src="@{/assets/img/login/heart-shape-02.png}" alt="Image">
            <img class="wow fadeInLeft" th:src="@{/assets/img/login/heart-shape-03.png}" alt="Image">
            <img class="wow " th:src="@{/assets/img/login/heart-shape-04.png}" alt="Image">
        </div>
        <div class="login-wrapper">
            <div class="login-left">
                <a th:href="@{/}" class="logo"><img th:src="@{/assets/img/home-two/logo-dark.svg}" alt="Image"></a>
                <h2 class="title">Đăng nhập</h2>
                <div class="sibtitle">Chào mừng trở lại, hãy chọn phương thức đăng nhập</div>
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
                        <input type="password" class="form-control" id="toggle_passowrd_field" name="password"
                            placeholder="Password">
                        <i data-toggleTarget="#toggle_passowrd_field" class="icon fas fa-eye toggle-password"></i>
                    </div>
                    <div class="d-flex justify-content-between input-field">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                                Nhớ tôi
                            </label>
                        </div>
                        <a th:href="@{/quen-mat-khau}" class="forget-password">Quên mật khẩu?</a>
                    </div>
                    <div class="alert alert-danger" th:if="${param.error}">Sai tài khoản hoặc mật khẩu</div>
                    <button type="submit" class="bj_theme_btn w-100 border-0">Đăng nhập</button>
                </form>
                <div class="new-user">
                    Người dùng mới?<a th:href="@{/register}"> Tạo tài khoản</a>
                </div>
            </div>
            <div class="login-right">
                <img th:src="@{/assets/img/login/login-img.png}" alt="Image">
            </div>
        </div>
    </div>

</body>


<!-- Mirrored from html-template.spider-themes.net/bookjar/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:20 GMT -->

</html>