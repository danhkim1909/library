<!DOCTYPE html>
<html layout:decorate="~{admin/layout}" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
    xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <title>Quản lý bài viết</title>
</head>

<body>
    <section class="section" layout:fragment="content">
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Bài viết</h4>
                        </div>
                        <div class="card-body">
                            <a class="section-title mt-0 btn btn-outline-success"
                                th:href="@{/admin/baiviet/create}">Thêm
                                bài viết mới</a>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Ảnh</th>
                                        <th scope="col">Tiêu đề</th>
                                        <th scope="col">Danh mục</th>
                                        <th scope="col">Người viết</th>
                                        <th scope="col">Ngày đăng</th>
                                        <th class="col-2" scope="col">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr th:each="baiViet, i : ${baiViets.content}" class="">
                                        <th scope="row" th:text="${i.count}">STT</th>

                                        <td><img th:src="${baiViet.anh}" alt="Ảnh"
                                                style="width: 100px; height: auto; object-fit: cover;">
                                        </td>

                                        <td th:text="${baiViet.tenBaiViet}"></td>

                                        <td th:text="${baiViet.danhMucBaiViet.tenDanhMuc}"></td>


                                        <td th:text="${baiViet.nhanVien.tenNhanVien}"></td>

                                        <td th:text="${#temporals.format(baiViet.ngayTao, 'dd/MM/yyyy')}"></td>

                                        <td class="d-flex align-items-center gap-2"><a
                                                th:href="@{/admin/baiviet/update/{id}(id=${baiViet.maBaiViet})}"
                                                class="btn btn-outline-info btn-sm">Sửa</a>
                                            <form class="d-inline"
                                                th:action="@{/admin/baiviet/show/{id}(id=${baiViet.maBaiViet})}"
                                                method="post">
                                                <button type="submit"
                                                    th:class="${baiViet.hien ? 'btn btn-outline-warning btn-sm' : 'btn btn-outline-danger btn-sm'}">
                                                    <i th:class="${baiViet.hien ? 'fa fa-eye' : 'fa fa-eye-slash'}"></i>
                                                    <span th:text="${baiViet.hien ? 'Đang hiện' : 'Đã ẩn'}"></span>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>