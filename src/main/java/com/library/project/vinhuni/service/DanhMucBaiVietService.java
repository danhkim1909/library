package com.library.project.vinhuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.DanhMucBaiViet;
import com.library.project.vinhuni.repository.DanhMucBaiVietRepository;

@Service
public class DanhMucBaiVietService {

    @Autowired
    private DanhMucBaiVietRepository danhMucBaiVietRepository;

    public List<DanhMucBaiViet> findByHienTrueOrderByThuTuAsc() {
        return danhMucBaiVietRepository.findByHienTrueOrderByThuTuAsc();
    }

    public List<DanhMucBaiViet> findAllOrderByThuTuAsc() {
        return danhMucBaiVietRepository.findAllByOrderByThuTuAsc();
    }

    public DanhMucBaiViet findByMaDanhMuc(Integer maDanhMuc) {
        return danhMucBaiVietRepository.findById(maDanhMuc).orElse(null);
    }

    public void create(DanhMucBaiViet danhMucBaiViet) {
        Integer maxThuTu = danhMucBaiVietRepository.findMaxThuTu();
        danhMucBaiViet.setThuTu(maxThuTu == null ? 1 : maxThuTu + 1);
        danhMucBaiVietRepository.save(danhMucBaiViet);
    }

    public void update(DanhMucBaiViet danhMucBaiViet) {
        danhMucBaiVietRepository.save(danhMucBaiViet);
    }

    public void show(DanhMucBaiViet danhMucBaiViet) {
        danhMucBaiViet.setHien(!danhMucBaiViet.getHien());
        danhMucBaiVietRepository.save(danhMucBaiViet);
    }

    public void up(DanhMucBaiViet danhMucLen) {
        if (danhMucLen.getThuTu() == 1) {
            return;
        }
        DanhMucBaiViet danhMucXuong = danhMucBaiVietRepository.findByThuTu(danhMucLen.getThuTu() - 1).getFirst();
        danhMucLen.setThuTu(danhMucLen.getThuTu() - 1);
        danhMucXuong.setThuTu(danhMucXuong.getThuTu() + 1);
        danhMucBaiVietRepository.save(danhMucLen);
        danhMucBaiVietRepository.save(danhMucXuong);
    }

    public void down(DanhMucBaiViet danhMucXuong) {
        if (danhMucXuong.getThuTu() == danhMucBaiVietRepository.findMaxThuTu()) {
            return;
        }
        DanhMucBaiViet danhMucLen = danhMucBaiVietRepository.findByThuTu(danhMucXuong.getThuTu() + 1).getFirst();
        danhMucXuong.setThuTu(danhMucXuong.getThuTu() + 1);
        danhMucLen.setThuTu(danhMucLen.getThuTu() - 1);
        danhMucBaiVietRepository.save(danhMucXuong);
        danhMucBaiVietRepository.save(danhMucLen);
    }
}
