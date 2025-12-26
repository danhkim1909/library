package com.library.project.vinhuni.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tbl_yeu_thich")
public class YeuThich {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ma_doc_gia")
    private DocGia docGia;

    @ManyToOne
    @JoinColumn(name = "ma_sach")
    private Sach sach;

    @Column(name = "ngay_thich")
    private LocalDateTime ngayThich;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public DocGia getDocGia() {
        return docGia;
    }

    public void setDocGia(DocGia docGia) {
        this.docGia = docGia;
    }

    public Sach getSach() {
        return sach;
    }

    public void setSach(Sach sach) {
        this.sach = sach;
    }

    public LocalDateTime getNgayThich() {
        return ngayThich;
    }

    public void setNgayThich(LocalDateTime ngayThich) {
        this.ngayThich = ngayThich;
    }
}