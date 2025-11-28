package com.library.project.vinhuni.controller.admin;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.project.vinhuni.entity.PhieuNhap;
import com.library.project.vinhuni.service.KhoService;
import com.library.project.vinhuni.service.MuonSachService;
import com.library.project.vinhuni.service.PhieuNhapService;
import com.library.project.vinhuni.service.SachService;
import com.library.project.vinhuni.service.TraSachService;

@Controller
@RequestMapping("/admin")
public class BangDieuKhienController {

	@Autowired
	SachService sachService;

	@Autowired
	KhoService khoService;

	@Autowired
	PhieuNhapService phieuNhapService;

	@Autowired
	MuonSachService muonSachService;

	@Autowired
	TraSachService traSachService;

	@GetMapping("")
	public String index(Model model) {
		Integer loaiSachTrongKho = sachService.findAll().size();
		Integer loaiSachMoi = sachService.findAll().stream().filter(s -> s.isMoi()).toList().size();
		model.addAttribute("loaiSachMoi", loaiSachMoi);
		model.addAttribute("loaiSachTrongKho", loaiSachTrongKho);

		Integer trongKho = khoService.getAll().stream().mapToInt(kho -> kho.getSoLuong()).sum();
		model.addAttribute("trongKho", trongKho);

		LocalDateTime bayNgayTruoc = LocalDateTime.now().minusDays(7);

		List<PhieuNhap> nhapThemTrongTuanList = phieuNhapService.getAll().stream().filter(n -> n.getNgayNhap().isAfter(bayNgayTruoc)).toList();
		Integer nhapThemTrongTuan = nhapThemTrongTuanList.stream().flatMap(pn -> pn.getChiTietList().stream()).mapToInt(ct -> ct.getSoLuong()).sum();
		model.addAttribute("nhapThemTrongTuan", nhapThemTrongTuan);

		Integer muonTrongTuan = muonSachService.getAll().stream().filter(m -> m.getThoiGianMuon().isAfter(bayNgayTruoc)).mapToInt(m -> m.getSoLuong()).sum();
		Integer daTra = traSachService.findByXacNhanTrue().stream().filter(tr -> tr.getMuonSach().getThoiGianMuon().isAfter(bayNgayTruoc)).mapToInt(tr -> tr.getMuonSach().getSoLuong()).sum();
		model.addAttribute("daTra", daTra);
		model.addAttribute("muonTrongTuan", muonTrongTuan);
		return "admin/dashboard";
	}
}
