package com.library.project.vinhuni.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.library.project.vinhuni.entity.PhieuNhap;

@Repository
public interface PhieuNhapRepository extends JpaRepository<PhieuNhap, Long> {
	public PhieuNhap findByMaPhieuNhap(Long maPhieuNhap);

	List<PhieuNhap> findByOrderByNgayNhapDesc();

}