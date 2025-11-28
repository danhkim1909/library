package com.library.project.vinhuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.Kho;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.repository.KhoRepository;

@Service
public class KhoService {

	@Autowired
	private KhoRepository khoRepository;

	public List<Kho> getAll() {
		return khoRepository.findAll();
	}

	public Kho findBySach(Sach sach) {
		return khoRepository.findBySach(sach).orElse(null);
	}

	public void addBook(Sach sach, Integer soLuong) {
		Kho kho = khoRepository.findBySach(sach).orElse(null);
		if (kho == null) {
			kho = new Kho();
			kho.setSach(sach);
			kho.setSoLuong(soLuong);
		} else {
			kho.setSoLuong(kho.getSoLuong() + soLuong);
		}
		khoRepository.save(kho);
	}

	public void subtractBook(Sach sach, Integer soLuong) {
		Kho kho = khoRepository.findBySach(sach).orElse(null);
		if (kho != null) {
			Integer soLuongMoi = kho.getSoLuong() - soLuong;
			kho.setSoLuong(soLuongMoi);
			khoRepository.save(kho);
		}

	}

}
