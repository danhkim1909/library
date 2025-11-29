package com.library.project.vinhuni.entity;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.annotations.BatchSize;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tbl_sach")
public class Sach {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ma_sach")
	private Long maSach;

	@NotBlank(message = "Tên sách không được để trống")
	@Size(max = 255, message = "Tên sách không quá 255 ký tự")
	@Column(name = "ten_sach", nullable = false)
	private String tenSach;

	@Column(name = "mo_ta", columnDefinition = "TEXT")
	private String moTa;

	@Column(name = "anh_bia", columnDefinition = "LONGTEXT")
	private String anhBia;

	@Column(name = "nam_xuat_ban")
	private Integer namXuatBan;

	@Column(name = "ngay_nhap")
	private LocalDate ngayNhap;

	@Column(name = "tinh_trang")
	private String tinhTrang;

	@Column(name = "hien")
	private Boolean hien;

	@OneToOne(mappedBy = "sach")
	private Kho kho;

	@NotNull(message = "Nhà xuất bản không được để trống")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ma_nxb")
	private NhaXuatBan nxb;

	@BatchSize(size = 10)
	@NotEmpty(message = "Phải chọn ít nhất một thể loại")
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tbl_sach_the_loai", joinColumns = @JoinColumn(name = "ma_sach"), inverseJoinColumns = @JoinColumn(name = "ma_the_loai"))
	private List<TheLoai> theLoais = new ArrayList<>();

	@BatchSize(size = 10)
	@NotEmpty(message = "Phải chọn ít nhất một tác giả")
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tbl_sach_tac_gia", joinColumns = @JoinColumn(name = "ma_sach"), inverseJoinColumns = @JoinColumn(name = "ma_tac_gia"))
	private List<TacGia> tacGias = new ArrayList<>();

	@OneToMany(mappedBy = "sach", fetch = FetchType.LAZY)
	private List<DanhGia> danhGias = new ArrayList<>();

	public Sach() {

	}

	public Kho getKho() {
		return kho;
	}

	public void setKho(Kho kho) {
		this.kho = kho;
	}

	public Long getMaSach() {
		return maSach;
	}

	public void setMaSach(Long maSach) {
		this.maSach = maSach;
	}

	public String getTenSach() {
		return tenSach;
	}

	public void setTenSach(String tenSach) {
		this.tenSach = tenSach;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getAnhBia() {
		return anhBia;
	}

	public void setAnhBia(String anhBia) {
		this.anhBia = anhBia;
	}

	public Integer getNamXuatBan() {
		return namXuatBan;
	}

	public void setNamXuatBan(Integer namXuatBan) {
		this.namXuatBan = namXuatBan;
	}

	public LocalDate getNgayNhap() {
		return ngayNhap;
	}

	public void setNgayNhap(LocalDate ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public NhaXuatBan getNxb() {
		return nxb;
	}

	public void setNxb(NhaXuatBan nxb) {
		this.nxb = nxb;
	}

	public List<TheLoai> getTheLoais() {
		return theLoais;
	}

	public void setTheLoais(List<TheLoai> theLoais) {
		this.theLoais = theLoais;
	}

	public List<TacGia> getTacGias() {
		return tacGias;
	}

	public void setTacGias(List<TacGia> tacGias) {
		this.tacGias = tacGias;
	}

	public void setHien(Boolean hien) {
		this.hien = hien;
	}

	public Boolean getHien() {
		return this.hien;
	}

	public void setDanhGias(List<DanhGia> danhGias) {
		this.danhGias = danhGias;
	}

	public List<DanhGia> getDanhGias() {
		return danhGias;
	}

	public Integer getSoLuong() {
		if (this.kho != null) {
			return this.kho.getSoLuong();
		}
		return 0;
	}

	public Boolean isMoi() {
		LocalDate homNay = LocalDate.now();
		Long soNgay = ChronoUnit.DAYS.between(ngayNhap, homNay);
		return soNgay <= 30;
	}

}