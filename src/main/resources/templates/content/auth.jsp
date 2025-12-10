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
    <link th:href="@{/assets/vendors/izitoast/css/iziToast.min.css}" rel="stylesheet" />
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
        <div layout:fragment="content"></div>
    </div>
    <!-- Optional JavaScript; choose one of the two! -->
    <script th:src="@{/assets/js/jquery-3.6.0.min.js}"></script>

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
    <!-- Option 2: Separate Popper and Bootstrap JS -->

    <script th:src="@{/assets/js/preloader.js}"></script>
    <script th:src="@{/assets/vendors/bootstrap/js/popper.min.js}"></script>
    <script th:src="@{/assets/vendors/bootstrap/js/bootstrap.min.js}"></script>
    <script th:src="@{/assets/vendors/wow/wow.min.js}"></script>
    <script th:src="@{/assets/js/custom.js}"></script>

</body>


<!-- Mirrored from html-template.spider-themes.net/bookjar/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:20 GMT -->

</html>