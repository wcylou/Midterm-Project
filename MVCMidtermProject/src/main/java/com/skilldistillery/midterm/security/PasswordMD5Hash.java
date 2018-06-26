package com.skilldistillery.midterm.security;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Component;

@Component
public class PasswordMD5Hash implements PasswordHash {
	@Override
	public String hashPassword(String password) {
		String phash = "";
		try {
			byte[] passwordHash = password.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] passwordDigest = md.digest(passwordHash);
			phash = DatatypeConverter.printHexBinary(passwordDigest).toLowerCase();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return phash;
	}

}
