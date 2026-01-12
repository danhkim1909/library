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
                data-parallax='{"y": -50}' th:src="@{/assets/img/breadcrumb/book_left1.png}" alt="">
        </div>
        <div class="bd_shape two wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"y": 30}' th:src="@{/assets/img/breadcrumb/book-left2.png}" alt="">
        </div>
        <div class="bd_shape three wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5"><img
                data-parallax='{"y": -50}' th:src="@{/assets/img/breadcrumb/plane-1.png}" alt="">
        </div>
        <div class="bd_shape four wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"y": 30}' th:src="@{/assets/img/breadcrumb/plan-3.png}" alt="">
        </div>
        <div class="bd_shape five wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"y": 80}' th:src="@{/assets/img/breadcrumb/plan-2.png}" alt="">
        </div>
        <div class="bd_shape six wow fadeInDown layer" data-wow-delay="0.3s" data-depth="0.5"><img
                data-parallax='{"y": -60}' th:src="@{/assets/img/breadcrumb/book-right.png}" alt="">
        </div>
        <div class="bd_shape seven wow fadeInUp layer" data-depth="0.6" data-wow-delay="0.4s"><img
                data-parallax='{"x": 50}' th:src="@{/assets/img/breadcrumb/book-right2.png}" alt="">
        </div>
        <div class="container">
            <h5 class="title wow fadeInUp" data-wow-delay="0.2s">Nội dung bài viết
            </h5>
            <ol class="breadcrumb justify-content-center wow fadeInUp" data-wow-delay="0.3s">
                <li><a href="/">Trang chủ</a></li>
                <li><a href="/baiviet">Bài viết</a></li>
                <li class="active" th:text="${baiViet.tenBaiViet}"></li>
            </ol>
        </div>
    </section>
    <!-- breadcrumb area  -->


    <!-- Blog Area -->
    <section class="blog-details-area bg-gray sec_padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 mb-50">
                    <div class="details-content round-box wow fadeIn">
                        <h3 th:text="${baiViet.tenBaiViet}"></h3>
                        <br>
                        <div>
                            <span>Đăng ngày: </span>
                            <span th:text="${#temporals.format(baiViet.ngayTao, 'dd/MM/yyyy HH:mm')}"></span>
                        </div>
                        <br>
                        <img class="rounded-5 mb-30 img-fluid" th:src="${baiViet.anh}" width="100%" alt="Images">
                        <div th:utext="${baiViet.noiDung}"></div>

                    </div>
                    <div
                        class="social-content d-flex flex-lg-row flex-column gap-3 justify-content-between mb-30 wow fadeInUP">
                        <div class="post-tags">
                            <span>Đăng bởi: </span>
                            <span th:text="${baiViet.nhanVien.tenNhanVien}"></span>
                        </div>
                        <div class="social-item d-flex">
                            <span>Danh mục: </span>
                            <span th:text="${baiViet.danhMucBaiViet.tenDanhMuc}"></span>
                        </div>
                    </div>
                    <div class="comments-item round-box mb-30 wow fadeInUp">
                        <h4 class="mb-35">3 Comments</h4>
                        <div class="comments-content">
                            <div>
                                <img src="assets/img/blog/face-01.png" alt="Face">
                            </div>
                            <div class="comments-text">
                                <div class="d-flex flex-wrap justify-content-between mb-20">
                                    <div>
                                        <a href="#" class="admin-title"> Issac Wise </a>
                                        <p class="post-time">Jan 01, 2024at 2:14 pm</p>
                                    </div>
                                    <a class="sub-bold-1 comment-reply" data-bs-toggle="collapse"
                                        href="#replyColllapse01" role="button" aria-expanded="false"
                                        aria-controls="replyColllapse01">Reply <i
                                            class="fa-solid fa-arrow-right"></i></a>
                                </div>
                                <p class="text-area small-2">Wouldn’t it be better practice to use get_the_title(..)
                                    in this case? directly accessing the post object’s data member would bypass
                                    applying filters and enforcing protected and private settings, unless that’s
                                    explicitly desired.</p>
                                <div class="collapse" id="replyColllapse01">
                                    <div class="reply-box">
                                        <input type="text" class="form-control" placeholder="Write A  Comment">
                                        <button><img src="assets/img/blog/Send-Icon.svg" alt=""></button>
                                    </div>
                                </div>
                                <hr>
                                <div class="comments-content">
                                    <div>
                                        <img src="assets/img/blog/face-02.png" alt="Face">
                                    </div>
                                    <div class="reply-cont">
                                        <div class="d-flex flex-wrap justify-content-between mb-20">
                                            <div>
                                                <a href="#" class="admin-title"> Ellen Ibarra </a>
                                                <p class="post-time">October 13, 2024</p>
                                            </div>
                                            <a class="sub-bold-1 comment-reply" data-bs-toggle="collapse"
                                                href="#replyColllapse02" role="button" aria-expanded="false"
                                                aria-controls="replyColllapse02">Reply <i
                                                    class="fa-solid fa-arrow-right"></i></a>
                                        </div>
                                        <p class="text-area-2 small-2">Thanks Demo User for Wouldn’t it be better
                                            practice to use get_the_title.</p>
                                        <div class="collapse" id="replyColllapse02">
                                            <div class="reply-box">
                                                <input type="text" class="form-control" placeholder="Write A  Comment">
                                                <button><img src="assets/img/blog/Send-Icon.svg" alt=""></button>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comments-content">
                            <div>
                                <img src="assets/img/blog/face-03.png" alt="Face">
                            </div>
                            <div class="comments-text">
                                <div class="d-flex flex-wrap justify-content-between mb-20">
                                    <div>
                                        <a href="#" class="admin-title"> Tisa Person </a>
                                        <p class="post-time">October 13, 2024</p>
                                    </div>
                                    <a class="sub-bold-1 comment-reply" data-bs-toggle="collapse"
                                        href="#replyColllapse03" role="button" aria-expanded="false"
                                        aria-controls="replyColllapse03">Reply <i
                                            class="fa-solid fa-arrow-right"></i></a>
                                </div>
                                <p class="small-2">Wouldn’t it be better practice to use get_the_title(..) in this
                                    case? directly accessing the post object’s data member would bypass applying
                                    filters and enforcing protected and private settings, unless that’s explicitly
                                    desired.</p>
                                <div class="collapse" id="replyColllapse03">
                                    <div class="reply-box">
                                        <input type="text" class="form-control" placeholder="Write A  Comment">
                                        <button><img src="assets/img/blog/Send-Icon.svg" alt=""></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="reply-item round-box wow fadeInUp">
                        <h4>Leave a Reply </h4>
                        <p class="reply-text mb-35">Your email address will not be published. Required fields are
                            marked *</p>

                        <form class="get_quote_form row" action="#" method="post">
                            <div class="col-md-6 form-group">
                                <input type="text" class="form-control" id="name" required>
                                <label class="floating-label">Full Name *</label>
                            </div>
                            <div class="col-md-6 form-group">
                                <input type="email" class="form-control" id="email" required>
                                <label class="floating-label">Email *</label>
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" id="web" required>
                                <label class="floating-label">Website (Optional)</label>
                            </div>
                            <div class="col-md-12 form-group">
                                <textarea class="form-control message" required></textarea>
                                <label class="floating-label">Comment type...</label>
                            </div>
                            <div class="col-md-12 form-group reply-text d-flex">
                                <div class="form-check check_input ">


                                    <input class="form-check-input" type="checkbox" id="fruit1" name="fruit-1"
                                        value="Apple">
                                    <label class="form-check-label" for="fruit1">Save my name, email, and website in
                                        this browser for the
                                        next time I comment.
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-12 form-group">
                                <button class="thm_btn" type="submit">Post Comment</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-6 col-md-8">
                    <div class="blog-right-content mb-50 px-lg-4 wow fadeInLeft">

                        <h4 class="blog-title mb-30">Bài viết cùng danh mục</h4>
                        <div class="recent-news mb-50">
                            <div class="news-item" th:each="bv : ${baiVietTuongu}">
                                <img th:src="${bv.anh}" alt="Images">
                                <div>
                                    <a class="news-title" th:href="@{/baiviet/{id}(id=${bv.maBaiViet})}"
                                        th:text="${bv.tenBaiViet}"></a>
                                    <p class="news-date"><i class="fa-solid fa-calendar-days"></i>
                                        <span th:text="${#temporals.format(bv.ngayTao, 'dd/MM/yyyy HH:mm')}"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Area -->
</body>

</html>

<script th:inline="javascript" layout:fragment="scripts">

</script>