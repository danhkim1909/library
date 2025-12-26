package com.library.project.vinhuni.controller;

import java.util.Comparator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;

import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.service.SachService;

@Controller
public class HomeController {
	@Autowired
	private SachService sachService;

	@GetMapping({ "/", "/home" })
	public String home(Model model, @AuthenticationPrincipal TaiKhoan taiKhoan, HttpSession session) {

		List<Sach> sachs = sachService.findByHienTrueOrderByNgayNhapDesc();
		List<Sach> sachMois = sachs.stream().limit(4).toList();
		model.addAttribute("sachMois", sachService.checkDaThich(sachMois, taiKhoan));

		List<Sach> sachMuonNhieus = sachs.stream()
				.sorted(Comparator.comparingInt((Sach s) -> s.getSoLanMuon()).reversed())
				.limit(3).toList();
		model.addAttribute("sachMuonNhieus", sachService.checkDaThich(sachMuonNhieus, taiKhoan));

		List<Sach> sachMuonIts = sachs.stream()
				.sorted(Comparator.comparingInt((Sach s) -> s.getSoLanMuon()))
				.limit(3).toList();
		model.addAttribute("sachMuonIts", sachService.checkDaThich(sachMuonIts, taiKhoan));

		return "content/home";
	}

}
