package com.library.project.vinhuni.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.DanhGia;
import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.repository.DanhGiaRepository;

@Service
public class DanhGiaService {
	@Autowired
	DanhGiaRepository danhGiaRepository;

	public DanhGia findByDocGiaAndSach(DocGia docGia, Sach sach) {
		return danhGiaRepository.findByDocGiaAndSach(docGia, sach).orElse(null);
	}

	public void create(DanhGia danhGia, DocGia docGia, Sach sach) {
		danhGia.setDocGia(docGia);
		danhGia.setSach(sach);
		danhGia.setThoiGian(LocalDateTime.now());
		danhGiaRepository.save(danhGia);
	}

	public void update(DanhGia danhGia, DocGia docGia, Sach sach) {
		DanhGia danhGiaDB = danhGiaRepository.findByDocGiaAndSach(docGia, sach).orElse(null);

		danhGiaDB.setNoiDung(danhGia.getNoiDung());
		danhGiaDB.setSoSao(danhGia.getSoSao());
		danhGiaDB.setThoiGian(LocalDateTime.now());
		danhGiaRepository.save(danhGiaDB);

	}
}
