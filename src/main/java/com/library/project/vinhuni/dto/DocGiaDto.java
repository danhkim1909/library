package com.library.project.vinhuni.dto;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.TaiKhoan;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class DocGiaDto {

	@NotBlank(message = "Tên hiển thị không được để trống")
	@Size(max = 100, message = "Tên hiển thị không để quá dài")
	private String tenDocGia;

	@NotBlank(message = "Địa chỉ không được để trống")
	@Size(max = 255, message = "Địa chỉ không để quá dài")
	private String diaChi;

	@Size(max = 20, message = "Số điện thoại không để quá dài")
	private String soDt;
	private String gioiTinh;
	private String lop;

	@NotBlank(message = "Tên đăng nhập không được để trống")
	@Size(max = 50, message = "Tên đăng nhập không để quá dài")
	private String tenDangNhap;

	@NotBlank(message = "Mật khẩu không được để trống")
	@Size(min = 8, max = 16, message = "Mật khẩu phải từ 8 đến 16 ký tự")
	private String matKhau;

	public String getTenDocGia() {
		return tenDocGia;
	}

	public void setTenDocGia(String tenDocGia) {
		this.tenDocGia = tenDocGia;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
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

	public String getLop() {
		return lop;
	}

	public void setLop(String lop) {
		this.lop = lop;
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

	public void setDocGia(DocGia docGia, TaiKhoan taiKhoan) {
		this.tenDocGia = docGia.getTenDocGia();
		this.diaChi = docGia.getDiaChi();
		this.soDt = docGia.getSoDT();
		this.gioiTinh = docGia.getGioiTinh();
		this.lop = docGia.getLop();

		this.tenDangNhap = taiKhoan.getTenDangNhap();
		this.matKhau = null;
	}

}
