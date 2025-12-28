package com.library.project.vinhuni.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.project.vinhuni.Utillities.Functions;
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

		String styleDiv = "font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #e0e0e0; border-radius: 5px; background-color: #ffffff;";
		String styleH3 = "color: #28a745; text-align: center; margin-bottom: 20px;";
		String styleP = "font-size: 14px; color: #333; line-height: 1.6;";

		NoiDungEmail email = new NoiDungEmail();
		email.setNguoiNhan(muonSach.getDocGia().getTaiKhoan().getEmail());
		email.setNoiDung(
				"<div style='" + styleDiv + "'>"
						+ "<h3 style='" + styleH3 + "'>Yêu cầu mượn sách đã được chấp nhận!</h3>"

						+ "<p style='" + styleP + "'>Chào bạn,</p>"
						+ "<p style='" + styleP
						+ "'>Chúng tôi đã xem xét yêu cầu mượn sách của bạn và đã chấp nhận. Bạn vui lòng đến thư viện để nhận sách, thủ thư đã chuẩn bị sẵn sàng cho bạn.</p>"
						+ Functions.getContentInforBookInMail(muonSach.getSach())
						+ "<p style='margin-top: 30px; font-style: italic; color: #777;'>"
						+ "Thân mến,<br>"
						+ "<strong style='color: #0056b3;'>Đội ngũ Thư viện BookJar</strong>"
						+ "</p>"
						+ "</div>");
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
