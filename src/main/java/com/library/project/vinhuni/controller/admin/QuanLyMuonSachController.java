package com.library.project.vinhuni.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.NoiDungEmail;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.service.EmailService;
import com.library.project.vinhuni.service.MuonSachService;
import com.library.project.vinhuni.service.TaiKhoanService;
import com.library.project.vinhuni.service.TraSachService;

@Controller
@RequestMapping("/admin")
public class QuanLyMuonSachController {

	@Autowired
	EmailService emailService;

	@Autowired
	MuonSachService muonSachService;

	@Autowired
	TaiKhoanService taiKhoanService;

	@Autowired
	TraSachService traSachService;

	@GetMapping("/muonsach")
	public String index(Model model) {
		List<MuonSach> muonSachs = muonSachService.findByXacNhanNull();
		model.addAttribute("muonSachs", muonSachs);

		return "admin/muonsach/index";
	}

	@GetMapping("/muonsach/chapnhan/{id}")
	public String chapnhan(@PathVariable Long id, @AuthenticationPrincipal TaiKhoan taiKhoan) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			return "redirect:/admin/muonsach";
		}
		TaiKhoan taiKhoanDB = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap());
		muonSachService.chapnhan(muonSach, taiKhoanDB.getNhanVien());
		NoiDungEmail email = new NoiDungEmail();
		email.setNguoiNhan("danhnguyenthikim@gmail.com");
		email.setNoiDung("Chúng tôi đã xem xét yêu cầu mượn sách của bạn và đã chấp nhận. Bạn có thể đến thư viện để lấy những quyển sách này, thủ thư sẽ chuẩn bị sách cho bạn.<br>Thân mến, BookJar");
		email.setTieuDe("BookJar - Chấp nhận yêu cầu mượn sách");
		emailService.guiEmail(email);
		return "redirect:/admin/muonsach";
	}

	@GetMapping("/muonsach/tuchoi/{id}")
	public String tuchoi(@PathVariable Long id, @AuthenticationPrincipal TaiKhoan taiKhoan) {
		MuonSach muonSach = muonSachService.findByMaMuonSach(id);
		if (muonSach == null) {
			return "redirect:/admin/muonsach";
		}
		TaiKhoan taiKhoanDB = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap());
		muonSachService.tuchoi(muonSach, taiKhoanDB.getNhanVien());

		return "redirect:/admin/muonsach";
	}

}
