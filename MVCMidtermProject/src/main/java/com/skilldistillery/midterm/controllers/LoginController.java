package com.skilldistillery.midterm.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.EventDAO;
import com.skilldistillery.midterm.data.LoginDAO;
import com.skilldistillery.midterm.data.MatchDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Membership;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private EventDAO edao;
	@Autowired
	private MatchDAO mdao;
	@Autowired
	private UserDAO udao;
	@Autowired
	private LoginDAO ldao;
	
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String displayLoginPage(Model model) {
		model.addAttribute("user", new User());
		return "WEB-INF/login.jsp";
	}

	@RequestMapping(path ="login.do", method = RequestMethod.POST) 
	public String loginAttempt(@Valid User user, HttpSession http, Errors errors) {
		User u = ldao.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		errors.rejectValue("username", "error.user", "Not a valid login.");
		if (u != null) {
			http.setAttribute("user", u);
			http.setAttribute("loggedIn", true);
			return "redirect:account.do";
		}
		http.setAttribute("loggedIn", false);
		return "WEB-INF/login.jsp";
	}
	
	@RequestMapping(path ="logout.do") 
	public String logoutAttempt(HttpSession http) {
		http.removeAttribute("user");
		http.setAttribute("loggedIn", false);
		return "redirect:login.do";
	}
	
	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", new User());
		mv.setViewName("WEB-INF/register.jsp");
		return mv;
	}
	
	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
	public ModelAndView addProfileDetails(User user) {
		ModelAndView mv = new ModelAndView();
		User userNew = ldao.createUser(user);
		mv.addObject("user", userNew);
		mv.setViewName("WEB-INF/newUserDetails.jsp");
		return mv;
	}
	

}
