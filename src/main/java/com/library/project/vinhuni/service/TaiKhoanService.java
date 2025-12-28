package com.library.project.vinhuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.repository.TaiKhoanRepository;

@Service
public class TaiKhoanService implements UserDetailsService {
	@Autowired
	private TaiKhoanRepository taiKhoanRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public List<TaiKhoan> findAll() {
		return taiKhoanRepository.findAll();
	}

	public void changePassword(String matKhauMoi, String tenDangNhap) {
		TaiKhoan taiKhoan = taiKhoanRepository.findByTenDangNhap(tenDangNhap).orElse(null);
		taiKhoan.setMatKhau(passwordEncoder.encode(matKhauMoi));
		taiKhoanRepository.save(taiKhoan);
	}

	public TaiKhoan findByTenDangNhap(String tenDangNhap) {
		return taiKhoanRepository.findByTenDangNhap(tenDangNhap).orElse(null);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		TaiKhoan taiKhoan = taiKhoanRepository.findByTenDangNhap(username).orElse(null);

		if (taiKhoan == null) {
			throw new UsernameNotFoundException("Không tìm thấy tài khoản với tên: " + username);
		}

		return taiKhoan;
	}

	public void show(String tenDangNhap) {
		TaiKhoan taiKhoan = taiKhoanRepository.findByTenDangNhap(tenDangNhap).orElse(null);
		taiKhoan.setTrangThai(!taiKhoan.getTrangThai());
		taiKhoanRepository.save(taiKhoan);
	}
}
