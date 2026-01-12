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
@Table(name = "tblBinhLuanBaiViet")
public class BinhLuanBaiViet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maBinhLuan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maBaiViet")
    private BaiViet baiViet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maTaiKhoan")
    private TaiKhoan taiKhoan;

    @Column(name = "NoiDung", length = 1000)
    private String noiDung;

    @Column(name = "ThoiGian")
    private LocalDateTime thoiGian;

}
