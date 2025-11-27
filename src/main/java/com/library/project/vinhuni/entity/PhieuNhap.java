package com.library.project.vinhuni.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "tblPhieuNhap")
public class PhieuNhap {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long maPhieuNhap;

	private LocalDateTime ngayNhap = LocalDateTime.now();
	private String ghiChu;

	@ManyToOne()
	@JoinColumn(name = "maNhanVien")
	private NhanVien nhanVien;

	@OneToMany(mappedBy = "phieuNhap", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ChiTietPhieuNhap> chiTietList = new ArrayList<>();

	public PhieuNhap() {
	}

	public PhieuNhap(String ghiChu, NhanVien nhanVien, List<ChiTietPhieuNhap> chiTietList) {
		this.ghiChu = ghiChu;
		this.nhanVien = nhanVien;
		this.chiTietList = chiTietList;
	}

	public Long getMaPhieuNhap() {
		return maPhieuNhap;
	}

	public LocalDateTime getNgayNhap() {
		return ngayNhap;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public List<ChiTietPhieuNhap> getChiTietList() {
		return chiTietList;
	}

	public void setMaPhieuNhap(Long maPhieuNhap) {
		this.maPhieuNhap = maPhieuNhap;
	}

	public void setNgayNhap(LocalDateTime ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public void setChiTietList(List<ChiTietPhieuNhap> chiTietList) {
		this.chiTietList = chiTietList;
	}
}