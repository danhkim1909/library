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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String create(@PathVariable Long id, @Valid @ModelAttribute("muonSach") MuonSach muonSach,
			BindingResult result, @AuthenticationPrincipal TaiKhoan taiKhoan, Model model,
			RedirectAttributes redirectAttributess) {

		Sach sach = sachService.findByMaSach(id);
		if (sach == null) {
			redirectAttributess.addFlashAttribute("error", "Có lỗi xảy ra, vui lòng thử lại");
			return "redirect:/sach";
		}

		if (taiKhoan == null) {
			redirectAttributess.addFlashAttribute("info", "Vui lòng đăng nhập");
			return "redirect:/login";
		}
		if (taiKhoan.getLoaiTaiKhoan().equals("nhanvien")) {
			redirectAttributess.addFlashAttribute("error", "Chức năng này dành cho độc giả");
			return "redirect:/sach/" + id;
		}

		Kho kho = sach.getKho();
		if (kho == null || kho.getSoLuong() == 0) {
			result.rejectValue("soLuong", "", "Xin lỗi, hiện tại sách này đang tạm hết");
		}

		if (kho != null && kho.getSoLuong() < muonSach.getSoLuong() && kho.getSoLuong() != 0) {
			result.rejectValue("soLuong", "", "Số sách còn lại không đủ");
		}

		DocGia docGia = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap()).getDocGia();

		Integer dangMuon = muonSachService.soSachDangMuon(docGia, sach);

		if (muonSach.getSoLuong() + dangMuon > GIOIHANMUON) {
			result.rejectValue("soLuong", "",
					"Xin lỗi, mỗi mẫu sách bạn được mượn tối đa " + GIOIHANMUON + " quyển cùng lúc");
		}

		if (result.hasErrors()) {
			model.addAttribute("sach", sach);
			return "content/sach/detail";
		}

		muonSachService.create(muonSach, docGia, sach);
		redirectAttributess.addFlashAttribute("success", "Mượn thành công");
		return "redirect:/sachmuon";
	}

	@GetMapping("/sachmuon")
	public String sachmuon(Model model, @AuthenticationPrincipal TaiKhoan taiKhoan) {
		if (taiKhoan == null) {
			return "redirect:/login";
		}
		TaiKhoan taiKhoanDb = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap());
		List<MuonSach> muonSachs = muonSachService.findByDocGiaOrderByThoiGianMuonDesc(taiKhoanDb.getDocGia());

		List<MuonSach> lichSus = muonSachs.stream()
				.filter(ls -> ls.isDaTra() || (ls.getXacNhan() != null && ls.getXacNhan() == false)).toList();
		model.addAttribute("lichSus", lichSus);

		muonSachs = muonSachs.stream()
				.filter(ms -> !ms.isDaTra() && (ms.getXacNhan() == null || ms.getXacNhan() == true)).toList();
		model.addAttribute("muonSachs", muonSachs);

		return "content/muonsach/index";
	}

	@GetMapping("/trasach/{id}")
	public String trasach(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra, vui lòng thử lại");
			return "redirect:/sachmuon";
		}
		traSachService.create(muonSach);
		redirectAttributes.addFlashAttribute("success", "Đã thông báo trả sách, nhân viên đang chờ bạn");
		return "redirect:/sachmuon";
	}

	@GetMapping("/huymuon/{id}")
	public String huymuon(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra, vui lòng thử lại");
			return "redirect:/sachmuon";
		}
		muonSachService.cancel(muonSach);
		redirectAttributes.addFlashAttribute("success", "Đã hủy yêu cầu mượn");
		return "redirect:/sachmuon";
	}

}
