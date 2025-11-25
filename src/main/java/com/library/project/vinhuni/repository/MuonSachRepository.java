package com.library.project.vinhuni.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TraSach;

public interface MuonSachRepository extends JpaRepository<MuonSach, Long> {

	public List<MuonSach> findByTraSachNull();

	public List<MuonSach> findByDocGiaAndSach(DocGia docGia, Sach sach);

	public Optional<MuonSach> findByTraSach(TraSach traSach);

	public List<MuonSach> findByXacNhanNull();

	public List<MuonSach> findByDocGiaOrderByThoiGianMuonDesc(DocGia docGia);
}
