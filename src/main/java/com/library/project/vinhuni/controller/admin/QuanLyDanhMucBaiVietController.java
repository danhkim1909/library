package com.library.project.vinhuni.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.library.project.vinhuni.entity.DanhMucBaiViet;
import com.library.project.vinhuni.service.DanhMucBaiVietService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/admin/danhmucbaiviet")
public class QuanLyDanhMucBaiVietController {

    @Autowired
    private DanhMucBaiVietService danhMucBaiVietService;

    @GetMapping
    public String index(Model model) {
        List<DanhMucBaiViet> danhMucBaiViets = danhMucBaiVietService.findAllOrderByThuTu();
        model.addAttribute("danhMucBaiViets", danhMucBaiViets);
        return "admin/danhmucbaiviet/index";
    }

    @GetMapping("/create")
    public String create(Model model) {
        DanhMucBaiViet danhMucBaiViet = new DanhMucBaiViet();
        model.addAttribute("danhMucBaiViet", danhMucBaiViet);
        return "admin/danhmucbaiviet/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("danhMucBaiViet") DanhMucBaiViet danhMucBaiViet, BindingResult result,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "admin/danhmucbaiviet/create";
        }
        danhMucBaiVietService.create(danhMucBaiViet);
        redirectAttributes.addFlashAttribute("success", "Thêm danh mục bài viết thành công");
        return "redirect:/admin/danhmucbaiviet";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable("id") Integer maDanhMuc, Model model, RedirectAttributes redirectAttributes) {
        DanhMucBaiViet danhMucBaiViet = danhMucBaiVietService.findByMaDanhMuc(maDanhMuc);
        if (danhMucBaiViet == null) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy danh mục bài viết");
            return "redirect:/admin/danhmucbaiviet";
        }
        model.addAttribute("danhMucBaiViet", danhMucBaiViet);
        return "admin/danhmucbaiviet/update";
    }

    @PostMapping("/update")
    public String update(@Valid @ModelAttribute("danhMucBaiViet") DanhMucBaiViet danhMucBaiViet, BindingResult result,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "admin/danhmucbaiviet/update";
        }
        danhMucBaiVietService.update(danhMucBaiViet);
        redirectAttributes.addFlashAttribute("success", "Sửa danh mục bài viết thành công");
        return "redirect:/admin/danhmucbaiviet";
    }

    @PostMapping("/show/{id}")
    public String show(@PathVariable("id") Integer maDanhMuc, RedirectAttributes redirectAttributes) {
        DanhMucBaiViet danhMucBaiViet = danhMucBaiVietService.findByMaDanhMuc(maDanhMuc);
        if (danhMucBaiViet == null) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy danh mục bài viết");
            return "redirect:/admin/danhmucbaiviet";
        }
        redirectAttributes.addFlashAttribute("success", "Đổi trạng thái hiển thị danh mục bài viết thành công");
        danhMucBaiVietService.show(danhMucBaiViet);
        return "redirect:/admin/danhmucbaiviet";
    }

    @PostMapping("/up/{id}")
    public String up(@PathVariable("id") Integer maDanhMuc, RedirectAttributes redirectAttributes) {
        DanhMucBaiViet danhMucBaiViet = danhMucBaiVietService.findByMaDanhMuc(maDanhMuc);
        if (danhMucBaiViet == null) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy danh mục bài viết");
            return "redirect:/admin/danhmucbaiviet";
        }
        danhMucBaiVietService.up(danhMucBaiViet);
        redirectAttributes.addFlashAttribute("success", "Đổi thứ tự danh mục bài viết thành công");
        return "redirect:/admin/danhmucbaiviet";
    }

    @PostMapping("/down/{id}")
    public String down(@PathVariable("id") Integer maDanhMuc, RedirectAttributes redirectAttributes) {
        DanhMucBaiViet danhMucBaiViet = danhMucBaiVietService.findByMaDanhMuc(maDanhMuc);
        if (danhMucBaiViet == null) {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy danh mục bài viết");
            return "redirect:/admin/danhmucbaiviet";
        }
        danhMucBaiVietService.down(danhMucBaiViet);
        redirectAttributes.addFlashAttribute("success", "Đổi thứ tự danh mục bài viết thành công");
        return "redirect:/admin/danhmucbaiviet";
    }

}
