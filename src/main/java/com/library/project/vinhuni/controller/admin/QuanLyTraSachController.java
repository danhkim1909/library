package com.library.project.vinhuni.controller.admin;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.project.vinhuni.dto.XacNhanTraSachDto;
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
	public String tra(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			redirectAttributes.addFlashAttribute("error", "Mượn sách không tồn tại");
			return "redirect:/admin/trasach";
		}

		LocalDate hanTra = muonSach.getThoiGianMuon().toLocalDate().plusDays(15);
		LocalDate ngayHienTai = LocalDate.now();

		XacNhanTraSachDto dto = new XacNhanTraSachDto();

		if (ngayHienTai.isAfter(hanTra)) {
			Long soNgayQuaHan = ChronoUnit.DAYS.between(hanTra.plusDays(1), ngayHienTai);
			dto.setTienPhat((int) (soNgayQuaHan * 5));
			dto.setLyDoPhat(
					"Quá hạn " + soNgayQuaHan + " ngày, phạt " + String.format("%,d", soNgayQuaHan * 5) + ".000 VNĐ");
		}

		model.addAttribute("muonSach", muonSach);
		model.addAttribute("xacNhanTraSachDto", dto);
		return "admin/trasach/confirm";
	}

	@PostMapping("/{id}")
	public String tra(@PathVariable Long id, XacNhanTraSachDto dto, @AuthenticationPrincipal TaiKhoan taiKhoan,
			RedirectAttributes redirectAttributes) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			redirectAttributes.addFlashAttribute("error", "Mượn sách không tồn tại");
			return "redirect:/admin/trasach";
		}
		TaiKhoan taiKhoanDB = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap());
		TraSach traSach = muonSach.getTraSach();
		if (traSach == null) {
			traSach = new TraSach();
			traSach.setMuonSach(muonSach);
		}
		traSachService.confirm(traSach, dto, taiKhoanDB.getNhanVien());

		redirectAttributes.addFlashAttribute("success", "Xác nhận trả sách thành công");
		return "redirect:/admin/trasach";
	}

	@GetMapping("/lichsu")
	public String lichsu(Model model) {
		List<TraSach> traSachs = traSachService.findByXacNhanTrue();
		model.addAttribute("traSachs", traSachs);
		return "admin/trasach/lichsu";
	}

	@GetMapping("/lichsu/{id}")
	public String chitietlichsu(@PathVariable("id") Long maTraSach, Model model,
			RedirectAttributes redirectAttributes) {
		TraSach traSach = traSachService.findByMaTraSach(maTraSach);
		if (traSach == null) {
			redirectAttributes.addFlashAttribute("error", "Tra sach khong ton tai");
			return "redirect:/admin/trasach/lichsu";
		}
		model.addAttribute("traSach", traSach);
		return "admin/trasach/chitietlichsu";
	}

}
