package com.library.project.vinhuni.controller.advice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.library.project.vinhuni.entity.DanhMucBaiViet;
import com.library.project.vinhuni.service.DanhMucBaiVietService;

@ControllerAdvice
public class MenuAdvice {

    @Autowired
    DanhMucBaiVietService danhMucBaiVietService;

    @ModelAttribute("menuData")
    public Map<String, Object> getMenuData() {

        Map<String, Object> menu = new HashMap<>();
        List<DanhMucBaiViet> danhMucBaiViets = danhMucBaiVietService.findByHienTrueOrderByThuTuAsc();
        Map<Integer, String> danhMucBaiVietIds = danhMucBaiViets.stream()
                .collect(Collectors.toMap(s -> s.getMaDanhMuc(), s -> s.getTenDanhMuc()));
        menu.put("danhMucBaiViets", danhMucBaiVietIds);

        return menu;
    }
}
