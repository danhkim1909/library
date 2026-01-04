package com.library.project.vinhuni.controller.admin;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.project.vinhuni.entity.MuonSach;
import com.library.project.vinhuni.entity.PhieuNhap;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TacGia;
import com.library.project.vinhuni.entity.TheLoai;
import com.library.project.vinhuni.service.DanhGiaService;
import com.library.project.vinhuni.service.KhoService;
import com.library.project.vinhuni.service.MuonSachService;
import com.library.project.vinhuni.service.PhieuNhapService;
import com.library.project.vinhuni.service.SachService;
import com.library.project.vinhuni.service.TraSachService;
import com.library.project.vinhuni.service.VectorHoaDuLieuService;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class BangDieuKhienController {

	@Autowired
	VectorHoaDuLieuService vectorHoaDuLieuService;

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
	@Autowired
	DanhGiaService danhGiaService;

	@GetMapping("")
	public String index(Model model) {
		Integer loaiSachTrongKho = sachService.findAll().size();
		Integer loaiSachMoi = sachService.findAll().stream().filter(s -> s.isMoi()).toList().size();
		model.addAttribute("loaiSachMoi", loaiSachMoi);
		model.addAttribute("loaiSachTrongKho", loaiSachTrongKho);

		Integer trongKho = khoService.getAll().stream().mapToInt(kho -> kho.getSoLuong()).sum();
		model.addAttribute("trongKho", trongKho);

		LocalDateTime bayNgayTruoc = LocalDateTime.now().minusDays(7);

		List<PhieuNhap> nhapThemTrongTuanList = phieuNhapService.getAll().stream()
				.filter(n -> n.getNgayNhap().isAfter(bayNgayTruoc)).toList();
		Integer nhapThemTrongTuan = nhapThemTrongTuanList.stream().flatMap(pn -> pn.getChiTietList().stream())
				.mapToInt(ct -> ct.getSoLuong()).sum();
		model.addAttribute("nhapThemTrongTuan", nhapThemTrongTuan);

		Integer muonTrongTuan = muonSachService.getAll().stream().filter(m -> m.getThoiGianMuon().isAfter(bayNgayTruoc))
				.mapToInt(m -> m.getSoLuong()).sum();
		Integer daTra = traSachService.findByXacNhanTrue().stream()
				.filter(tr -> tr.getMuonSach().getThoiGianMuon().isAfter(bayNgayTruoc))
				.mapToInt(tr -> tr.getMuonSach().getSoLuong()).sum();
		model.addAttribute("daTra", daTra);
		model.addAttribute("muonTrongTuan", muonTrongTuan);

		Integer danhGiaTrongTuan = danhGiaService.findAll().stream()
				.filter(dg -> dg.getThoiGian().isAfter(bayNgayTruoc)).toList().size();
		Double saoTrungBinh = danhGiaService.findAll().stream()
				.filter(dg -> dg.getThoiGian().isAfter(bayNgayTruoc) && dg.getSoSao() == 5)
				.mapToInt(dg -> dg.getSoSao()).average().orElse(0);
		model.addAttribute("saoTrungBinh", saoTrungBinh);
		model.addAttribute("danhGiaTrongTuan", danhGiaTrongTuan);

		LocalDate homNay = LocalDate.now();
		int namHienTai = homNay.getYear();
		int thangHienTai = homNay.getMonthValue();

		List<String> thang = new ArrayList<>();
		List<Integer> daTraSachMuonTrongThang = new ArrayList<>();
		List<Integer> chuaTraSachMuonTrongThang = new ArrayList<>();

		for (int i = 1; i <= thangHienTai; i++) {
			thang.add("Tháng " + i);

			YearMonth thangCanTinh = YearMonth.of(namHienTai, i);

			LocalDateTime dauThang = thangCanTinh.atDay(1).atStartOfDay();
			LocalDateTime cuoiThang = thangCanTinh.atEndOfMonth().atTime(LocalTime.MAX);

			List<MuonSach> daMuonTrongThangIList = muonSachService.getAll().stream()
					.filter(ms -> ms.getXacNhan() != null && ms.getXacNhan() == true
							&& ms.getThoiGianMuon().isAfter(dauThang) && ms.getThoiGianMuon().isBefore(cuoiThang))
					.toList();
			Integer daMuonTrongThangI = daMuonTrongThangIList.size();

			List<MuonSach> daTraSachMuonTrongThangIList = daMuonTrongThangIList.stream().filter(ms -> ms.isDaTra())
					.toList();
			Integer daTraSachMuonTrongThangI = daTraSachMuonTrongThangIList.size();

			daTraSachMuonTrongThang.add(daTraSachMuonTrongThangI);
			chuaTraSachMuonTrongThang.add(daMuonTrongThangI - daTraSachMuonTrongThangI);
		}

		model.addAttribute("thangList", thang);
		model.addAttribute("chuaTraList", chuaTraSachMuonTrongThang);
		model.addAttribute("traList", daTraSachMuonTrongThang);

		return "admin/dashboard";
	}

	@PostMapping("/vector-hoa-du-lieu")
	public String vectorHoaDuLieu(RedirectAttributes redirectAttributes) throws InterruptedException {
		List<Sach> sachList = sachService.findByVectorNull();
		if (sachList.isEmpty()) {
			redirectAttributes.addFlashAttribute("info", "Không có sách nào cần tạo vector");
			return "redirect:/admin";
		}
		for (Sach sach : sachList) {

			String tacGias = "";
			for (TacGia tg : sach.getTacGias()) {
				tacGias += tg.getTenTacGia() + ", ";
			}

			String theLoais = "";
			for (TheLoai tl : sach.getTheLoais()) {
				theLoais += tl.getTenTheLoai() + ", ";
			}

			String duLieu = "Mã sách: " + sach.getMaSach() + ", Tên sách: " + sach.getTenSach() + ", Mô tả: "
					+ sach.getMoTa() + ", Năm xuất bản: " + sach.getNamXuatBan() + ", Tác giả: " + tacGias
					+ "; Thể loại: " + theLoais + "; Nhà xuất bản: " + sach.getNxb().getTenNhaXuatBan()
					+ "; Số lượng: " + sach.getKho().getSoLuong() + "; Hiển thị: " + sach.getHien() + "; Mới: "
					+ sach.isMoi();

			List<Double> vector = vectorHoaDuLieuService.vectorHoaDuLieu(duLieu);
			if (vector != null) {
				sachService.createVector(sach, vector);
			} else {
				redirectAttributes.addFlashAttribute("error", "Tạo vector thất bại");
				return "redirect:/admin";
			}

			Thread.sleep(1000);
		}
		redirectAttributes.addFlashAttribute("success", "Tạo vector thành công");
		return "redirect:/admin";
	}

}
