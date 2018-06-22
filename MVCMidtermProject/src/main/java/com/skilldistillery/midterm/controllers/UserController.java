package com.skilldistillery.midterm.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.midterm.data.EventDAO;
import com.skilldistillery.midterm.data.MatchDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private EventDAO edao;
	@Autowired
	private MatchDAO mdao;
	@Autowired
	private UserDAO udao;

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}
	
	@RequestMapping(path = "profileDetails.do", method = RequestMethod.GET)
	public String getProfile(@RequestParam("profileId") int profileId, RedirectAttributes redir, HttpSession session) {
		Profile profile = udao.findProfileById(profileId);
		redir.addFlashAttribute("profile", profile);
		session.setAttribute("profile", profile);
		return "redirect:profilecreated.do";
	}
	
	@RequestMapping(path = "addProfile2.do", method = RequestMethod.GET)
	public ModelAndView addProfile() {
		ModelAndView mv = new ModelAndView();
		List <Interest> interests = udao.getAllInterests();
		mv.addObject("interests", interests);
		mv.addObject("profile", new Profile());
		mv.setViewName("WEB-INF/addProfile.jsp");
		return mv;
	}
	
	@RequestMapping(path = "profilecreated.do", method = RequestMethod.GET)
	public ModelAndView created() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/profileDetails.jsp");
		return mv;
	}
	
	@RequestMapping(path = "addProfileDetails.do", method = RequestMethod.POST)
	public String addProfileDetails(Profile profile, HttpSession session, RedirectAttributes redir) {
		User current = getCurrentUserFromSession(session);
		System.out.println(current);
		Profile profileAdded = udao.createProfile(profile, current);
		System.out.println(profileAdded);
		redir.addFlashAttribute("profile", profileAdded);
		session.setAttribute("profile", profileAdded);
		return "redirect:profilecreated.do";
	}
	
	@RequestMapping(path = "updateProfile.do", method = RequestMethod.GET)
	public ModelAndView updateProfile(HttpSession session) {
		Profile current = getCurrentProfileFromSession(session);
		ModelAndView mv = new ModelAndView();
		Profile profile = udao.findProfileById(current.getId());
		mv.addObject("profileUpdate", profile);
		mv.setViewName("WEB-INF/updateProfile.jsp"); 
		session.setAttribute("profile", profile);
		return mv;
	}

	@RequestMapping(path = "updateProfileDetails.do", method = RequestMethod.POST)
	public ModelAndView updateProfileDetails(Profile profile, HttpSession session) {
		User current = getCurrentUserFromSession(session);
		System.out.println(current);
		Profile p = getCurrentProfileFromSession(session);
		System.out.println(p);
		ModelAndView mv = new ModelAndView();
		Profile profileUpdated = udao.updateProfile(profile, p.getId(), current);
		System.out.println(profile);
		mv.addObject("profileUpdated", profileUpdated);
		mv.setViewName("WEB-INF/updatedProfileDetails.jsp");
		return mv;
	}
	
	private User getCurrentUserFromSession(HttpSession session) {
		User current = (User) session.getAttribute("user");
		return current;
	}
	
	private Profile getCurrentProfileFromSession(HttpSession session) {
		Profile current = (Profile) session.getAttribute("profile");
		return current;
	}
	
	@RequestMapping(path = "updateInterests.do", method = RequestMethod.GET)
	public ModelAndView updateInterests(HttpSession session) {
		Profile current = getCurrentProfileFromSession(session);
		ModelAndView mv = new ModelAndView();
		Profile profile = udao.findProfileById(current.getId());
		mv.addObject("profileUpdate", profile);
		mv.setViewName("WEB-INF/updateProfile.jsp"); 
		session.setAttribute("profile", profile);
		return mv;
	}


}
