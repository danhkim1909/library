package com.library.project.vinhuni.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

import com.library.project.vinhuni.service.ChatBotHoTroService;

@Controller
public class ChatController {

	@Autowired
	private ChatBotHoTroService chatBotHoTroService;

	@MessageMapping("/guicauhoi")
	@SendTo("/topic/guicautraloi")
	public String guiCauHoi(String cauHoi, SimpMessageHeaderAccessor headerAccessor) {
		String sesstionId = headerAccessor.getSessionId();
		return chatBotHoTroService.sendMessage(sesstionId, cauHoi);
	}

}
