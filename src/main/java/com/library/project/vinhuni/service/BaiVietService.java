package com.library.project.vinhuni.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.project.vinhuni.Utillities.Functions;
import com.library.project.vinhuni.Utillities.ImageProcess;
import com.library.project.vinhuni.dto.BaiVietDto;
import com.library.project.vinhuni.entity.BaiViet;
import com.library.project.vinhuni.entity.DanhMucBaiViet;
import com.library.project.vinhuni.entity.NhanVien;
import com.library.project.vinhuni.repository.BaiVietRepository;

@Service
public class BaiVietService {

    @Autowired
    DanhMucBaiVietService danhMucBaiVietService;

    @Autowired
    private BaiVietRepository baiVietRepository;

    public BaiViet findByMaBaiViet(Long maBaiViet) {
        return baiVietRepository.findById(maBaiViet).orElse(null);
    }

    public List<BaiViet> findByHienTrueAndOrderByNgayTaoDesc() {
        return baiVietRepository.findByHienTrueOrderByNgayTaoDesc();
    }

    public Page<BaiViet> findAllByOrderByNgayTaoDesc(Pageable pageable) {
        return baiVietRepository.findAll(pageable);
    }

    public void create(BaiVietDto baiVietDto, NhanVien nhanVien) throws IOException {
        BaiViet baiViet = new BaiViet();
        baiViet.setNgayTao(LocalDateTime.now());
        baiViet.setNhanVien(nhanVien);
        baiViet.setHien(baiVietDto.getHien());
        baiViet.setTenBaiViet(baiVietDto.getTenBaiViet());
        baiViet.setNoiDung(baiVietDto.getNoiDung());
        baiViet.setMoTa(baiVietDto.getMoTa());

        DanhMucBaiViet danhMucBaiViet = danhMucBaiVietService.findByMaDanhMuc(baiVietDto.getDanhMucBaiVietId());
        baiViet.setDanhMucBaiViet(danhMucBaiViet);

        byte[] anhBytes = baiVietDto.getAnh().getBytes();
        String anhBase64 = ImageProcess.convertImage2String(anhBytes, baiVietDto.getAnh().getContentType());
        baiViet.setAnh(anhBase64);

        baiVietRepository.save(baiViet);
    }

    public void update(BaiVietDto baiVietDto) throws IOException {
        BaiViet baiViet = findByMaBaiViet(baiVietDto.getMaBaiViet());
        baiViet.setTenBaiViet(baiVietDto.getTenBaiViet());
        baiViet.setNoiDung(baiVietDto.getNoiDung());
        baiViet.setMoTa(baiVietDto.getMoTa());
        baiViet.setHien(baiVietDto.getHien());

        DanhMucBaiViet danhMucBaiViet = danhMucBaiVietService.findByMaDanhMuc(baiVietDto.getDanhMucBaiVietId());
        baiViet.setDanhMucBaiViet(danhMucBaiViet);

        if (!baiVietDto.getAnh().isEmpty()) {
            byte[] anhBytes = baiVietDto.getAnh().getBytes();
            String anhBase64 = ImageProcess.convertImage2String(anhBytes, baiVietDto.getAnh().getContentType());
            baiViet.setAnh(anhBase64);
        }

        baiVietRepository.save(baiViet);
    }

    public void show(BaiViet baiViet) {
        baiViet.setHien(!baiViet.getHien());
        baiVietRepository.save(baiViet);
    }

}
