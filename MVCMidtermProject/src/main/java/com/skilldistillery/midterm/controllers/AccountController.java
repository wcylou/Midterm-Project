package com.skilldistillery.midterm.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
	
	@RequestMapping(path = "account.do", method = RequestMethod.GET)
	public String userLoggedIn(HttpSession http) {
		if (http.getAttribute("user") != null) {
			return "WEB-INF/account.jsp";
		}
		return "redirect:login.do";
	}


}
