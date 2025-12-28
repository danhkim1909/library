package com.library.project.vinhuni.dto;

import java.time.LocalDate;

import com.library.project.vinhuni.entity.NhanVien;
import com.library.project.vinhuni.entity.TaiKhoan;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class NhanVienDto {
	@NotBlank(message = "Tên hiển thị không được để trống")
	@Size(max = 100, message = "Tên hiển thị không để quá dài")
	private String tenNhanVien;

	@NotBlank(message = "Địa chỉ không được để trống")
	@Size(max = 255, message = "Địa chỉ không để quá dài")
	private String diaChi;

	@NotBlank(message = "email không được để trống")
	@Email(message = "email không hợp lệ")
	@Size(max = 100, message = "email không để quá dài")
	private String email;

	@Size(max = 20, message = "Số điện thoại không để quá dài")
	private String soDt;

	@NotBlank(message = "Giới tính không được để trống")
	private String gioiTinh;

	private LocalDate ngaySinh;
	@NotBlank(message = "Chức vụ không được để trống")
	@Size(max = 50, message = "Chức vụ không để quá dài")
	private String chucVu;

	@NotBlank(message = "Tên đăng nhập không được để trống")
	@Pattern(regexp = "^(?!\\d+$).+$", message = "Tên đăng nhập không được toàn số")
	@Size(max = 50, message = "Tên đăng nhập không để quá dài")
	private String tenDangNhap;

	@NotBlank(message = "Mật khẩu không được để trống")
	@Size(min = 8, max = 16, message = "Mật khẩu phải từ 8 đến 16 ký tự")
	private String matKhau;

	public String getTenNhanVien() {
		return tenNhanVien;
	}

	public void setTenNhanVien(String tenNhanVien) {
		this.tenNhanVien = tenNhanVien;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSoDt() {
		return soDt;
	}

	public void setSoDt(String soDt) {
		this.soDt = soDt;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public LocalDate getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(LocalDate ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getChucVu() {
		return chucVu;
	}

	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public void setNhanVien(NhanVien nhanVien, TaiKhoan taiKhoan) {

		this.tenNhanVien = nhanVien.getTenNhanVien();
		this.diaChi = nhanVien.getDiaChi();
		this.soDt = nhanVien.getSoDT();
		this.email = taiKhoan.getEmail();
		this.gioiTinh = nhanVien.getGioiTinh();
		this.ngaySinh = nhanVien.getNgaySinh();
		this.chucVu = nhanVien.getChucVu();

		this.tenDangNhap = taiKhoan.getTenDangNhap();
		this.matKhau = null;
	}
}