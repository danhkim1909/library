package com.library.project.vinhuni.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.dto.ChiTietPhieuNhapDto;
import com.library.project.vinhuni.dto.PhieuNhapDto;
import com.library.project.vinhuni.entity.NhanVien;
import com.library.project.vinhuni.entity.PhieuNhap;
import com.library.project.vinhuni.repository.ChiTietPhieuNhapRepository;
import com.library.project.vinhuni.repository.PhieuNhapRepository;

@Service
public class PhieuNhapService {
	@Autowired
	PhieuNhapRepository phieuNhapRepository;

	@Autowired
	ChiTietPhieuNhapRepository chiTietPhieuNhapRepository;

	@Autowired
	chiTietPhieuNhapService chiTietPhieuNhapService;

	public List<PhieuNhap> findByOrderByNgayNhapDesc() {
		return phieuNhapRepository.findByOrderByNgayNhapDesc();
	}

	public List<PhieuNhap> getAll() {
		return phieuNhapRepository.findAll();
	}

	public void createPhieuNhap(PhieuNhapDto phieuNhapDto, NhanVien nhanVien) {
		PhieuNhap phieuNhap = new PhieuNhap();
		phieuNhap.setGhiChu(phieuNhapDto.getGhiChu());
		phieuNhap.setNhanVien(nhanVien);
		phieuNhap.setNgayNhap(LocalDateTime.now());

		PhieuNhap phieuNhapDaLuu = phieuNhapRepository.save(phieuNhap);

		List<ChiTietPhieuNhapDto> chiTietList = phieuNhapDto.getChiTietList();
		Collection<ChiTietPhieuNhapDto> chiTiets = chiTietList.stream().collect(Collectors.toMap(ChiTietPhieuNhapDto::getMaSach, soLuong -> soLuong, (soLuongCu, soLuongMoi) -> {
			soLuongCu.setSoLuong(soLuongCu.getSoLuong() + soLuongMoi.getSoLuong());
			return soLuongCu;
		})).values();
		chiTietList = new ArrayList<>(chiTiets);
		for (ChiTietPhieuNhapDto chiTiet : chiTietList) {
			chiTietPhieuNhapService.create(chiTiet, phieuNhapDaLuu);
		}

	}
}
