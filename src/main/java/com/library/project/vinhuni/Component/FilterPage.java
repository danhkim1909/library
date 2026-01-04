package com.library.project.vinhuni.Component;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.support.SessionFlashMapManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FilterPage implements AccessDeniedHandler, org.springframework.security.web.AuthenticationEntryPoint {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		FlashMap flashMap = new FlashMap();
		flashMap.put("error", "Bạn không có quyền truy cập vào trang quản trị!");

		FlashMapManager flashMapManager = new SessionFlashMapManager();
		flashMapManager.saveOutputFlashMap(flashMap, request, response);

		response.sendRedirect(request.getContextPath() + "/");
	}

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.core.AuthenticationException authException)
			throws IOException, ServletException {
		FlashMap flashMap = new FlashMap();
		flashMap.put("error", "Bạn cần đăng nhập để truy cập!");

		FlashMapManager flashMapManager = new SessionFlashMapManager();
		flashMapManager.saveOutputFlashMap(flashMap, request, response);

		response.sendRedirect(request.getContextPath() + "/login");
	}
}