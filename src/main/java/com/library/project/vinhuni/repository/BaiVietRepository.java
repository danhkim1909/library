package com.library.project.vinhuni.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.library.project.vinhuni.entity.BaiViet;

public interface BaiVietRepository extends JpaRepository<BaiViet, Long> {

    List<BaiViet> findByHienTrueOrderByNgayTaoDesc();

    Page<BaiViet> findAllByOrderByNgayTaoDesc(Pageable pageable);

    @Query("SELECT b FROM BaiViet b WHERE b.hien = true AND b.tenBaiViet LIKE %:tuKhoa% ORDER BY b.ngayTao DESC")
    Page<BaiViet> findByKeyword(String tuKhoa, Pageable pageable);

    @Query("SELECT b FROM BaiViet b WHERE b.hien = true AND b.danhMucBaiViet.maDanhMuc = :maDanhMuc ORDER BY b.ngayTao DESC")
    Page<BaiViet> findByDanhMuc(Integer maDanhMuc, Pageable pageable);

    @Query("SELECT b FROM BaiViet b WHERE b.hien = true AND b.danhMucBaiViet.maDanhMuc = :maDanhMuc AND b.tenBaiViet LIKE %:tuKhoa% ORDER BY b.ngayTao DESC")
    Page<BaiViet> findByDanhMucAndKeyword(Integer maDanhMuc, String tuKhoa, Pageable pageable);
}
