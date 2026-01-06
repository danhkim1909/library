<!DOCTYPE html>
<html layout:decorate="~{content/layout}">

<head>
    <meta charset="UTF-8">
    <title>Bài viết</title>
</head>

<body layout:fragment="content">
    <!-- breadcrumb area  -->
    <section class="bj_breadcrumb_area text-center banner_animation_03" data-bg-color="#f5f5f5">
        <div class="bg_one" data-bg-image="assets/img/breadcrumb/breadcrumb_banner_bg.png"></div>
        <div class="bd_shape one wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5"><img
                data-parallax='{"y": -50}' src="assets/img/breadcrumb/book_left1.png" alt="">
        </div>
        <div class="bd_shape two wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"y": 30}' src="assets/img/breadcrumb/book-left2.png" alt="">
        </div>
        <div class="bd_shape three wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5"><img
                data-parallax='{"y": -50}' src="assets/img/breadcrumb/plane-1.png" alt="">
        </div>
        <div class="bd_shape four wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"y": 30}' src="assets/img/breadcrumb/plan-3.png" alt="">
        </div>
        <div class="bd_shape five wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"y": 80}' src="assets/img/breadcrumb/plan-2.png" alt="">
        </div>
        <div class="bd_shape six wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5"><img
                data-parallax='{"y": -60}' src="assets/img/breadcrumb/book-right.png" alt="">
        </div>
        <div class="bd_shape seven wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"x": 50}' src="assets/img/breadcrumb/book-right2.png" alt="">
        </div>
        <div class="container">
            <h2 class="title wow fadeInUp" data-wow-delay="0.2s">Blog List</h2>
            <ol class="breadcrumb justify-content-center wow fadeInUp" data-wow-delay="0.3s">
                <li><a href="/">Trang chủ</a></li>
                <li class="active">Bài viết</li>
            </ol>
        </div>
    </section>
    <!-- breadcrumb area  -->

    <!-- Blog Area -->
    <section class="blog-area bg-gray sec_padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-8">
                    <div class="col-md-12 mb-5" th:each="baiViet : ${truyVan.content}">
                        <div class="blog-widget box-blog wow fadeInUp">
                            <img class="featured-img" th:src="${baiViet.anh}" th:alt="${baiViet.tenBaiViet}">
                            <div class="blog-content">
                                <p class="blog-text dot-sep"><i class="icon_tag_alt"></i><span
                                        th:text="${baiViet.danhMucBaiViet.tenDanhMuc}"></span>
                                </p>
                                <a href="blog-details.html" class="title">
                                    <h4 th:text="${baiViet.tenBaiViet}"></h4>
                                </a>
                                <div class="blog-sub-text">
                                    <p class="mb-20" th:text="${baiViet.moTa}"></p>
                                    <i class="fa-solid fa-user"></i>
                                    <a th:text="${baiViet.nhanVien.tenNhanVien}"></a>
                                    <i class="fa-solid fa-calendar-days"></i>
                                    <span th:text="${#temporals.format(baiViet.ngayTao, 'dd/MM/yyyy')}"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Page Link -->
                    <div th:if="${truyVan.totalPages > 1}" class="text-center">
                        <nav aria-label="...">
                            <ul class="pagination pagi-content round-box">
                                <li class="page-item" th:if="${!truyVan.isFirst()}">
                                    <a class="page-link"
                                        th:href="@{/baiviet(page=${truyVan.number}, category=${category}, keyword=${keyword})}"><i
                                            class="ti-angle-left"></i>Trước</a>
                                </li>
                                <li th:each="i : ${#numbers.sequence(1, truyVan.totalPages)}" class="page-item"
                                    th:classappend="${truyVan.number + 1 == i ? 'active' : ''}">
                                    <a class="page-link"
                                        th:href="@{/baiviet(page=${i}, category=${category}, keyword=${keyword})}"
                                        th:text="${i}"></a>
                                </li>
                                <li class="page-item" th:if="${!truyVan.isLast()}">
                                    <a class="page-link"
                                        th:href="@{/baiviet(page=${truyVan.number + 2}, category=${category}, keyword=${keyword})}">Sau<i
                                            class="ti-angle-right"></i></a>
                                </li>
                            </ul>
                        </nav>
                        <!-- /Page Link -->
                    </div>
                </div>

                <!--  Sidebar -->
                <div class="col-xl-4">
                    <div class="blog-right-content mb-50 px-xl-4 wow fadeInLeft">
                        <form th:action="@{/baiviet}" class="input-group mb-50" id="searchForm">
                            <input type="hidden" name="category" th:value="${category}">
                            <input type="text" name="keyword" id="keyword" th:value="${keyword}"
                                placeholder="Tìm bài viết">
                            <a id="searchBtn" class="search-icon"><i class="fas fa-search"></i></a>
                        </form>

                        <h4 class="blog-title mb-30">Danh mục</h4>

                        <ul class="list-unstyled category_list">
                            <li><a th:class="${category == 0 ? 'text-primary' : ''}"
                                    th:href="@{/baiviet(category = 0, keyword = ${keyword})}">Tất cả
                                </a></li>
                            <li th:each="danhMuc : ${danhMucBaiViets}"><a
                                    th:class="${category == danhMuc.maDanhMuc ? 'text-primary' : ''}"
                                    th:href="@{/baiviet(category = ${danhMuc.maDanhMuc}, keyword = ${keyword})}">
                                    <span th:text="${danhMuc.tenDanhMuc}"></span>
                                </a></li>
                        </ul>

                        <h4 class="blog-title mb-30">Recent News</h4>
                        <div class="recent-news mb-50">
                            <div class="news-item">
                                <img src="assets/img/blog/news-01.png" alt="Images">
                                <div>
                                    <a class="news-title" href="blog-details.html">Is It Worth Buying A Premium Form
                                        Builder.</a>
                                    <p class="news-date"><i class="fa-solid fa-calendar-days"></i> 12 November, 2024
                                    </p>
                                </div>
                            </div>
                            <div class="news-item">
                                <img src="assets/img/blog/news-02.png" alt="Images">
                                <div>
                                    <a class="news-title" href="blog-details.html">Is It Worth Buying A Premium Form
                                        Builder.</a>
                                    <p class="news-date"><i class="fa-solid fa-calendar-days"></i> 12 November, 2024
                                    </p>
                                </div>
                            </div>
                            <div class="news-item">
                                <img src="assets/img/blog/news-03.png" alt="Images">
                                <div>
                                    <a class="news-title" href="blog-details.html">How to Optimize Your Knowledge
                                        Base
                                        with
                                        EazyDocs</a>
                                    <p class="news-date"><i class="fa-solid fa-calendar-days"></i> 12 November, 2024
                                    </p>
                                </div>
                            </div>
                            <div class="news-item">
                                <img src="assets/img/blog/news-04.png" alt="Images">
                                <div>
                                    <a class="news-title" href="blog-details.html">Master Productivity &
                                        Collaboration!</a>
                                    <p class="news-date"><i class="fa-solid fa-calendar-days"></i> 12 November, 2024
                                    </p>
                                </div>
                            </div>
                        </div>
                        <h4 class="blog-title mb-30">Tags</h4>
                        <div class="tags-item d-flex flex-wrap mb-50">
                            <a class="tags-btn" href="#">travel</a>
                            <a class="tags-btn" href="#">help desk</a>
                            <a class="tags-btn" href="#">photography</a>
                            <a class="tags-btn" href="#">lifestyle</a>
                            <a class="tags-btn" href="#">WordPress</a>
                            <a class="tags-btn" href="#">development</a>
                            <a class="tags-btn" href="#">support</a>
                            <a class="tags-btn" href="#">JavaScript</a>
                            <a class="tags-btn" href="#">ecommerce</a>
                            <a class="tags-btn" href="#">WordPress</a>
                        </div>
                        <h4 class="blog-title mb-30">Instagram</h4>
                        <div class="instagram-gallery-widget ">
                            <a href="#" class="instagram-item">
                                <img src="assets/img/blog/Instagram-01.png" alt="">
                            </a>
                            <a href="#" class="instagram-item">
                                <img src="assets/img/blog/Instagram-02.png" alt="">
                            </a>
                            <a href="#" class="instagram-item">
                                <img src="assets/img/blog/Instagram-03.png" alt="">
                            </a>
                            <a href="#" class="instagram-item">
                                <img src="assets/img/blog/Instagram-04.png" alt="">
                            </a>
                            <a href="#" class="instagram-item">
                                <img src="assets/img/blog/Instagram-05.png" alt="">
                            </a>
                            <a href="#" class="instagram-item">
                                <img src="assets/img/blog/Instagram-06.png" alt="">
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /sidbar -->
            </div>
        </div>
    </section>
    <!-- Blog Area -->
</body>

</html>

<script th:inline="javascript" layout:fragment="scripts">
    document.getElementById("searchBtn").addEventListener("click", function () {
        document.getElementById("searchForm").submit();
    });
</script>