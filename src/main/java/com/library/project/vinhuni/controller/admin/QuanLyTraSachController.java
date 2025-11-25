package com.library.project.vinhuni.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.entity.TraSach;
import com.library.project.vinhuni.service.MuonSachService;
import com.library.project.vinhuni.service.TaiKhoanService;
import com.library.project.vinhuni.service.TraSachService;

@Controller
@RequestMapping("/admin/trasach")
public class QuanLyTraSachController {

	@Autowired
	TaiKhoanService taiKhoanService;

	@Autowired
	TraSachService traSachService;

	@Autowired
	MuonSachService muonSachService;

	@GetMapping
	public String index(Model model) {
		List<TraSach> traSachs = traSachService.findByXacNhanFalse();
		model.addAttribute("traSachs", traSachs);

		List<MuonSach> muonSachs = muonSachService.findByTraSachNull();
		muonSachs = muonSachs.stream().filter(ms -> ms.getXacNhan() != null && ms.getXacNhan() == true).toList();
		model.addAttribute("muonSachs", muonSachs);

		return "admin/trasach/index";
	}

	@GetMapping("/{id}")
	public String tra(@PathVariable Long id, Model model) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			return "redirect:/admin/trasach";
		}
		model.addAttribute("muonSach", muonSach);
		return "admin/trasach/confirm";
	}

	@PostMapping("/{id}")
	public String tra(@PathVariable Long id, String imageBase64, @AuthenticationPrincipal TaiKhoan taiKhoan) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			return "redirect:/admin/trasach";
		}
		TaiKhoan taiKhoanDB = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap());
		TraSach traSach = muonSach.getTraSach();
		if (traSach == null) {
			traSach = new TraSach();
			traSach.setMuonSach(muonSach);
		}
		traSachService.confirm(traSach, imageBase64, taiKhoanDB.getNhanVien());

		return "redirect:/admin/trasach";
	}
}
