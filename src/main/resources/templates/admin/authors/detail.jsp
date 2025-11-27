<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">


<!-- profile.html  21 Nov 2019 03:49:30 GMT -->

<head>

<title>Chi tiết tác giả</title>

</head>

<body>
	<section class="section" layout:fragment="content">
		<div class="section-body">
			<div class="row mt-sm-4">
				<div class="col-12 col-md-12 col-lg-12">
					<div class="card author-box">
						<div class="card-body">
							<div class="author-box-center">
								<img alt="image" th:src="${tacGia.anh}"
									class="rounded-circle author-box-picture" style="width:300px; height:300px">
								<div class="clearfix"></div>
								<div class="author-box-name">
									<h2 class="mt-3" th:text ="${tacGia.tenTacGia}">Sarah Smith</h2>
								</div>
							</div>
							<div class="text-center">
								<div class="author-box-description">
									<p th:utext="${tacGia.moTa}">Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur voluptatum alias molestias minus quod
										dignissimos.</p>
								</div>
								<div>
									<h5 th:text="'Năm sinh: ' + ${tacGia.namSinh}">nam sinh</h5>
									<p th:utext="${tacGia.noiDung}">content</p>
								</div>
								<a  th:href="@{/admin/tacgia}" class="btn btn-primary">Quay lại danh sách</a>
								<div class="w-100 d-sm-none"></div>
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