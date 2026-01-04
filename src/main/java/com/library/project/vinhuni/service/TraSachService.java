package com.library.project.vinhuni.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.controller.RegisterController;
import com.library.project.vinhuni.dto.XacNhanTraSachDto;
import com.library.project.vinhuni.entity.Kho;
import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.NhanVien;
import com.library.project.vinhuni.entity.TraSach;
import com.library.project.vinhuni.repository.KhoRepository;
import com.library.project.vinhuni.repository.TraSachRepository;

@Service
public class TraSachService {

	private final RegisterController registerController;

	@Autowired
	TraSachRepository traSachRepository;

	@Autowired
	KhoRepository khoRepository;

	TraSachService(RegisterController registerController) {
		this.registerController = registerController;
	}

	public TraSach findByMaTraSach(Long maTraSach) {
		return traSachRepository.findById(maTraSach).orElse(null);
	}

	public List<TraSach> findByXacNhanTrue() {
		return traSachRepository.findByXacNhanTrue();
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

	public void confirm(TraSach traSach, XacNhanTraSachDto dto, NhanVien nhanVien) {
		traSach.setAnh(dto.getAnh());
		traSach.setNhanVien(nhanVien);
		traSach.setThoiGianTra(LocalDateTime.now());
		traSach.setTienPhat(dto.getTienPhat());
		traSach.setLyDoPhat(dto.getLyDoPhat());
		traSach.setDaNopPhat(dto.getDaNopPhat());
		traSach.setXacNhan(true);
		traSachRepository.save(traSach);

		Kho kho = traSach.getMuonSach().getSach().getKho();
		kho.setSoLuong(kho.getSoLuong() + traSach.getMuonSach().getSoLuong());
		khoRepository.save(kho);
	}

	public void nopPhat(TraSach traSach, String maGiaoDich) {
		traSach.setMaGiaoDich(maGiaoDich);
		traSach.setDaNopPhat(true);
		traSachRepository.save(traSach);
	}

}
