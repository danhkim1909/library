package com.library.project.vinhuni.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.entity.YeuThich;
import com.library.project.vinhuni.service.SachService;
import com.library.project.vinhuni.service.TaiKhoanService;
import com.library.project.vinhuni.service.YeuThichService;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class YeuThichController {
    @Autowired
    private YeuThichService yeuThichService;

    @Autowired
    private SachService sachService;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @PostMapping("/yeuthich")
    public String yeuthich(Long idSach, @AuthenticationPrincipal TaiKhoan taiKhoan,
            RedirectAttributes redirectAttributes, HttpServletRequest request) {
        if (taiKhoan == null) {
            redirectAttributes.addFlashAttribute("error", "Vui lòng đăng nhập");
            return "redirect:/login";
        }

        Sach sach = sachService.findByMaSach(idSach);
        String referer = request.getHeader("Referer");
        if (referer == null || referer.isEmpty()) {
            referer = "/";
        }
        if (sach == null) {
            redirectAttributes.addFlashAttribute("error", "Sách không tồn tại");
            return "redirect:" + referer;
        }

        DocGia docGia = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap()).getDocGia();
        if (docGia == null) {
            redirectAttributes.addFlashAttribute("error", "Chức năng dành cho độc giả");
            return "redirect:" + referer;
        }
        YeuThich yeuThich = yeuThichService.findByDocGiaAndSach(docGia, sach);
        if (yeuThich != null) {
            yeuThichService.deleteYeuThich(yeuThich.getId());
        } else {
            yeuThichService.createYeuThich(sach, docGia);
        }
        if (yeuThich == null) {
            redirectAttributes.addFlashAttribute("success", "Đã thêm sách vào danh sách yêu thích");
        } else {
            redirectAttributes.addFlashAttribute("success", "Đã xóa sách khỏi danh sách yêu thích");
        }
        return "redirect:" + referer;
    }

    @GetMapping("/danhsachyeuthich")
    public String index(Model model, @AuthenticationPrincipal TaiKhoan taiKhoan,
            RedirectAttributes redirectAttributes) {
        if (taiKhoan == null) {
            redirectAttributes.addFlashAttribute("error", "Vui lòng đăng nhập");
            return "redirect:/login";
        }
        if (taiKhoan.getLoaiTaiKhoan().equals("nhanvien")) {
            redirectAttributes.addFlashAttribute("error", "Chức năng dành cho độc giả");
            return "redirect:/";
        }
        DocGia docGia = taiKhoanService.findByTenDangNhap(taiKhoan.getTenDangNhap()).getDocGia();
        List<YeuThich> yeuThichs = yeuThichService.findByDocGia(docGia);
        model.addAttribute("yeuThichs", yeuThichs);
        return "content/yeuthich/index";
    }

}
