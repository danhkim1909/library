package com.library.project.vinhuni.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Positive;

@Entity
@Table(name = "tblMuonSach")
public class MuonSach {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaMuonSach")
	private Long maMuonSach;

	@Column(name = "ThoiGianMuon")
	private LocalDateTime thoiGianMuon;

	@Positive(message = "Số lượng phải là số dương")
	@Column(name = "SoLuong", columnDefinition = "SMALLINT")
	private Integer soLuong;

	@Column(name = "XacNhan", nullable = true)
	private Boolean xacNhan;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaSach")
	private Sach sach;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaDocGia")
	private DocGia docGia;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaNhanVien")
	private NhanVien nhanVien;

	@OneToOne(mappedBy = "muonSach")
	private TraSach traSach;

	public TraSach getTraSach() {
		return traSach;
	}

	public void setTraSach(TraSach traSach) {
		this.traSach = traSach;
	}

	public Long getMaMuonSach() {
		return maMuonSach;
	}

	public void setMaMuonSach(Long maMuonSach) {
		this.maMuonSach = maMuonSach;
	}

	public LocalDateTime getThoiGianMuon() {
		return thoiGianMuon;
	}

	public void setThoiGianMuon(LocalDateTime thoiGianMuon) {
		this.thoiGianMuon = thoiGianMuon;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public Boolean getXacNhan() {
		return xacNhan;
	}

	public void setXacNhan(Boolean xacNhan) {
		this.xacNhan = xacNhan;
	}

	public Sach getSach() {
		return sach;
	}

	public void setSach(Sach sach) {
		this.sach = sach;
	}

	public DocGia getDocGia() {
		return docGia;
	}

	public void setDocGia(DocGia docGia) {
		this.docGia = docGia;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public Boolean isDaTra() {

		TraSach traSach = this.getTraSach();

		if (traSach == null) {
			return false;
		}

		if (traSach.getXacNhan() == true) {
			return true;
		}

		return false;

	}
}
