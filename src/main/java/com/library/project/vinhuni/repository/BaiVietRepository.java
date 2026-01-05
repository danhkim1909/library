package com.library.project.vinhuni.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import com.library.project.vinhuni.entity.BaiViet;

public interface BaiVietRepository extends JpaRepository<BaiViet, Long> {

    List<BaiViet> findByHienTrueOrderByNgayTaoDesc();

    Page<BaiViet> findAllByOrderByNgayTaoDesc(Pageable pageable);
}
