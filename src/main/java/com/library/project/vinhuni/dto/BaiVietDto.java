package com.library.project.vinhuni.dto;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import com.library.project.vinhuni.entity.BaiViet;
import com.library.project.vinhuni.entity.DanhMucBaiViet;
import com.library.project.vinhuni.entity.NhanVien;

import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

public class BaiVietDto {

    private Long maBaiViet;

    @Size(max = 500, message = "Tên bài viết không được quá dài")
    @NotBlank(message = "Tên bài viết không được để trống")
    private String tenBaiViet;

    @NotBlank(message = "Nội dung không được để trống")
    private String noiDung;

    @Size(max = 1000, message = "Mô tả không được quá dài")
    @NotBlank(message = "Mô tả không được để trống")
    private String moTa;

    private MultipartFile anh;

    private String anhBase64;

    private Boolean hien;

    @NotNull(message = "Danh mục không hợp lệ")
    @Positive(message = "Danh mục không hợp lệ")
    private Integer danhMucBaiVietId;

    public BaiVietDto() {
    }

    public BaiVietDto(BaiViet baiViet) {
        this.maBaiViet = baiViet.getMaBaiViet();
        this.tenBaiViet = baiViet.getTenBaiViet();
        this.noiDung = baiViet.getNoiDung();
        this.moTa = baiViet.getMoTa();
        this.anhBase64 = baiViet.getAnh();
        this.hien = baiViet.getHien();
        this.danhMucBaiVietId = baiViet.getDanhMucBaiViet().getMaDanhMuc();
    }

    public String getTenBaiViet() {
        return tenBaiViet;
    }

    public void setTenBaiViet(String tenBaiViet) {
        this.tenBaiViet = tenBaiViet;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Boolean getHien() {
        return hien;
    }

    public void setHien(Boolean hien) {
        this.hien = hien;
    }

    public Integer getDanhMucBaiVietId() {
        return danhMucBaiVietId;
    }

    public void setDanhMucBaiVietId(Integer danhMucBaiVietId) {
        this.danhMucBaiVietId = danhMucBaiVietId;
    }

    public Long getMaBaiViet() {
        return maBaiViet;
    }

    public void setMaBaiViet(Long maBaiViet) {
        this.maBaiViet = maBaiViet;
    }

    public MultipartFile getAnh() {
        return anh;
    }

    public void setAnh(MultipartFile anh) {
        this.anh = anh;
    }

    public String getAnhBase64() {
        return anhBase64;
    }

    public void setAnhBase64(String anhBase64) {
        this.anhBase64 = anhBase64;
    }

}
