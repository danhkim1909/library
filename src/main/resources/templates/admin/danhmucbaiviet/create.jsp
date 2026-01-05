<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">

<head>
    <title>Thêm danh mục bài viết</title>
</head>

<body>
    <section class="section" layout:fragment="content">
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Thêm danh mục bài viết</h4>
                        </div>
                        <form class="card-body" th:object="${danhMucBaiViet}" method="post"
                            th:action="@{/admin/danhmucbaiviet/create}">
                            <div class="form-group">
                                <label>Tên danh mục</label>
                                <input type="text" class="form-control" th:field="*{tenDanhMuc}">
                                <div class="text-danger" th:if="${#fields.hasErrors('tenDanhMuc')}"
                                    th:errors="*{tenDanhMuc}"></div>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea class="form-control" th:field="*{moTa}"></textarea>
                                <div class="text-danger" th:if="${#fields.hasErrors('moTa')}" th:errors="*{moTa}"></div>
                            </div>
                            <div class="form-group">
                                <label class="d-block">Hiển thị</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" th:field="*{hien}" id="hien">
                                    <label class="form-check-label" for="hien"> Hiển thị </label>
                                </div>
                            </div>
                            <div class="card-footer text-right">
                                <button class="btn btn-primary mr-1" type="submit">Lưu</button>
                                <a class="btn btn-secondary" th:href="@{/admin/danhmucbaiviet}">Quay lại</a>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </section>
</body>

</html>