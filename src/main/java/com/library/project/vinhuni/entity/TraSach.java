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

@Entity
@Table(name = "tblTraSach")
public class TraSach {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaTraSach")
	private Long maTraSach;

	@Column(name = "Anh", columnDefinition = "LONGTEXT", nullable = true)
	private String anh;

	@Column(name = "ThoiGianTra")
	private LocalDateTime thoiGianTra;

	@Column(name = "XacNhan")
	private Boolean xacNhan;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaMuonSach")
	private MuonSach muonSach;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaNhanVien")
	private NhanVien nhanVien;

	public Long getMaTraSach() {
		return maTraSach;
	}

	public void setMaTraSach(Long maTraSach) {
		this.maTraSach = maTraSach;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public LocalDateTime getThoiGianTra() {
		return thoiGianTra;
	}

	public void setThoiGianTra(LocalDateTime thoiGianTra) {
		this.thoiGianTra = thoiGianTra;
	}

	public Boolean getXacNhan() {
		return xacNhan;
	}

	public void setXacNhan(Boolean xacNhan) {
		this.xacNhan = xacNhan;
	}

	public MuonSach getMuonSach() {
		return muonSach;
	}

	public void setMuonSach(MuonSach muonSach) {
		this.muonSach = muonSach;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

}
