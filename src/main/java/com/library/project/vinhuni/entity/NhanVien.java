package com.library.project.vinhuni.entity;

import java.time.LocalDate;

import com.library.project.vinhuni.dto.NhanVienDto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tblNhanVien")
public class NhanVien {

	public NhanVien() {
	}

	public NhanVien(Integer maNhanVien, String tenNhanVien, String gioiTinh, LocalDate ngaySinh, String soDT,
			String diaChi,
			String chucVu, TaiKhoan taiKhoan) {
		super();
		this.maNhanVien = maNhanVien;
		this.tenNhanVien = tenNhanVien;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.soDT = soDT;
		this.diaChi = diaChi;
		this.chucVu = chucVu;
		this.taiKhoan = taiKhoan;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaNhanVien")
	private Integer maNhanVien;

	@Column(name = "TenNhanVien", length = 100)
	private String tenNhanVien;

	@Column(name = "GioiTinh", length = 10)
	private String gioiTinh;

	@Column(name = "NgaySinh")
	private LocalDate ngaySinh;

	@Column(name = "SoDT", length = 20)
	private String soDT;

	@Column(name = "DiaChi", length = 255)
	private String diaChi;

	@Column(name = "ChucVu", length = 50)
	private String chucVu;

	@OneToOne(mappedBy = "nhanVien")
	private TaiKhoan taiKhoan;

	public Integer getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(Integer maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public String getTenNhanVien() {
		return tenNhanVien;
	}

	public void setTenNhanVien(String tenNhanVien) {
		this.tenNhanVien = tenNhanVien;
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

	public String getSoDT() {
		return soDT;
	}

	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getChucVu() {
		return chucVu;
	}

	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public void setNhanVien(NhanVienDto nhanVienDto) {
		this.chucVu = nhanVienDto.getChucVu();
		this.diaChi = nhanVienDto.getDiaChi();
		this.gioiTinh = nhanVienDto.getGioiTinh();
		this.soDT = nhanVienDto.getSoDt();
		this.tenNhanVien = nhanVienDto.getTenNhanVien();
	}
}