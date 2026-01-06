package com.library.project.vinhuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.project.vinhuni.entity.BaiViet;
import com.library.project.vinhuni.entity.DanhMucBaiViet;
import com.library.project.vinhuni.service.BaiVietService;
import com.library.project.vinhuni.service.DanhMucBaiVietService;

@Controller
@RequestMapping("/baiviet")
public class BaiVietController {

    final Integer DUNGTICHTRANG = 1;

    @Autowired
    BaiVietService baiVietService;

    @Autowired
    DanhMucBaiVietService danhMucBaiVietService;

    @GetMapping
    public String index(Model model, @RequestParam(name = "page", defaultValue = "1") Integer trang,
            @RequestParam(name = "category", defaultValue = "0") Integer danhMucId,
            @RequestParam(name = "keyword", defaultValue = "") String tuKhoa) {

        List<DanhMucBaiViet> danhMucBaiViets = danhMucBaiVietService.findByHienTrueOrderByThuTuAsc();

        Page<BaiViet> baiViets = baiVietService.index(trang, DUNGTICHTRANG, tuKhoa,
                danhMucId);

        model.addAttribute("danhMucBaiViets", danhMucBaiViets);
        model.addAttribute("truyVan", baiViets);

        model.addAttribute("category", danhMucId);
        model.addAttribute("keyword", tuKhoa);

        return "content/baiviet/index";
    }
}
