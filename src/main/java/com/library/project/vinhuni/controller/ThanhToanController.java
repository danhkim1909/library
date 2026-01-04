package com.library.project.vinhuni.controller;

import java.io.UnsupportedEncodingException;
import java.net.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.project.vinhuni.entity.TraSach;
import com.library.project.vinhuni.service.TraSachService;
import com.library.project.vinhuni.service.VNPayService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/thanhtoan")
public class ThanhToanController {

    @Autowired
    VNPayService vnPayService;

    @Autowired
    TraSachService traSachService;

    @GetMapping("/tienphat/vnpay/{id}")
    public String thanhToanTienPhat(HttpServletRequest request, @PathVariable("id") Long maTraSach,
            RedirectAttributes redirectAttributes)
            throws UnsupportedEncodingException {
        TraSach traSach = traSachService.findByMaTraSach(maTraSach);
        if (traSach == null) {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra, vui lòng thử lại");
            return "redirect:/sachmuon";
        }
        String url = vnPayService.urlThanhToan(request, traSach);
        return "redirect:" + url;
    }

    @GetMapping("/vnpay-return")
    public String nhanDuLieuThanhToan(HttpServletRequest request, RedirectAttributes redirectAttributes) {

        String thanhCong = request.getParameter("vnp_TransactionStatus");
        if (thanhCong.equals("00")) {
            String tnx_ref = request.getParameter("vnp_TxnRef");
            String maTraSachString = tnx_ref.split("_")[0];

            Long maTraSach = Long.parseLong(maTraSachString);
            TraSach traSach = traSachService.findByMaTraSach(maTraSach);

            String maGiaoDich = request.getParameter("vnp_BankTranNo");

            traSachService.nopPhat(traSach, maGiaoDich);
            redirectAttributes.addFlashAttribute("success", "Nộp phạt thành công");
        } else {
            redirectAttributes.addFlashAttribute("error", "Nộp phạt thất bại");
        }

        return "redirect:/sachmuon";
    }

}
