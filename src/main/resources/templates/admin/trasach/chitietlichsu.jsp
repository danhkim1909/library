<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">


<!-- profile.html  21 Nov 2019 03:49:30 GMT -->

<head>

    <title>Chi tiết sách đã trả</title>

</head>

<body>
    <section class="section" layout:fragment="content">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Chi tiết trả sách</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Tên sách:</label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static" th:text="${traSach.muonSach.sach.tenSach}">
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Ảnh bìa:</label>
                                        <div class="col-sm-9">
                                            <img th:src="${traSach.muonSach.sach.anhBia}" class="img-thumbnail"
                                                width="120" alt="Ảnh bìa sách">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Người mượn:</label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static"
                                                th:text="${traSach.muonSach.docGia.tenDocGia}"></p>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Số lượng:</label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static" th:text="${traSach.muonSach.soLuong}"></p>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Thời gian trả:</label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static"
                                                th:text="${#temporals.format(traSach.thoiGianTra, 'dd-MM-yyyy HH:mm')}">
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Tiền phạt:</label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static"
                                                th:text="${#numbers.formatInteger(traSach.tienPhat, 1, 'POINT') + '.000 VNĐ'}">
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Lý do phạt:</label>
                                        <div class="col-sm-9">
                                            <p class="form-control-static"
                                                th:text="${traSach.lyDoPhat != null ? traSach.lyDoPhat : 'Không có'}">
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label font-weight-bold">Trạng thái nộp
                                            phạt:</label>
                                        <div class="col-sm-9">
                                            <span class="badge"
                                                th:classappend="${traSach.daNopPhat != null && traSach.daNopPhat ? 'badge-success' : 'badge-warning'}"
                                                th:text="${traSach.daNopPhat != null && traSach.daNopPhat ? 'Đã nộp' : 'Chưa nộp'}">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr>

                            <div class="row mt-4">
                                <div class="col-12 text-center">
                                    <h5 class="mb-3">Ảnh xác nhận trả sách</h5>
                                    <div>
                                        <img th:if="${traSach.anh != null}" th:src="${traSach.anh}"
                                            class="img-fluid rounded shadow-sm" style="max-height: 600px; width: auto;"
                                            alt="Ảnh xác nhận">
                                        <p th:unless="${traSach.anh != null}" class="text-muted">Không có ảnh xác nhận
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="card-footer text-right">
                                <a th:href="@{/admin/trasach/lichsu}" class="btn btn-primary">Quay lại</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>


<!-- profile.html  21 Nov 2019 03:49:32 GMT -->

</html>