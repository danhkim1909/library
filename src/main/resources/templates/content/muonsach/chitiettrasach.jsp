<!doctype html>
<html lang="en" layout:decorate="~{content/layout}">

<head>
    <title>Chi tiết trả sách</title>
</head>

<body layout:fragment="content">

    <div class="cart-header-separator"></div>

    <section class="bj_account_dashboard" data-bg-color="#f5f5f5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="account_dashboard_body">
                        <div class="account_dashboard_content p-5">
                            <div class="account_dashboard_content_header">
                                <h4>Chi tiết trả sách</h4>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Tên sách:</label>
                                        <a th:href="@{/sach/{id}(id=${traSach.muonSach.sach.maSach})}">
                                            <h5 th:text="${traSach.muonSach.sach.tenSach}">
                                                <h5 />
                                        </a>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Ảnh bìa:</label>
                                        <div>
                                            <img th:src="${traSach.muonSach.sach.anhBia}" class="img-thumbnail"
                                                width="120" alt="Ảnh bìa sách">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">Ngày trả:</label>
                                        <p th:text="${#temporals.format(traSach.thoiGianTra, 'dd-MM-yyyy HH:mm')}"></p>
                                    </div>

                                    <div th:if="${traSach.tienPhat > 0}">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold text-danger">Tiền phạt:</label>
                                            <p class="text-danger font-weight-bold"
                                                th:text="${#numbers.formatInteger(traSach.tienPhat, 1, 'POINT') + '.000 VNĐ'}">
                                            </p>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Lý do phạt:</label>
                                            <p th:text="${traSach.lyDoPhat}"></p>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">Trạng thái nộp phạt:</label>
                                            <span th:class="${traSach.daNopPhat ? 'text-success' : 'text-danger'}"
                                                th:text="${traSach.daNopPhat ? 'Đã nộp' : 'Chưa nộp'}">
                                            </span>
                                        </div>

                                        <div class="form-group mt-4" th:if="${!traSach.daNopPhat}">
                                            <a th:href="@{/thanhtoan/tienphat/vnpay/{id}(id=${traSach.maTraSach})}"
                                                class="btn btn-danger btn-lg">
                                                <i class="fas fa-money-bill-wave"></i> Thanh toán qua VNPAY
                                            </a>
                                            <small class="form-text text-muted d-block mt-2">
                                                * Bạn sẽ được chuyển hướng đến cổng thanh toán VNPAY an toàn.
                                            </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="text-center" th:if="${traSach.anh != null}">
                                        <h5 class="mb-3">Ảnh xác nhận lúc trả sách</h5>
                                        <img th:src="${traSach.anh}" class="img-fluid rounded shadow-sm"
                                            style="max-height: 500px;" alt="Ảnh xác nhận">
                                    </div>
                                </div>
                            </div>

                            <hr>
                            <div class="text-right">
                                <a th:href="@{/sachmuon}" class="btn btn-secondary">Quay lại danh sách</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>