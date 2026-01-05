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

@Entity
@Table(name = "tblBaiViet")
public class BaiViet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maBaiViet")
    private Long maBaiViet;

    @Column(name = "tenBaiViet", length = 500)
    private String tenBaiViet;

    @Column(name = "anh", columnDefinition = "LONGTEXT")
    private String anh;

    @Column(name = "noiDung", columnDefinition = "LONGTEXT")
    private String noiDung;

    @Column(name = "moTa", length = 1000)
    private String moTa;

    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @Column(name = "hien")
    private Boolean hien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maDanhMuc")
    private DanhMucBaiViet danhMucBaiViet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maNhanVien")
    private NhanVien nhanVien;

    public Long getMaBaiViet() {
        return maBaiViet;
    }

    public void setMaBaiViet(Long maBaiViet) {
        this.maBaiViet = maBaiViet;
    }

    public String getTenBaiViet() {
        return tenBaiViet;
    }

    public void setTenBaiViet(String tenBaiViet) {
        this.tenBaiViet = tenBaiViet;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
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

    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Boolean isHien() {
        return hien;
    }

    public void setHien(Boolean hien) {
        this.hien = hien;
    }

    public DanhMucBaiViet getDanhMucBaiViet() {
        return danhMucBaiViet;
    }

    public void setDanhMucBaiViet(DanhMucBaiViet danhMucBaiViet) {
        this.danhMucBaiViet = danhMucBaiViet;
    }

    public Boolean getHien() {
        return hien;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }

}
