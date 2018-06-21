package com.skilldistillery.midterm.controllers;

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
	public String getPlayer(@RequestParam("profileId") int profileId, RedirectAttributes redir, HttpSession session) {
		Profile profile = udao.findProfileById(profileId);
		redir.addFlashAttribute("profile", profile);
		session.setAttribute("profile", profile);
		return "redirect:profilecreated.do";
	}

	@RequestMapping(path = "profilecreated.do", method = RequestMethod.GET)
	public ModelAndView created() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/profileDetaills.jsp");
		return mv;
	}
	
	@RequestMapping(path = "addprofile.do", method = RequestMethod.GET)
	public ModelAndView addProfile() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("profile", new Profile());
		mv.setViewName("WEB-INF/addprofile.jsp");
		return mv;
	}
	
	@RequestMapping(path = "addProfileDetails.do", method = RequestMethod.POST)
	public ModelAndView addProfileDetails(Profile profile, HttpSession session) {
		User current = getCurrentUserFromSession(session);
		ModelAndView mv = new ModelAndView();
		Profile profileAdded = udao.createProfile(profile, current);
		mv.addObject("profile", profileAdded);
		mv.setViewName("WEB-INF/profileDetails.jsp");
		return mv;
	}
	
	@RequestMapping(path = "updateProfile.do", method = RequestMethod.GET)
	public ModelAndView updateProfile(@RequestParam(name = "profileId") int profileId) {
		ModelAndView mv = new ModelAndView();
		Profile profile = udao.findProfileById(profileId);
		mv.addObject("profileUpdate", profile);
		mv.setViewName("WEB-INF/updateProfile.jsp"); 
		return mv;
	}

	@RequestMapping(path = "updateProfileDetails.do", method = RequestMethod.POST)
	public ModelAndView updateProfileDetails(@RequestParam(name = "profileId") int profileId, Profile profile, HttpSession session) {
		User current = getCurrentUserFromSession(session);
		ModelAndView mv = new ModelAndView();
		Profile profileUpdated = udao.updateProfile(profile, profileId, current);
		mv.addObject("profileUpdated", profileUpdated);
		mv.setViewName("WEB-INF/updatedProfileDetails.jsp");
		return mv;
	}
	
	private User getCurrentUserFromSession(HttpSession session) {
		User current = (User) session.getAttribute("user");
		return current;
	}

}
