package com.library.project.vinhuni.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.library.project.vinhuni.entity.DanhGia;
import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.service.DanhGiaService;
import com.library.project.vinhuni.service.MuonSachService;
import com.library.project.vinhuni.service.SachService;
import com.library.project.vinhuni.service.TaiKhoanService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DanhGiaController {

	@Autowired
	MuonSachService muonSachService;

	@Autowired
	private SachService sachService;

	@Autowired
	private TaiKhoanService taiKhoanService;

	@Autowired
	private DanhGiaService danhGiaService;

	@PostMapping("/danhgia/{id}")
	public String create(@PathVariable Long id, @ModelAttribute("danhGiaMoi") DanhGia danhGia, BindingResult result,
			HttpServletRequest request, @AuthenticationPrincipal TaiKhoan taiKhoan, Model model) {

		Sach sach = sachService.findByMaSach(id);
		if (sach == null) {
			return "redirect:/sach";
		}

		if (taiKhoan == null) {
			return "redirect:/login";
		}

		DocGia docGia = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap()).getDocGia();

		if (result.hasErrors()) {
			request.getSession(true);

			DanhGia danhGiaCu = null;
			model.addAttribute("docGia", docGia);
			danhGiaCu = danhGiaService.findByDocGiaAndSach(docGia, sach);

			model.addAttribute("danhGiaCu", danhGiaCu);

			MuonSach muonSach = new MuonSach();
			muonSach.setSoLuong(1);
			model.addAttribute("muonSach", muonSach);

			model.addAttribute("sach", sach);
			return "content/sach/detail";
		}

		danhGiaService.create(danhGia, docGia, sach);

		return "redirect:/sach/" + sach.getMaSach();

	}

	@PostMapping("/danhgia/sua/{id}")
	public String update(@PathVariable Long id, @ModelAttribute("danhGiaCu") DanhGia danhGia,
			@AuthenticationPrincipal TaiKhoan taiKhoan) {
		Sach sach = sachService.findByMaSach(id);
		if (sach == null) {
			return "redirect:/sach";
		}
		if (taiKhoan == null) {
			return "redirect:/login";
		}
		DocGia docGia = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap()).getDocGia();

		danhGiaService.update(danhGia, docGia, sach);
		return "redirect:/sach/" + sach.getMaSach();
	}

}
