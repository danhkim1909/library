package com.library.project.vinhuni.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.project.vinhuni.dto.DocGiaDto;
import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.repository.DocGiaRepository;
import com.library.project.vinhuni.repository.TaiKhoanRepository;

import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	private DocGiaRepository docGiaRepository;

	@Autowired
	private TaiKhoanRepository taiKhoanRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping
	public String register() {
		return "content/register";
	}

	@PostMapping
	@Transactional
	public String register(@Valid @ModelAttribute DocGiaDto user, BindingResult result,
			RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return "content/register";
		}

		DocGia docGia = new DocGia();
		docGia.setTenDocGia(user.getTenDocGia());
		docGia.setDiaChi(user.getDiaChi());
		docGia.setGioiTinh(user.getGioiTinh());
		docGia.setLop(user.getLop());
		docGia.setNgayDangKy(LocalDate.now());
		docGia.setSoDT(user.getSoDt());

		DocGia savedDocGia = docGiaRepository.save(docGia);

		TaiKhoan taiKhoan = new TaiKhoan();
		taiKhoan.setTenDangNhap(user.getTenDangNhap());
		String matKhauMaHoa = passwordEncoder.encode(user.getMatKhau());
		taiKhoan.setMatKhau(matKhauMaHoa);
		taiKhoan.setLoaiTaiKhoan("docgia");
		taiKhoan.setTrangThai(true);

		taiKhoan.setDocGia(savedDocGia);

		taiKhoanRepository.save(taiKhoan);

		redirectAttributes.addFlashAttribute("success", "Đăng ký thành công");
		return "redirect:/login";
	}
}