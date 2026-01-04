package com.library.project.vinhuni.config;

import java.nio.charset.StandardCharsets;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class VNPayConfig {
    public static String vnp_PayUrl;
    public static String vnp_ReturnUrl;
    public static String vnp_TmnCode;
    public static String secretKey;
    public static String vnp_ApiUrl;

    @Value("${vnpay.payUrl}")
    public void setVnp_PayUrl(String vnp_PayUrl) {
        VNPayConfig.vnp_PayUrl = vnp_PayUrl;
    }

    @Value("${vnpay.returnUrl}")
    public void setVnp_ReturnUrl(String vnp_ReturnUrl) {
        VNPayConfig.vnp_ReturnUrl = vnp_ReturnUrl;
    }

    @Value("${vnpay.tmnCode}")
    public void setVnp_TmnCode(String vnp_TmnCode) {
        VNPayConfig.vnp_TmnCode = vnp_TmnCode;
    }

    @Value("${vnpay.secretKey}")
    public void setSecretKey(String secretKey) {
        VNPayConfig.secretKey = secretKey;
    }

    @Value("${vnpay.apiUrl}")
    public void setVnp_ApiUrl(String vnp_ApiUrl) {
        VNPayConfig.vnp_ApiUrl = vnp_ApiUrl;
    }

    public static String hmacSHA512(final String key, final String data) {
        try {
            if (key == null || data == null) {
                return null;
            }
            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes();
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();
        } catch (Exception ex) {
            return "";
        }
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ipAdress;
        try {
            ipAdress = request.getHeader("X-FORWARDED-FOR");
            if (ipAdress == null) {
                ipAdress = request.getRemoteAddr();
            }
        } catch (Exception e) {
            ipAdress = "Invalid IP";
        }
        return ipAdress;
    }
}