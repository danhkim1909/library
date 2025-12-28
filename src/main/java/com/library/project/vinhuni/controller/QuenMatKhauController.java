package com.library.project.vinhuni.controller;

import java.net.http.HttpRequest;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.library.project.vinhuni.Utillities.Functions;
import com.library.project.vinhuni.entity.NoiDungEmail;
import com.library.project.vinhuni.entity.TaiKhoan;
import com.library.project.vinhuni.service.EmailService;
import com.library.project.vinhuni.service.TaiKhoanService;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class QuenMatKhauController {

    @Autowired
    private EmailService emailService;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @GetMapping("/quen-mat-khau")
    public String quenMatKhau() {
        return "content/quenmatkhau/index";
    }

    private final Cache<String, String> otpCache = Caffeine
            .newBuilder()
            .expireAfterWrite(5, TimeUnit.MINUTES)
            .maximumSize(1000)
            .build();

    @PostMapping("/quen-mat-khau")
    public String quenMatKhauPost(@RequestParam("username") String tenDangNhap,
            RedirectAttributes redirectAttributess) {
        TaiKhoan taiKhoan = taiKhoanService.findByTenDangNhap(tenDangNhap);
        if (taiKhoan != null) {
            String otp = Functions.randomString(6);
            String key = "OTP_" + tenDangNhap;

            otpCache.put(key, otp);

            NoiDungEmail email = new NoiDungEmail();
            email.setNguoiNhan(taiKhoan.getEmail());
            email.setTieuDe("Xác nhận quên mật khẩu");
            email.setNoiDung("Bạn vừa gửi một thông báo quên mật khẩu cho tài khoản" + tenDangNhap +
                    "Mã OTP của bạn là: <strong>" + otp + "</strong><br>"
                    + "Mã OTP chỉ tồn tại trong vòng 5 phút, nếu bạn không yêu cầu này, vui lòng bỏ qua email này" +
                    "Thân mến,<br>"
                    + "<strong style='color: #0056b3;'>Đội ngũ Thư viện BookJar</strong>");

            emailService.guiEmail(email);
            redirectAttributess.addFlashAttribute("success", "Đã gửi OTP đến email của bạn");
            return "redirect:/khoi-phuc";

        } else {
            redirectAttributess.addFlashAttribute("error", "Tài khoản không tồn tại");
            return "redirect:/quen-mat-khau";
        }

    }

    @GetMapping("/khoi-phuc")
    public String khoiPhuc() {
        return "content/quenmatkhau/khoiphuc";
    }

    @PostMapping("/khoi-phuc")
    public String khoiPhucPost(@RequestParam("username") String tenDangNhap,
            @RequestParam("otp") String otp, RedirectAttributes redirectAttributess) {

        TaiKhoan taiKhoan = taiKhoanService.findByTenDangNhap(tenDangNhap);
        if (taiKhoan == null) {
            redirectAttributess.addFlashAttribute("error", "Sai tên đăng nhập");
            return "redirect:/khoi-phuc";
        }

        String key = "OTP_" + tenDangNhap;
        String otpCode = otpCache.getIfPresent(key);
        if (otpCode != null && otpCode.equals(otp)) {
            otpCache.invalidate(key);

            String matKhauMoi = Functions.randomString(8);
            taiKhoanService.changePassword(matKhauMoi, tenDangNhap);

            NoiDungEmail email = new NoiDungEmail();
            email.setNguoiNhan(taiKhoan.getEmail());
            email.setTieuDe("Khôi phục mật khẩu");
            email.setNoiDung("Bạn vừa gửi một yêu cầu khôi phục cho tài khoản " + tenDangNhap +
                    "Mật khẩu mới của bạn là: <strong>" + matKhauMoi + "</strong><br>"
                    + "Để đảm bảo an toàn, vui lòng thay đổi mật khẩu ngay khi đăng nhập" +
                    "Thân mến,<br>"
                    + "<strong style='color: #0056b3;'>Đội ngũ Thư viện BookJar</strong>");

            emailService.guiEmail(email);
            redirectAttributess.addFlashAttribute("success", "Mật khẩu mới đã được gửi đến email của bạn");
            return "redirect:/login";
        } else {
            redirectAttributess.addFlashAttribute("error", "Mã OTP không hợp lệ hoặc đã hết hạn");
            return "redirect:/khoi-phuc";
        }
    }

}
