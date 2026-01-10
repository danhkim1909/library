package com.library.project.vinhuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.project.vinhuni.entity.DanhGia;
import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TacGia;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.entity.TheLoai;
import com.library.project.vinhuni.service.DanhGiaService;
import com.library.project.vinhuni.service.MuonSachService;
import com.library.project.vinhuni.service.SachService;
import com.library.project.vinhuni.service.TacGiaService;
import com.library.project.vinhuni.service.TaiKhoanService;
import com.library.project.vinhuni.service.TheLoaiService;
import com.library.project.vinhuni.service.YeuThichService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SachController {

	@Autowired
	MuonSachService muonSachService;

	@Autowired
	private SachService sachService;

	@Autowired
	private TacGiaService tacGiaService;

	@Autowired
	private TheLoaiService theLoaiService;

	@Autowired
	private TaiKhoanService taiKhoanService;

	@Autowired
	private DanhGiaService danhGiaService;

	@Autowired
	private YeuThichService yeuThichService;

	SachController(DanhGiaService danhGiaService, MuonSachService muonSachService) {
		this.danhGiaService = danhGiaService;
		this.muonSachService = muonSachService;
	}

	final Integer DUNGTICHTRANG = 8;

	@GetMapping("/sach")
	public String index(@RequestParam(defaultValue = "") String tuKhoa, @RequestParam(defaultValue = "1") Integer trang,
			@RequestParam(defaultValue = "0") Integer maTacGia, @RequestParam(defaultValue = "0") Integer maTheLoai,
			@RequestParam(defaultValue = "ngayNhap_desc") String sapXepTheo, Model model,
			@AuthenticationPrincipal TaiKhoan taiKhoan) {
		model.addAttribute("tuKhoa", tuKhoa);
		model.addAttribute("maTacGia", maTacGia);
		model.addAttribute("maTheLoai", maTheLoai);
		model.addAttribute("sapXepTheo", sapXepTheo);

		TacGia tacGia = null;
		TheLoai theLoai = null;
		if (maTacGia != 0) {
			tacGia = tacGiaService.findByMaTacGia(maTacGia);
		}
		if (maTheLoai != 0) {
			theLoai = theLoaiService.findByMaTheLoai(maTheLoai);
		}
		Page<Sach> truyVan = sachService.findByKeyword(tuKhoa, trang, tacGia, theLoai, sapXepTheo, DUNGTICHTRANG);
		sachService.checkDaThich(truyVan, taiKhoan);

		model.addAttribute("truyVan", truyVan);

		List<TheLoai> theLoais = theLoaiService.findByHienTrue();
		model.addAttribute("theLoais", theLoais);

		List<TacGia> tacGias = tacGiaService.findByHienTrue();
		model.addAttribute("tacGias", tacGias);

		return "content/sach/index";
	}

	@GetMapping("/sach/{id}")
	public String detail(@PathVariable Long id, Model model, HttpServletRequest request,
			@AuthenticationPrincipal TaiKhoan taiKhoan) {

		request.getSession(true);
		Sach sach = sachService.findByMaSach(id);
		if (sach == null) {
			return "redirect:/sach";
		}

		DanhGia danhGiaMoi = null;
		DanhGia danhGiaCu = null;

		if (taiKhoan != null) {
			DocGia docGia = taiKhoan.getDocGia();
			model.addAttribute("docGia", docGia);
			danhGiaCu = danhGiaService.findByDocGiaAndSach(docGia, sach);

			if (muonSachService.findByXacNhanTrueAndDocGiaAndSach(docGia, sach).size() > 0) {
				danhGiaMoi = new DanhGia();
			}
		}

		model.addAttribute("danhGiaMoi", danhGiaMoi);
		model.addAttribute("danhGiaCu", danhGiaCu);

		MuonSach muonSach = new MuonSach();
		muonSach.setSoLuong(1);
		model.addAttribute("muonSach", muonSach);

		List<Sach> sachTuongDongs = sachService.findByCousineSimilarity(sach.getVector(), 4, id);
		model.addAttribute("sachTuongDongs", sachTuongDongs);
		model.addAttribute("sach", sach);
		return "content/sach/detail";
	}
}
