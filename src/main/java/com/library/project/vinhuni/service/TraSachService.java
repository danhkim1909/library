package com.library.project.vinhuni.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.Kho;
import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.NhanVien;
import com.library.project.vinhuni.entity.TraSach;
import com.library.project.vinhuni.repository.KhoRepository;
import com.library.project.vinhuni.repository.TraSachRepository;

@Service
public class TraSachService {

	@Autowired
	TraSachRepository traSachRepository;

	@Autowired
	KhoRepository khoRepository;

	public TraSach findByMaTraSach(Long maTraSach) {
		return traSachRepository.findById(maTraSach).orElse(null);
	}

	public List<TraSach> findByXacNhanFalse() {

		return traSachRepository.findByXacNhanFalse();
	}

	public void create(MuonSach muonSach) {
		TraSach traSach = new TraSach();
		traSach.setMuonSach(muonSach);
		traSach.setXacNhan(false);
		traSachRepository.save(traSach);
	}

	public void confirm(TraSach traSach, String anh, NhanVien nhanVien) {
		traSach.setAnh(anh);
		traSach.setNhanVien(nhanVien);
		traSach.setThoiGianTra(LocalDateTime.now());
		traSach.setXacNhan(true);
		traSachRepository.save(traSach);

		Kho kho = traSach.getMuonSach().getSach().getKho();
		kho.setSoLuong(kho.getSoLuong() + traSach.getMuonSach().getSoLuong());
		khoRepository.save(kho);
	}

}
