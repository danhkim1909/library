package com.library.project.vinhuni.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.repository.DocGiaRepository;
import com.library.project.vinhuni.repository.TaiKhoanRepository;
import com.library.project.vinhuni.service.DocGiaService;
import com.library.project.vinhuni.service.TaiKhoanService;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.service.TaiKhoanService;

@Controller
public class LoginController {

	PasswordEncoder passwordEncoder;
	@Autowired
	private TaiKhoanService taiKhoanService;

	@Autowired
	private DocGiaService docGiaService;

	@Autowired
	private DocGiaRepository docGiaRepository;

	@Autowired
	private TaiKhoanRepository taiKhoanRepository;

	@GetMapping("/login")
	public String Login() {
		return "content/login";
	}

	@GetMapping("/login/oauth2/google")
	public String getUserInfo(@AuthenticationPrincipal OAuth2User principal, RedirectAttributes redirectAttributes) {
		String email = principal.getAttribute("email");
		String name = principal.getAttribute("name");
		String googleId = principal.getAttribute("sub");

		TaiKhoan taiKhoan = taiKhoanService.findByTenDangNhap(googleId);
		if (taiKhoan == null) {
			DocGia docGia = new DocGia();
			docGia.setTenDocGia(name);
			docGia.setNgayDangKy(LocalDate.now());
			DocGia docGiaDaLuu = docGiaRepository.save(docGia);

			taiKhoan = new TaiKhoan();
			taiKhoan.setTenDangNhap(googleId);
			taiKhoan.setDocGia(docGiaDaLuu);
			taiKhoan.setEmail(email);
			taiKhoan.setLoaiTaiKhoan("docgia");
			taiKhoan.setTrangThai(true);
			taiKhoanRepository.save(taiKhoan);
		}

		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
				taiKhoan,
				null,
				taiKhoan.getAuthorities());

		SecurityContextHolder.getContext().setAuthentication(authentication);

		redirectAttributes.addFlashAttribute("success", "Đăng nhập thành công");
		return "redirect:/";
	}

}
