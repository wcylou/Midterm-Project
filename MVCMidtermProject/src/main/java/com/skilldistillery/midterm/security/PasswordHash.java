package com.skilldistillery.midterm.security;

public interface PasswordHash {
	String hashPassword(String password);
}