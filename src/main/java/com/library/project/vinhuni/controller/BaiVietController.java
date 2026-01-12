package com.library.project.vinhuni.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

		Page<BaiViet> baiViets = baiVietService.index(trang, DUNGTICHTRANG, tuKhoa, danhMucId);

		model.addAttribute("danhMucBaiViets", danhMucBaiViets);
		model.addAttribute("truyVan", baiViets);

		model.addAttribute("category", danhMucId);
		model.addAttribute("keyword", tuKhoa);

		return "content/baiviet/index";
	}

	@GetMapping("/{id}")
	public String chiTietBaiViet(Model model, @PathVariable("id") Long maBaiViet,
			RedirectAttributes redirectAttributes) {
		BaiViet baiViet = baiVietService.findByMaBaiViet(maBaiViet);
		if (baiViet == null || !baiViet.getHien()) {
			redirectAttributes.addFlashAttribute("error", "Bài viết không tồn tại hoặc đã bị ẩn");
			return "redirect:/baiviet";
		}
		List<BaiViet> baiViets = baiVietService.findByHienTrueAndOrderByNgayTaoDesc();
		baiViets = baiViets.stream()
				.filter(bv -> bv.getDanhMucBaiViet().getMaDanhMuc() == baiViet.getDanhMucBaiViet().getMaDanhMuc()
						&& bv.getMaBaiViet() != baiViet.getMaBaiViet())
				.limit(5).collect(Collectors.toList());
		model.addAttribute("baiVietTuongu", baiViets);
		model.addAttribute("baiViet", baiViet);
		return "content/baiviet/chitiet";
	}

}
