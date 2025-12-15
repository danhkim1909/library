package com.library.project.vinhuni.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TacGia;
import com.library.project.vinhuni.entity.TheLoai;

public interface SachRepository extends JpaRepository<Sach, Long> {

	List<Sach> findByHienTrueOrderByNgayNhapDesc();

	List<Sach> findByVectorNotNullAndHienTrue();

	Sach findByMaSach(Long maSach);

	List<Sach> findByVectorNull();

	@Query("SELECT s FROM Sach s WHERE (s.tenSach LIKE CONCAT('%', :tuKhoa, '%') OR s.moTa LIKE CONCAT('%', :tuKhoa, '%')) AND s.hien = true")
	Page<Sach> findByKeyword(String tuKhoa, Pageable pageable);

	@Query("SELECT s FROM Sach s WHERE (s.tenSach LIKE CONCAT('%', :tuKhoa, '%') OR s.moTa LIKE CONCAT('%', :tuKhoa, '%')) AND s.hien = true AND :tacGia MEMBER OF s.tacGias")
	Page<Sach> findByKeywordAndTacGia(String tuKhoa, @Param("tacGia") TacGia tacGia, Pageable pageable);

	@Query("SELECT s FROM Sach s WHERE (s.tenSach LIKE CONCAT('%', :tuKhoa, '%') OR s.moTa LIKE CONCAT('%', :tuKhoa, '%')) AND s.hien = true AND :theLoai MEMBER OF s.theLoais")
	Page<Sach> findByKeywordAndTheLoai(String tuKhoa, @Param("theLoai") TheLoai theLoai, Pageable pageable);

	@Query("SELECT s FROM Sach s WHERE (s.tenSach LIKE CONCAT('%', :tuKhoa, '%') OR s.moTa LIKE CONCAT('%', :tuKhoa, '%')) AND s.hien = true AND :theLoai MEMBER OF s.theLoais AND :tacGia MEMBER OF s.tacGias")
	Page<Sach> findByKeywordAndTheLoaiAndTacGia(String tuKhoa, @Param("theLoai") TheLoai theLoai,
			@Param("tacGia") TacGia tacGia, Pageable pageable);
}
