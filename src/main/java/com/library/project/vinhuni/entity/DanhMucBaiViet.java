package com.library.project.vinhuni.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tblDanhMucBaiViet")
public class DanhMucBaiViet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaDanhMuc")
    private Integer maDanhMuc;

    @Size(max = 255, message = "Tên danh mục không được quá dài")
    @NotBlank(message = "Tên danh mục không được để trống")
    @Column(name = "TenDanhMuc")
    private String tenDanhMuc;

    @Column(name = "MoTa")
    @Size(max = 255, message = "Mô tả không được quá dài")
    private String moTa;

    @Column(name = "ThuTu")
    private Integer thuTu;

    @Column(name = "Hien")
    private Boolean hien;

    @OneToMany(mappedBy = "danhMucBaiViet", fetch = FetchType.LAZY)
    private List<BaiViet> baiViets;

    public Integer getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(Integer maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public String getTenDanhMuc() {
        return tenDanhMuc;
    }

    public void setTenDanhMuc(String tenDanhMuc) {
        this.tenDanhMuc = tenDanhMuc;
    }

    public String getMoTa() {
        return moTa;

    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Integer getThuTu() {
        return thuTu;
    }

    public void setThuTu(Integer thuTu) {
        this.thuTu = thuTu;
    }

    public List<BaiViet> getBaiViets() {
        return baiViets;
    }

    public void setBaiViets(List<BaiViet> baiViets) {
        this.baiViets = baiViets;
    }

    public Boolean getHien() {
        return hien;
    }

    public void setHien(Boolean hien) {
        this.hien = hien;
    }

}
