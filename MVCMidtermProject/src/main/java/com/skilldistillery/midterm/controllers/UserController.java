package com.skilldistillery.midterm.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public ModelAndView showRegister(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User current = getCurrentUserFromSession(session);
		mv.addObject("profile", new Profile());
		mv.addObject("userCurrent", current);
		mv.setViewName("WEB-INF/register.jsp");
		return mv;
	}
	
	@RequestMapping(path = "addProfileDetails.do", method = RequestMethod.POST)
	public ModelAndView addPlayerDetails(Profile profile) {
		ModelAndView mv = new ModelAndView();
		Profile profileAdded = udao.createProfile(profile);
		mv.addObject("profile", profileAdded);
		mv.setViewName("WEB-INF/profileDetails.jsp");
		return mv;
	}
	
	@RequestMapping(path = "updateProfile.do", method = RequestMethod.GET)
	public ModelAndView updateProfile(@RequestParam(name = "profileId") int profileId) {
		ModelAndView mv = new ModelAndView();
		Profile profile = udao.findProfileById(profileId);
		mv.addObject("profileUpdated", profile);
		mv.setViewName("WEB-INF/updateProfile.jsp"); // redirect to new mapping
		return mv;
	}

	@RequestMapping(path = "updateProfileDetails.do", method = RequestMethod.POST)
	public ModelAndView updateFilmDetails(@RequestParam(name = "profileId") int profileId, Profile profile) {
		ModelAndView mv = new ModelAndView();
		Profile profileUpdated = udao.updateProfile(profile, profileId);
		mv.addObject("profileUpdated", profileUpdated);
		mv.setViewName("WEB-INF/updatedProfileDetails.jsp");
		return mv;
	}
	
	private User getCurrentUserFromSession(HttpSession session) {
		User current = (User) session.getAttribute("user");
		return current;
	}

	@RequestMapping(path = "navPlayer.do", params = "next")
	public ModelAndView navPlayerNext(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Player next = playerDAO.getNextPlayer(current);
		session.setAttribute("player", next);
		mv.addObject(next);
		mv.setViewName("WEB-INF/playerdetails.jsp");
		return mv;
	}

}
