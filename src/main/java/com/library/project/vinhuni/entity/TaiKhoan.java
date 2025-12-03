package com.library.project.vinhuni.entity;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tblTaiKhoan")
public class TaiKhoan implements UserDetails {

	@Id
	@Column(name = "TenDangNhap", length = 50)
	private String tenDangNhap;

	@Column(name = "MatKhau", length = 255, nullable = false)
	private String matKhau;

	@Column(name = "LoaiTaiKhoan", length = 20)
	private String loaiTaiKhoan;

	@Column(name = "TrangThai", nullable = false)
	private Boolean trangThai;

	@OneToOne
	@JoinColumn(name = "MaNhanVien", referencedColumnName = "MaNhanVien")
	private NhanVien nhanVien;

	@OneToOne
	@JoinColumn(name = "MaDocGia", referencedColumnName = "MaDocGia")
	private DocGia docGia;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		String loaiTK = this.loaiTaiKhoan;
		if (loaiTK == null) {
			loaiTK = "ROLE_docgia";
		}
		return Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + this.loaiTaiKhoan));
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getLoaiTaiKhoan() {
		return loaiTaiKhoan;
	}

	public void setLoaiTaiKhoan(String loaiTaiKhoan) {
		this.loaiTaiKhoan = loaiTaiKhoan;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setDocGia(DocGia docGia) {

		this.docGia = docGia;
	}

	public DocGia getDocGia() {
		return docGia;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public Boolean getTrangThai() {
		return this.trangThai;
	}

	public void setTrangThai(Boolean trangThai) {
		this.trangThai = trangThai;
	}

	@Override
	public String getPassword() {
		return this.matKhau;
	}

	@Override
	public String getUsername() {
		return this.tenDangNhap;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return trangThai;
	}
}