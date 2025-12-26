package com.library.project.vinhuni.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.project.vinhuni.Utillities.ImageProcess;
import com.library.project.vinhuni.dto.SachDto;
import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.NhaXuatBan;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TacGia;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.entity.TheLoai;
import com.library.project.vinhuni.entity.YeuThich;
import com.library.project.vinhuni.repository.SachRepository;

@Service
public class SachService {

	@Autowired
	SachRepository sachRepository;

	@Autowired
	TacGiaService tacGiaService;

	@Autowired
	TheLoaiService theLoaiService;

	@Autowired
	NhaXuatBanService nhaXuatBanService;

	public List<Sach> findByVectorNull() {
		return sachRepository.findByVectorNull();
	}

	public List<Sach> findByVectorNotNullAndHienTrue() {
		return sachRepository.findByVectorNotNullAndHienTrue();
	}

	public Page<Sach> findByKeyword(String tuKhoa, Integer trang, TacGia tacGia, TheLoai theLoai, String sapXepTheo,
			Integer dungTichTrang) {
		String[] sapXep = sapXepTheo.split("_");
		Pageable pageable = null;
		if (sapXep[1].equals("asc")) {
			pageable = PageRequest.of(trang - 1, dungTichTrang, Sort.by(sapXep[0]).ascending());
		} else {
			pageable = PageRequest.of(trang - 1, dungTichTrang, Sort.by(sapXep[0]).descending());
		}
		if (sapXep[0].equals("soLanMuon")) {
			if (sapXep[1].equals("asc")) {
				return sachRepository.findByKeywordOrderBySoLanMuonAsc(tuKhoa, pageable);
			} else {
				return sachRepository.findByKeywordOrderBySoLanMuonDesc(tuKhoa, pageable);
			}
		} else {
			if (tacGia == null && theLoai == null) {
				return sachRepository.findByKeyword(tuKhoa, pageable);
			} else if (tacGia == null) {
				return sachRepository.findByKeywordAndTheLoai(tuKhoa, theLoai, pageable);
			} else if (theLoai == null) {
				return sachRepository.findByKeywordAndTacGia(tuKhoa, tacGia, pageable);
			} else {
				return sachRepository.findByKeywordAndTheLoaiAndTacGia(tuKhoa, theLoai, tacGia, pageable);
			}
		}
	}

	public void createVector(Sach sach, List<Double> vector) {
		sach.setVector(vector);
		sachRepository.save(sach);
	}

	public Sach findByMaSach(Long maSach) {
		return sachRepository.findByMaSach(maSach);
	}

	public List<Sach> findAll() {
		return sachRepository.findAll();
	}

	public Sach getSachFromDto(SachDto sachDto) {
		Sach sach = new Sach();

		List<TacGia> tacGias = tacGiaService.findAllByMaTacGiaIn(sachDto.getTacGiaIds());
		List<TheLoai> theLoais = theLoaiService.findAllByMaTheLoaiIn(sachDto.getTheLoaiIds());
		NhaXuatBan nhaXB = nhaXuatBanService.findByMaNXB(sachDto.getNxbId());

		sach.setNxb(nhaXB);
		sach.setTacGias(tacGias);
		sach.setTheLoais(theLoais);

		sach.setMaSach(sachDto.getMaSach());
		sach.setTenSach(sachDto.getTenSach());
		sach.setMoTa(sachDto.getMoTa());
		sach.setAnhBia(sachDto.getAnhBia());
		sach.setNamXuatBan(sachDto.getNamXuatBan());
		sach.setNgayNhap(sachDto.getNgayNhap());
		sach.setTinhTrang(sachDto.getTinhTrang());

		return sach;
	}

	public List<Sach> findByHienTrueOrderByNgayNhapDesc() {
		return sachRepository.findByHienTrueOrderByNgayNhapDesc();
	}

	public void create(Sach sach, MultipartFile fileAnhBia) throws IOException {
		byte[] anhBase64 = fileAnhBia.getBytes();
		String kieu = fileAnhBia.getContentType();
		sach.setAnhBia(ImageProcess.convertImage2String(anhBase64, kieu));
		sach.setNgayNhap(LocalDate.now());
		sach.setHien(true);
		sachRepository.save(sach);
	}

	public void update(Sach sach, MultipartFile fileAnhBia) throws IOException {
		Sach sachDB = sachRepository.findByMaSach(sach.getMaSach());
		if (!fileAnhBia.isEmpty()) {
			byte[] anhBase64 = fileAnhBia.getBytes();
			String kieu = fileAnhBia.getContentType();
			sach.setAnhBia(ImageProcess.convertImage2String(anhBase64, kieu));
		} else {
			sach.setAnhBia(sachDB.getAnhBia());
		}
		sach.setHien(sachDB.getHien());
		sach.setNgayNhap(sachDB.getNgayNhap());
		sachRepository.save(sach);
	}

	public void show(Sach sach) {
		sach.setHien(!sach.getHien());
		sachRepository.save(sach);
	}

	public List<Sach> checkDaThich(List<Sach> saches, TaiKhoan taiKhoan) {
		if (taiKhoan == null) {
			return saches;
		}
		DocGia docGia = taiKhoan.getDocGia();

		for (Sach sach : saches) {
			boolean check = false;
			if (docGia != null) {
				for (YeuThich yeuThich : sach.getYeuThichs()) {
					if (yeuThich.getDocGia().getMaDocGia() == docGia.getMaDocGia()) {
						check = true;
						break;
					}
				}
			}
			sach.setDaThich(check);
		}
		return saches;
	}

	public void checkDaThich(Page<Sach> page, TaiKhoan taiKhoan) {
		checkDaThich(page.getContent(), taiKhoan);
	}

}
