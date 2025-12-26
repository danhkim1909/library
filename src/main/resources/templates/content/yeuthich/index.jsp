<!doctype html>
<html lang="en" layout:decorate="~{content/layout}">


<!-- Mirrored from html-template.spider-themes.net/bookjar/my-following-authors.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:14 GMT -->

<head>

    <title>Bookjar</title>
</head>

<body layout:fragment="content">

    <div class="cart-header-separator"></div>


    <!-- Dashboard area -->
    <section class="bj_account_dashboard" data-bg-color="#f5f5f5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="account_dashboard_body">
                        <div class="account_dashboard_content">
                            <div class="account_dashboard_content_header">Danh sách
                                yêu thích</div>
                            <div class="row gy-3 follow_author_list">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">STT</th>
                                                    <th scope="col">Ảnh bìa</th>
                                                    <th scope="col">Tên sách</th>
                                                    <th scope="col">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr th:each="yeuThich, i : ${yeuThichs}">
                                                    <td th:text="${i.count}">stt</td>
                                                    <td><img th:src="${yeuThich.sach.anhBia}"
                                                            th:alt="${yeuThich.sach.tenSach}" width="100"></td>
                                                    <td><a th:href="@{/sach/{id}(id=${yeuThich.sach.maSach})}"
                                                            class="author_name" th:text="${yeuThich.sach.tenSach}"></a>
                                                    </td>
                                                    <td>
                                                        <form th:action="@{/yeuthich}" method="post">
                                                            <input type="hidden" name="idSach"
                                                                th:value="${yeuThich.sach.maSach}">
                                                            <button type="submit" class="btn btn-danger">
                                                                <i class="fa fa-trash"></i>
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
                </div>

            </div>
        </div>
    </section>
    <!-- Dashboard area -->
</body>


<!-- Mirrored from html-template.spider-themes.net/bookjar/my-following-authors.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Oct 2025 11:52:16 GMT -->

</html>