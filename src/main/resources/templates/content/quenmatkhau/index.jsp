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
                <h2 class="title">Quên mật khẩu</h2>
                <div class="sibtitle">Nhập tài khoản để nhận mật khẩu</div>
                <form th:action="@{/quen-mat-khau}" method="post">
                    <div class="input-field">
                        <input type="text" class="form-control" placeholder="Tài khoản" name="username">
                    </div>
                    <div class="alert alert-danger" th:if="${param.error}">Sai tài khoản</div>
                    <button type="submit" class="bj_theme_btn w-100 border-0">Gửi</button>
                </form>
                <div class="new-user">
                    <a th:href="@{/login}">Đăng nhập</a>
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