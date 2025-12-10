package com.library.project.vinhuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.service.SachService;

@Controller
public class HomeController {
	@Autowired
	private SachService sachService;

	@GetMapping({ "/", "/home" })
	public String home(Model model) {

		List<Sach> sachs = sachService.findByHienTrueOrderByNgayNhapDesc();
		List<Sach> sachMois = sachs.stream().filter(sach -> sach.isMoi()).limit(4).toList();
		model.addAttribute("sachMois", sachMois);

		return "content/home";
	}

}
