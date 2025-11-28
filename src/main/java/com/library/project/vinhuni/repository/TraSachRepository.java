package com.library.project.vinhuni.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.project.vinhuni.entity.TraSach;

public interface TraSachRepository extends JpaRepository<TraSach, Long> {

	List<TraSach> findByXacNhanTrue();

	List<TraSach> findByXacNhanFalse();

}
