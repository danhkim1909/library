package com.library.project.vinhuni.controller.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authorization.method.AuthorizeReturnObject;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.project.vinhuni.dto.BaiVietDto;
import com.library.project.vinhuni.entity.BaiViet;
import com.library.project.vinhuni.entity.DanhMucBaiViet;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.repository.DanhMucBaiVietRepository;
import com.library.project.vinhuni.service.BaiVietService;
import com.library.project.vinhuni.service.DanhMucBaiVietService;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/admin/baiviet")
public class QuanLyBaiVietController {

    @Autowired
    private BaiVietService baiVietService;

    @Autowired
    DanhMucBaiVietService danhMucBaiVietService;

    @GetMapping
    public String index(Model model, @RequestParam(defaultValue = "0") int page) {

        Pageable pageable = PageRequest.of(page, 5);
        Page<BaiViet> baiViets = baiVietService.findAllByOrderByNgayTaoDesc(pageable);
        model.addAttribute("baiViets", baiViets);
        return "admin/baiviet/index";
    }

    @GetMapping("/create")
    public String create(Model model) {
        List<DanhMucBaiViet> danhMucBaiViets = danhMucBaiVietService.findByHienTrueOrderByThuTuAsc();
        model.addAttribute("danhMucBaiViets", danhMucBaiViets);

        BaiVietDto baiVietDto = new BaiVietDto();
        model.addAttribute("baiViet", baiVietDto);
        return "admin/baiviet/create";
    }

    @PostMapping("/create")
    public String create(@Valid @ModelAttribute("baiViet") BaiVietDto baiVietDto, BindingResult result,
            RedirectAttributes redirectAttributes, @AuthenticationPrincipal TaiKhoan taiKhoan, Model model)
            throws IOException {

        if (baiVietDto.getAnh() == null || baiVietDto.getAnh().isEmpty()) {
            result.rejectValue("anh", "error.anh", "Ảnh không được để trống");
        }

        if (result.hasErrors()) {
            List<DanhMucBaiViet> danhMucBaiViets = danhMucBaiVietService.findByHienTrueOrderByThuTuAsc();
            model.addAttribute("danhMucBaiViets", danhMucBaiViets);
            return "admin/baiviet/create";
        }

        baiVietService.create(baiVietDto, taiKhoan.getNhanVien());

        redirectAttributes.addFlashAttribute("success", "Thêm bài viết thành công");
        return "redirect:/admin/baiviet";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable("id") Long maBaiViet, Model model, RedirectAttributes redirectAttributes) {
        List<DanhMucBaiViet> danhMucBaiViets = danhMucBaiVietService.findByHienTrueOrderByThuTuAsc();
        model.addAttribute("danhMucBaiViets", danhMucBaiViets);

        BaiViet baiViet = baiVietService.findByMaBaiViet(maBaiViet);
        if (baiViet == null) {
            redirectAttributes.addFlashAttribute("error", "Bài viết không tồn tại");
            return "redirect:/admin/baiviet";
        }

        BaiVietDto baiVietDto = new BaiVietDto(baiViet);
        model.addAttribute("baiViet", baiVietDto);
        return "admin/baiviet/update";
    }

    @PostMapping("/update")
    public String update(@Valid @ModelAttribute("baiViet") BaiVietDto baiVietDto, BindingResult result,
            RedirectAttributes redirectAttributes, @AuthenticationPrincipal TaiKhoan taiKhoan, Model model)
            throws IOException {

        if (result.hasErrors()) {
            List<DanhMucBaiViet> danhMucBaiViets = danhMucBaiVietService.findByHienTrueOrderByThuTuAsc();
            model.addAttribute("danhMucBaiViets", danhMucBaiViets);
            return "admin/baiviet/update";
        }

        baiVietService.update(baiVietDto);

        redirectAttributes.addFlashAttribute("success", "Cập nhật bài viết thành công");
        return "redirect:/admin/baiviet";
    }

    @PostMapping("/show/{id}")
    public String show(@PathVariable("id") Long maBaiViet, RedirectAttributes redirectAttributes) {
        BaiViet baiViet = baiVietService.findByMaBaiViet(maBaiViet);
        if (baiViet == null) {
            redirectAttributes.addFlashAttribute("error", "Bài viết không tồn tại");
            return "redirect:/admin/baiviet";
        }

        baiVietService.show(baiViet);

        redirectAttributes.addFlashAttribute("success", "Hiển thị bài viết thành công");
        return "redirect:/admin/baiviet";
    }

}
