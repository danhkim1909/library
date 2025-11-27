<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
    xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
    layout:decorate="~{admin/layout}">

<head>
    <title>Quản lý Tài khoản - Otika Admin</title>
</head>

<body>
    <section class="section" layout:fragment="content", style = "font-size: 15px">
        <div class="section-body">

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Quản lý Tài khoản</h4>
                            <div class="card-header-action">
                                <a th:href="@{/admin/nguoidung/create/docgia}" class="btn btn-primary mr-2">
                                    <i class="fas fa-user-plus"></i> Thêm Độc giả
                                </a>
                                <a th:href="@{/admin/nguoidung/create/nhanvien}" class="btn btn-info">
                                    <i class="fas fa-user-tie"></i> Thêm Nhân viên
                                </a>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-striped table-md">
                                    
                                    <thead>
                                        <tr>
                                            <th style="width: 70px;">Ảnh</th> 
                                            <th style="width: 200px;">Tên & TK</th> 
                                            <th style="width: 100px;">Loại TK</th> 
                                            <th>Thông tin chi tiết</th> 
                                            <th style="width: 50px;">Trạng thái</th>
                                            <th style="width: 100px;">Thao tác</th> </tr>
                                    </thead>

                                    <tbody>
                                        <tr th:each="taiKhoan : ${taiKhoans}">
                                            
                                            <td>
                                                <img alt="Ảnh đại diện" width="50" height="50"
                                                    src="https://img7.thuthuatphanmem.vn/uploads/2024/07/09/avatar-facebook-mac-dinh-de-thuong-nhat_084649042.jpg"
                                                    class="rounded-circle" style="object-fit: cover;">
                                            </td>

                                            <td>
                                                <div class="font-weight-600" 
                                                     th:text="${taiKhoan.loaiTaiKhoan == 'docgia' ? taiKhoan.docGia.tenDocGia : taiKhoan.nhanVien.tenNhanVien}">Tên Người Dùng</div>
                                                <div class="text-small text-muted" 
                                                     th:text="${taiKhoan.tenDangNhap}">ten_dang_nhap</div>
                                            </td>

                                            <td>
                                                <div th:class="${taiKhoan.loaiTaiKhoan == 'docgia' ? 'badge badge-primary' : 'badge badge-info'}"
                                                     th:text="${taiKhoan.loaiTaiKhoan == 'docgia' ? 'Độc giả' : 'Nhân viên'}">Loại</div>
                                            </td>

                                            <td>
                                                <div th:text="${'GT: ' + (taiKhoan.loaiTaiKhoan == 'docgia' ? taiKhoan.docGia.gioiTinh : taiKhoan.nhanVien.gioiTinh)}">Giới tính</div>
                                                <div class="text-small text-muted" 
                                                     th:text="${taiKhoan.loaiTaiKhoan == 'docgia' ? taiKhoan.docGia.diaChi : taiKhoan.nhanVien.diaChi}">Địa chỉ</div>
                                            </td>

                                            <td>
                                                <form th:action="@{/admin/nguoidung/show}" method="post">
                                                    <input type="hidden" name="tenDangNhap" th:value="${taiKhoan.tenDangNhap}" />
                                                    <button type="submit" 
                                                            th:class="${taiKhoan.trangThai ? 'badge badge-success btn-sm p-2 border-0' : 'badge badge-danger btn-sm p-2 border-0'}" 
                                                            style="width: 100%; cursor: pointer;"
                                                            th:title="${taiKhoan.trangThai ? 'Nhấn để khóa' : 'Nhấn để mở khóa'}">
                                                        <i th:class="${taiKhoan.trangThai ? 'fas fa-unlock' : 'fas fa-lock'}"></i>
                                                        <span th:text="${taiKhoan.trangThai ? 'Hoạt động' : 'Đã khóa'}"></span>
                                                    </button>
                                                </form>
                                            </td>
                                            
                                            <td>
                                                <form th:action="@{/admin/nguoidung/update}" method="post">
                                                    <input type="hidden" name="tenDangNhap" th:value="${taiKhoan.tenDangNhap}" />
                                                    <button type="submit" class="btn btn-sm btn-outline-info" title="Sửa thông tin">
                                                        <i class="fas fa-edit"></i> Sửa
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

    </section>
</body>
</html>