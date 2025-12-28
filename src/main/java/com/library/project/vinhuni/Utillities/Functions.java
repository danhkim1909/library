package com.library.project.vinhuni.Utillities;

import java.text.Normalizer;
import java.util.Random;
import java.util.regex.Pattern;

import com.library.project.vinhuni.entity.Sach;
import com.library.project.vinhuni.entity.TacGia;
import com.library.project.vinhuni.entity.TheLoai;

public class Functions {

	private static Random random = new Random();

	public static String randomString(int length) {
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}

	public static String stringToAlias(String input) {
		if (input == null) {
			return "";
		}

		String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);

		Pattern pattern = Pattern.compile("\\p{M}");

		String noAccent = pattern.matcher(normalized).replaceAll("");

		String slug = noAccent.toLowerCase().replaceAll("đ", "d").replaceAll("\\s+", "-").replaceAll("[^a-z0-9-]", "")
				.replaceAll("-{2,}", "-").replaceAll("^-|-$", "");

		return slug;
	}

	public static String getContentInforBookInMail(Sach sach) {

		String tenTacGia = "";
		for (TacGia tacGia : sach.getTacGias()) {
			String ten = tacGia.getTenTacGia();
			tenTacGia += ten + "<br>";
		}

		String tenTheLoai = "";
		for (TheLoai theLoai : sach.getTheLoais()) {
			String ten = theLoai.getTenTheLoai();
			tenTheLoai += ten + "<br>";
		}

		String styleTable = "width: 100%; border-collapse: collapse; margin-top: 15px;";
		String styleTh = "border: 1px solid #dddddd; text-align: left; padding: 10px; background-color: #f2f2f2; color: #333; width: 30%; font-weight: bold;";
		String styleTd = "border: 1px solid #dddddd; text-align: left; padding: 10px; color: #555;";
		String content = "<h4 style='color: #0056b3; border-bottom: 2px solid #0056b3; padding-bottom: 5px; margin-top: 25px;'>Thông tin chi tiết sách:</h4>"

				+ "<table style='" + styleTable + "'>"
				+ "<tr>"
				+ "<th style='" + styleTh + "'>Tên sách:</th>"
				+ "<td style='" + styleTd + "'><strong>" + sach.getTenSach() + "</strong></td>"
				+ "</tr>"

				+ "<tr>"
				+ "<th style='" + styleTh + "'>Tác giả:</th>"
				+ "<td style='" + styleTd + "'>" + tenTacGia + "</td>"
				+ "</tr>"

				+ "<tr>"
				+ "<th style='" + styleTh + "'>Thể loại:</th>"
				+ "<td style='" + styleTd + "'>" + tenTheLoai + "</td>"
				+ "</tr>"

				+ "<tr>"
				+ "<th style='" + styleTh + "'>Nhà xuất bản:</th>"
				+ "<td style='" + styleTd + "'>" + sach.getNxb().getTenNhaXuatBan() + "</td>"
				+ "</tr>"

				+ "<tr>"
				+ "<th style='" + styleTh + "'>Năm xuất bản:</th>"
				+ "<td style='" + styleTd + "'>" + sach.getNamXuatBan() + "</td>"
				+ "</tr>"

				+ "<tr>"
				+ "<th style='" + styleTh + "'>Mô tả:</th>"
				+ "<td style='" + styleTd + "'>" + sach.getMoTa() + "</td>"
				+ "</tr>"
				+ "</table>";
		return content;
	}
}
