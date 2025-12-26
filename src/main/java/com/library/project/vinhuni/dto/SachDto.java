package com.library.project.vinhuni.dto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TacGia;
import com.library.project.vinhuni.entity.TheLoai;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class SachDto {

	private Long maSach;

	@NotBlank(message = "Tên sách không được để trống")
	@Size(max = 255, message = "Tên sách không quá 255 ký tự")
	private String tenSach;

	private String moTa;

	private String anhBia;

	private Integer namXuatBan;

	private LocalDate ngayNhap;

	private String tinhTrang;

	@NotNull(message = "Nhà xuất bản không được để trống")
	private Integer nxbId;

	@NotEmpty(message = "Phải chọn ít nhất một thể loại")
	private List<Integer> theLoaiIds = new ArrayList<>();

	@NotEmpty(message = "Phải chọn ít nhất một tác giả")
	private List<Integer> tacGiaIds = new ArrayList<>();

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

	public Integer getNxbId() {
		return nxbId;
	}

	public void setNxbId(Integer nxbId) {
		this.nxbId = nxbId;
	}

	public List<Integer> getTheLoaiIds() {
		return theLoaiIds;
	}

	public void setTheLoaiIds(List<Integer> theLoaiIds) {
		this.theLoaiIds = theLoaiIds;
	}

	public List<Integer> getTacGiaIds() {
		return tacGiaIds;
	}

	public void setTacGiaIds(List<Integer> tacGiaIds) {
		this.tacGiaIds = tacGiaIds;
	}

	public void getDtoFromSach(Sach sach) {

		this.setMaSach(sach.getMaSach());
		this.setTenSach(sach.getTenSach());
		this.setMoTa(sach.getMoTa());
		this.setAnhBia(sach.getAnhBia());
		this.setNamXuatBan(sach.getNamXuatBan());
		this.setNgayNhap(sach.getNgayNhap());
		this.setTinhTrang(sach.getTinhTrang());

		if (sach.getNxb() != null) {
			this.setNxbId(sach.getNxb().getMaNhaXuatBan());
		}

		if (sach.getTacGias() != null) {

			List<Integer> tacGiaIds = sach.getTacGias().stream().map(TacGia::getMaTacGia).collect(Collectors.toList());
			this.setTacGiaIds(tacGiaIds);
		}

		if (sach.getTheLoais() != null) {
			List<Integer> theLoaiIds = sach.getTheLoais().stream().map(TheLoai::getMaTheLoai)
					.collect(Collectors.toList());
			this.setTheLoaiIds(theLoaiIds);
		}
	}

}