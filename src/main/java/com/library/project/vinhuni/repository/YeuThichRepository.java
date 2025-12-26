package com.library.project.vinhuni.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.YeuThich;

public interface YeuThichRepository extends JpaRepository<YeuThich, Long> {

    List<YeuThich> findByDocGiaOrderByNgayThichDesc(DocGia docGia);

    public Optional<YeuThich> findByDocGiaAndSach(DocGia docGia, Sach sach);
}
