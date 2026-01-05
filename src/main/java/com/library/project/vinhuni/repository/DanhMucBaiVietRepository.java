package com.library.project.vinhuni.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.library.project.vinhuni.entity.DanhMucBaiViet;

public interface DanhMucBaiVietRepository extends JpaRepository<DanhMucBaiViet, Integer> {

    List<DanhMucBaiViet> findByHienTrueOrderByThuTuAsc();

    List<DanhMucBaiViet> findAllByOrderByThuTuAsc();

    @Query("SELECT MAX(d.thuTu) FROM DanhMucBaiViet d")
    Integer findMaxThuTu();

    List<DanhMucBaiViet> findByThuTu(Integer thuTu);
}
