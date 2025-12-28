package com.library.project.vinhuni.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;
import org.springframework.web.client.RestTemplate;

import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TacGia;
import com.library.project.vinhuni.entity.TheLoai;

import jakarta.annotation.PostConstruct;
import jakarta.transaction.Transactional;
import tools.jackson.databind.JsonNode;

class Request {
	private Content systemInstruction;
	private List<Content> contents;

	public Request(Content systemInstruction, List<Content> contents) {
		this.systemInstruction = systemInstruction;
		this.contents = contents;
	}

	public Content getSystemInstruction() {
		return systemInstruction;
	}

	public void setSystemInstruction(Content systemInstruction) {
		this.systemInstruction = systemInstruction;
	}

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}
}

class Content {
	private String role;

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<Part> getParts() {
		return parts;
	}

	public void setParts(List<Part> parts) {
		this.parts = parts;
	}

	private List<Part> parts;

	public Content(String role, List<Part> parts) {
		this.role = role;
		this.parts = parts;
	}
}

class Part {
	private String text;

	public Part(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}

@Service
public class ChatBotHoTroService {

	@Autowired
	private VectorHoaDuLieuService vectorHoaDuLieuService;

	@Autowired
	private SachService sachService;

	@Value("classpath:data/rules.txt")
	private Resource rulesResource;

	@Value("${GEMINI_API_KEY}")
	private String GEMINI_API_KEY;

	@Autowired
	private RestTemplate restTemplate;

	private final Map<String, List<Content>> lichSuChat = new ConcurrentHashMap<>();

	private String rules = "";

	@PostConstruct
	public void getRules() throws IOException {
		rules = StreamUtils.copyToString(rulesResource.getInputStream(), StandardCharsets.UTF_8);

	}

	@Transactional
	public String sendMessage(String sessionId, String message) {

		List<Double> vectorMessage = new ArrayList<>();

		vectorMessage = vectorHoaDuLieuService.vectorHoaDuLieu(message);
		if (vectorMessage.size() == 0) {
			return "Xin lỗi, chúng tôi gặp sự cố";
		}

		List<Sach> sachs = sachService.findByCousineSimilarity(vectorMessage, 5, 0L);

		String apiURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key="
				+ GEMINI_API_KEY;

		List<Content> lichSu = lichSuChat.computeIfAbsent(sessionId, k -> new ArrayList<>());
		Part part = new Part(message);
		lichSu.add(new Content("user", List.of(part)));

		String attach = "Thông tin sách tìm được: \n";
		for (Sach sach : sachs) {

			String tacGias = "";
			for (TacGia tacGia : sach.getTacGias()) {
				tacGias += "" + tacGia.getTenTacGia() + ", ";
			}

			String theLoais = "";
			for (TheLoai theLoai : sach.getTheLoais()) {
				theLoais += "" + theLoai.getTenTheLoai() + ", ";
			}

			attach += "Mã sách: " + sach.getMaSach() + "\n"
					+ "Tên sách: " + sach.getTenSach() + "\n"
					+ "Tác giả: " + tacGias + "\n"
					+ "Thể loại: " + theLoais + "\n"
					+ "Năm xuất bản: " + sach.getNamXuatBan() + "\n"
					+ "Nhà xuất bản: " + sach.getNxb().getTenNhaXuatBan() + "\n"
					+ "Mô tả: " + sach.getMoTa() + "\n";
		}

		Content prompt = new Content("user", List.of(new Part(rules + "\n" + attach)));
		Request request = new Request(prompt, lichSu);
		try {
			JsonNode response = restTemplate.postForObject(apiURL, request, JsonNode.class);
			String traLoi = response.path("candidates").get(0).path("content").path("parts").get(0).path("text")
					.asText();

			part = new Part(traLoi);
			lichSu.add(new Content("model", List.of(part)));

			return traLoi;
		} catch (Exception e) {
			e.printStackTrace();
			return "Xin lỗi, chúng tôi gặp sự cố";
		}

	}

}
