package com.library.project.vinhuni.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.service.TaiKhoanService;

@Controller
public class LoginController {

	@Autowired
	private TaiKhoanService taiKhoanService;

	@GetMapping("/login")
	public String Login() {
		return "content/login";
	}

}
