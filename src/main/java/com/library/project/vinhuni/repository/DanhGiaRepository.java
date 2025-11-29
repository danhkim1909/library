package com.library.project.vinhuni.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.project.vinhuni.entity.DanhGia;
import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.Sach;

public interface DanhGiaRepository extends JpaRepository<DanhGia, Integer> {

	public Optional<DanhGia> findByDocGiaAndSach(DocGia docGia, Sach sach);
}
