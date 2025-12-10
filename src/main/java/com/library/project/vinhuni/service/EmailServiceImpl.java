package com.library.project.vinhuni.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.library.project.vinhuni.entity.NoiDungEmail;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Value("${spring.mail.username}")
	private String nguoiGui;

	@Override
	public String guiEmail(NoiDungEmail noiDungEmail) {
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper mail = new MimeMessageHelper(message, false, "UTF-8");
			mail.setFrom(nguoiGui);
			mail.setTo(noiDungEmail.getNguoiNhan());
			mail.setSubject(noiDungEmail.getTieuDe());
			mail.setText(noiDungEmail.getNoiDung(), true);
			javaMailSender.send(message);
			System.out.print("Mail Đã gửi thành công");
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("Có lỗi:  " + e.getMessage());
			return "";
		}
	}
}
