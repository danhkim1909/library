package com.library.project.vinhuni.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.Kho;
import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.NhanVien;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TraSach;
import com.library.project.vinhuni.repository.KhoRepository;
import com.library.project.vinhuni.repository.MuonSachRepository;

@Service
public class MuonSachService {

	@Autowired
	MuonSachRepository muonSachRepository;

	@Autowired
	KhoRepository khoRepository;

	public List<MuonSach> getAll() {
		return muonSachRepository.findAll();
	}

	public MuonSach findByMaMuonSach(Long maMuonSach) {
		return muonSachRepository.findById(maMuonSach).orElse(null);
	}

	public List<MuonSach> findByTraSachNull() {
		return muonSachRepository.findByTraSachNull();
	}

	public List<MuonSach> findByDocGiaAndSach(DocGia docGia, Sach sach) {
		return muonSachRepository.findByDocGiaAndSach(docGia, sach);
	}

	public MuonSach findByTraSach(TraSach traSach) {
		return muonSachRepository.findByTraSach(traSach).orElse(null);
	}

	public List<MuonSach> findByXacNhanNull() {
		return muonSachRepository.findByXacNhanNull();
	}

	public List<MuonSach> findByDocGiaOrderByThoiGianMuonDesc(DocGia docGia) {
		return muonSachRepository.findByDocGiaOrderByThoiGianMuonDesc(docGia);
	}

	public Integer soSachDangMuon(DocGia docGia, Sach sach) {

		List<MuonSach> muonSachs = muonSachRepository.findByDocGiaAndSach(docGia, sach);

		Integer soSachChuaTra = muonSachs.stream().filter(ms -> ms.isDaTra() == false).filter(ms -> ms.getSach() == sach).filter(ms -> ms.getXacNhan() != false).mapToInt(MuonSach::getSoLuong).sum();

		return soSachChuaTra;
	}

	public void chapnhan(MuonSach muonSach, NhanVien nhanVien) {
		muonSach.setNhanVien(nhanVien);
		muonSach.setXacNhan(true);
		muonSachRepository.save(muonSach);
	}

	public void tuchoi(MuonSach muonSach, NhanVien nhanVien) {
		muonSach.setNhanVien(nhanVien);
		muonSach.setXacNhan(false);
		muonSachRepository.save(muonSach);

		Kho kho = muonSach.getSach().getKho();
		kho.setSoLuong(kho.getSoLuong() + muonSach.getSoLuong());
		khoRepository.save(kho);
	}

	public void create(MuonSach muonSach, DocGia docGia, Sach sach) {
		muonSach.setDocGia(docGia);
		muonSach.setSach(sach);
		muonSach.setThoiGianMuon(LocalDateTime.now());
		muonSachRepository.save(muonSach);

		Kho kho = sach.getKho();
		kho.setSoLuong(kho.getSoLuong() - muonSach.getSoLuong());
		khoRepository.save(kho);
	}

	public void cancel(MuonSach muonSach) {
		muonSach.setXacNhan(false);

		muonSachRepository.save(muonSach);
		Kho kho = muonSach.getSach().getKho();

		kho.setSoLuong(kho.getSoLuong() + muonSach.getSoLuong());
		khoRepository.save(kho);
	}

}
