package com.skilldistillery.midterm.controllers;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.skilldistillery.midterm.entities.ProfileDTO;
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
		mv.addObject("profiledto", new ProfileDTO());
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
	public String addProfileDetails(ProfileDTO profiledto, HttpSession session, RedirectAttributes redir) {
		User current = getCurrentUserFromSession(session);
		Profile profileAdded = udao.createProfile(profiledto, current);
		redir.addFlashAttribute("profileid", profileAdded.getId());
		redir.addFlashAttribute("profile", profiledto);
		session.setAttribute("profile", profileAdded);
		return "redirect:profilecreated.do";
	}
	
	@RequestMapping(path = "updateProfile.do", method = RequestMethod.GET)
	public ModelAndView updateProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User currentUser = getCurrentUserFromSession(session);
		Profile profile = udao.findProfileById(currentUser.getId());
		ProfileDTO pdto = udao.getProfileDTOfromProfile(profile, currentUser);
		List interests = Arrays.asList(pdto.getInterests());
		mv.addObject("profileUpdate", pdto);
		mv.addObject("interests", interests);
		mv.addObject("profiledto2", new ProfileDTO());
		mv.setViewName("WEB-INF/updateProfile.jsp"); 
		session.setAttribute("profile", profile);
		return mv;
	}

	@RequestMapping(path = "updateProfileDetails.do", method = RequestMethod.POST)
	public ModelAndView updateProfileDetails(ProfileDTO profiledto, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User currentUser = getCurrentUserFromSession(session);
		Profile current = getCurrentProfileFromSession(session);
		Profile p = udao.getProfilefromProfileDTO(profiledto, currentUser);
		mv.addObject("profileId", current.getId());
		mv.addObject("profileUpdated", profiledto);
		mv.setViewName("WEB-INF/updatedProfileDetails.jsp");
		session.setAttribute("profile", p);
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
