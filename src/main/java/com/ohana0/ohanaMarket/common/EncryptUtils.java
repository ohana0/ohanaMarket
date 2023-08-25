package com.ohana0.ohanaMarket.common;

import java.security.MessageDigest;

public class EncryptUtils {

	public static String md5(String message) {
		String MD5 = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			MD5 = sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			MD5 = null;
		}
		return MD5;
	}
}
