package com.library.project.vinhuni.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.DocGia;
import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.YeuThich;
import com.library.project.vinhuni.repository.YeuThichRepository;

@Service
public class YeuThichService {

    @Autowired
    private YeuThichRepository yeuThichRepository;

    public void createYeuThich(Sach sach, DocGia docGia) {
        YeuThich yeuThich = new YeuThich();
        yeuThich.setNgayThich(LocalDateTime.now());
        yeuThich.setDocGia(docGia);
        yeuThich.setSach(sach);
        yeuThichRepository.save(yeuThich);
    }

    public void deleteYeuThich(Long id) {
        yeuThichRepository.deleteById(id);
    }

    public YeuThich findByDocGiaAndSach(DocGia docGia, Sach sach) {
        return yeuThichRepository.findByDocGiaAndSach(docGia, sach).orElse(null);
    }

    public List<YeuThich> findByDocGia(DocGia docGia) {
        return yeuThichRepository.findByDocGiaOrderByNgayThichDesc(docGia);
    }
}
