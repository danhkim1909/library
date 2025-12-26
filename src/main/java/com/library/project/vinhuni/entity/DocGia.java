package com.library.project.vinhuni.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.library.project.vinhuni.dto.DocGiaDto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tblDocGia")
public class DocGia {

	public DocGia() {
	}

	public DocGia(Integer maDocGia, String tenDocGia, String gioiTinh, String lop, String soDT, String diaChi,
			LocalDate ngayDangKy, TaiKhoan taiKhoan) {
		super();
		this.maDocGia = maDocGia;
		this.tenDocGia = tenDocGia;
		this.gioiTinh = gioiTinh;
		this.lop = lop;
		this.soDT = soDT;
		this.diaChi = diaChi;
		this.ngayDangKy = ngayDangKy;
		this.taiKhoan = taiKhoan;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaDocGia")
	private Integer maDocGia;

	@Column(name = "TenDocGia", length = 100)
	private String tenDocGia;

	@Column(name = "GioiTinh", length = 10)
	private String gioiTinh;

	@Column(name = "Lop", length = 50)
	private String lop;

	@Column(name = "SoDT", length = 20)
	private String soDT;

	@Column(name = "DiaChi", length = 255)
	private String diaChi;

	@Column(name = "NgayDangKy")
	private LocalDate ngayDangKy;

	@OneToOne(mappedBy = "docGia")
	private TaiKhoan taiKhoan;

	@OneToMany(mappedBy = "docGia")
	private List<YeuThich> yeuThichs = new ArrayList<>();

	public Integer getMaDocGia() {
		return maDocGia;
	}

	public void setMaDocGia(Integer maDocGia) {
		this.maDocGia = maDocGia;
	}

	public String getTenDocGia() {
		return tenDocGia;
	}

	public void setTenDocGia(String tenDocGia) {
		this.tenDocGia = tenDocGia;
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

	public LocalDate getNgayDangKy() {
		return ngayDangKy;
	}

	public void setNgayDangKy(LocalDate ngayDangKy) {
		this.ngayDangKy = ngayDangKy;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public void setDocGia(DocGiaDto docGiaDto) {
		this.diaChi = docGiaDto.getDiaChi();
		this.gioiTinh = docGiaDto.getGioiTinh();
		this.lop = docGiaDto.getLop();
		this.soDT = docGiaDto.getSoDt();
		this.tenDocGia = docGiaDto.getTenDocGia();
	}
}