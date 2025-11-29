package com.library.project.vinhuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.Kho;
import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.service.MuonSachService;
import com.library.project.vinhuni.service.SachService;
import com.library.project.vinhuni.service.TaiKhoanService;
import com.library.project.vinhuni.service.TraSachService;

import jakarta.validation.Valid;

@Controller
public class MuonTraSachController {

	public final Integer GIOIHANMUON = 3;

	@Autowired
	MuonSachService muonSachService;

	@Autowired
	SachService sachService;

	@Autowired
	TaiKhoanService taiKhoanService;

	@Autowired
	TraSachService traSachService;

	@PostMapping("/muonsach/{id}")
	public String create(@PathVariable Long id, @Valid @ModelAttribute("muonSach") MuonSach muonSach, BindingResult result, @AuthenticationPrincipal TaiKhoan taiKhoan, Model model) {

		Sach sach = sachService.findByMaSach(id);
		if (sach == null) {
			return "redirect:/sach";
		}

		if (taiKhoan == null) {
			return "redirect:/login";
		}

		Kho kho = sach.getKho();
		if (kho == null || kho.getSoLuong() == 0) {
			result.rejectValue("soLuong", "", "Xin lỗi, hiện tại sách này đang tạm hết");
		}

		if (kho != null && kho.getSoLuong() < muonSach.getSoLuong() && kho.getSoLuong() != 0) {
			result.rejectValue("soLuong", "", "Số sách còn lại không đủ");
		}

		if (taiKhoan.getLoaiTaiKhoan().equals("nhanvien")) {
			result.rejectValue("soLuong", "", "Chức năng này dành cho độc giả");
		}

		DocGia docGia = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap()).getDocGia();

		Integer dangMuon = muonSachService.soSachDangMuon(docGia, sach);

		if (muonSach.getSoLuong() + dangMuon > GIOIHANMUON) {
			result.rejectValue("soLuong", "", "Xin lỗi, mỗi mẫu sách bạn được mượn tối đa " + GIOIHANMUON + " quyển cùng lúc");
		}

		if (result.hasErrors()) {
			model.addAttribute("sach", sach);
			return "content/sach/detail";
		}

		muonSachService.create(muonSach, docGia, sach);

		return "redirect:/sachmuon";
	}

	@GetMapping("/sachmuon")
	public String sachmuon(Model model, @AuthenticationPrincipal TaiKhoan taiKhoan) {
		if (taiKhoan == null) {
			return "redirect:/login";
		}
		TaiKhoan taiKhoanDb = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap());
		List<MuonSach> muonSachs = muonSachService.findByDocGiaOrderByThoiGianMuonDesc(taiKhoanDb.getDocGia());

		List<MuonSach> lichSus = muonSachs.stream().filter(ls -> ls.isDaTra() || (ls.getXacNhan() != null && ls.getXacNhan() == false)).toList();
		model.addAttribute("lichSus", lichSus);

		muonSachs = muonSachs.stream().filter(ms -> !ms.isDaTra() && (ms.getXacNhan() == null || ms.getXacNhan() == true)).toList();
		model.addAttribute("muonSachs", muonSachs);

		return "content/muonsach/index";
	}

	@GetMapping("/trasach/{id}")
	public String trasach(@PathVariable Long id) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			return "redirect:/sachmuon";
		}
		traSachService.create(muonSach);
		return "redirect:/sachmuon";
	}

	@GetMapping("/huymuon/{id}")
	public String huymuon(@PathVariable Long id) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			return "redirect:/sachmuon";
		}
		muonSachService.cancel(muonSach);
		return "redirect:/sachmuon";
	}

}
