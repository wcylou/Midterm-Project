package com.skilldistillery.midterm.controllers;

import java.util.List;

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
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.Location;
import com.skilldistillery.midterm.entities.Profile;

@Controller
public class AdminController {

	@Autowired
	private EventDAO edao;
	@Autowired
	private MatchDAO mdao;
	@Autowired
	private UserDAO udao;

	
	//events mapping
	@RequestMapping(path = "getEvents.do", method = RequestMethod.GET)
	public ModelAndView eventIndex() {
		ModelAndView mv = new ModelAndView();
		List<Event> eventList = edao.index();
		mv.addObject("eventList", eventList);
		mv.setViewName("WEB-INF/admin-events.jsp");
		return mv;
	}
	
	@RequestMapping(path = "getEvent.do", method=RequestMethod.GET)
	public ModelAndView getFilm(@RequestParam("id") int eventId) {
		ModelAndView mv = new ModelAndView();
		Event e = edao.find(eventId);
		mv.addObject("event", e);
		mv.setViewName("WEB-INF/eventDetails.jsp");
		return mv;
	}

	@RequestMapping(path = "addEvent.do", method = RequestMethod.GET)
	public ModelAndView addEventGet(Event event) {
		ModelAndView mv = new ModelAndView();
		Event e = new Event();
		Location l = new Location();
		mv.addObject("event", e);
		mv.addObject("location", l);
		mv.setViewName("WEB-INF/addEvent.jsp");
		return mv;
	}

	@RequestMapping(path = "addEvent.do", method = RequestMethod.POST)
	public ModelAndView addEventPost(Event event, Location location, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		edao.createEventAndLocation(event, location);
		redir.addFlashAttribute("event", event);
		mv.setViewName("redirect:eventCreated.do");

		return mv;
	}

	@RequestMapping(path = "eventCreated.do", method = RequestMethod.GET)
	public ModelAndView eventCreated() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/eventDetails.jsp");
		return mv;
	}
	
	//profile mapping
	@RequestMapping(path = "getProfiles.do", method = RequestMethod.GET)
	public ModelAndView profileIndex() {
		ModelAndView mv = new ModelAndView();
		List<Profile> profileList = udao.getAllProfiles();
		mv.addObject("profileList", profileList);
		mv.setViewName("WEB-INF/admin-profiles.jsp");
		return mv;
	}
	
	@RequestMapping(path = "getProfile.do", method=RequestMethod.GET)
	public ModelAndView getProfile(@RequestParam("id") int profileId) {
		ModelAndView mv = new ModelAndView();
		Profile p = udao.findProfileById(profileId);
		mv.addObject("profile", p);
		mv.setViewName("WEB-INF/profileDetails.jsp");
		return mv;
	}
	
	@RequestMapping(path = "addProfile.do", method = RequestMethod.GET)
	public ModelAndView addProfileGet(Profile profile) {
		ModelAndView mv = new ModelAndView();
		Profile p = new Profile();
		Location l = new Location();
		mv.addObject("profile", p);
		mv.addObject("location", l);
		mv.setViewName("WEB-INF/addProfile.jsp");
		return mv;
	}
	
	@RequestMapping(path = "addProfile.do", method = RequestMethod.POST)
	public ModelAndView addProfilePost(Profile profile, Location location, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		udao.createProfileAndLocation(profile, location);
		redir.addFlashAttribute("profile", profile);
		mv.setViewName("redirect:profileCreated.do");
		
		return mv;
	}
	
	@RequestMapping(path = "profileCreated.do", method = RequestMethod.GET)
	public ModelAndView profileCreated() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/profileDetails.jsp");
		return mv;
	}

}
