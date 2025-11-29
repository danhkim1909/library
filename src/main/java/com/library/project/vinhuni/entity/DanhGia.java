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
import jakarta.persistence.Table;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tblDanhGia")
public class DanhGia {

	@Id
	@Column(name = "MaDanhGia")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer maDanhGia;

	@Positive(message = "Xin lỗi bạn, có lỗi gì đó vừa xảy ra")
	@Column(name = "SoSao", columnDefinition = "SMALLINT")
	private Integer soSao;

	@Size(max = 500, message = "Đánh giá không được quá dài")
	@Column(name = "NoiDung", length = 500)
	private String noiDung;

	@Column(name = "ThoiGian")
	private LocalDateTime thoiGian;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaSach")
	private Sach sach;

	@ManyToOne
	@JoinColumn(name = "MaDocGia")
	private DocGia docGia;

	public Integer getMaDanhGia() {
		return maDanhGia;
	}

	public void setMaDanhGia(Integer maDanhGia) {
		this.maDanhGia = maDanhGia;
	}

	public Integer getSoSao() {
		return soSao;
	}

	public void setSoSao(Integer soSao) {
		this.soSao = soSao;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public LocalDateTime getThoiGian() {
		return thoiGian;
	}

	public void setThoiGian(LocalDateTime thoiGian) {
		this.thoiGian = thoiGian;
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

}
