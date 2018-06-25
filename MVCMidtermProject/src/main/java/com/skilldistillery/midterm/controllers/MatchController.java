package com.skilldistillery.midterm.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.EventDAO;
import com.skilldistillery.midterm.data.LoginDAO;
import com.skilldistillery.midterm.data.MatchDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Match;
import com.skilldistillery.midterm.entities.Profile;

@Controller
public class MatchController {
	@Autowired
	private EventDAO edao;
	@Autowired
	private MatchDAO mdao;
	@Autowired
	private UserDAO udao;
	@Autowired
	private LoginDAO ldao;
	
	@RequestMapping(path = "findmatches.do", method = RequestMethod.GET)
	public ModelAndView findMatches(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Profile temp = (Profile) session.getAttribute("profile");
		System.out.println(temp);
		List<Profile> matches = mdao.findPotentialMatches(temp);
		mv.addObject("matches", matches);
		for (Profile profile : matches) {
			System.out.println(profile.getInterests());
		}
		mv.setViewName("WEB-INF/viewMatches.jsp");
		System.out.println(matches);
		return mv;
	}
	@RequestMapping(path = "findevent.do", method = RequestMethod.GET)
	public ModelAndView findEvent(HttpSession session, @RequestParam("matchId") int matchId) {
		ModelAndView mv = new ModelAndView();
		Profile temp = (Profile) session.getAttribute("profile");
		Profile partner = udao.findProfileByProfileId(matchId);
		Match match = mdao.findEventMatch(temp, partner);
		mv.addObject("match", match);
		mv.setViewName("WEB-INF/viewMatch.jsp");
		return mv;
	}
	@RequestMapping(path = "matchhistory.do", method = RequestMethod.GET)
	public ModelAndView findMatchHistory(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Profile temp = (Profile) session.getAttribute("profile");
		Profile tempWithMatches = mdao.getMatchesById(temp.getId());
		boolean emptyMatches = tempWithMatches.getMatches().isEmpty();
		
		if (!emptyMatches) {
			List<Match> matches = tempWithMatches.getMatches();
			mv.setViewName("WEB-INF/viewMatchHistory.jsp");
			mv.addObject("matches", matches);
		}
		else {
			mv.setViewName("WEB-INF/noMatchHistory.jsp");
		}
		return mv;
	}
	
}
