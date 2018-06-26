package com.skilldistillery.midterm.controllers;

import java.util.Date;
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
import com.skilldistillery.midterm.data.MessageDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Match;
import com.skilldistillery.midterm.entities.Message;
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
	@Autowired
	private MessageDAO messdao;

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
		session.setAttribute("matchfound", match);
		mv.setViewName("redirect:findeventrefresh.do");
		return mv;
	}

	@RequestMapping(path = "findeventrefresh.do", method = RequestMethod.GET)
	public ModelAndView findEventRefresh(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("match", (Match) session.getAttribute("matchfound"));
		mv.setViewName("WEB-INF/viewMatch.jsp");
		return mv;
	}

	@RequestMapping(path = "matchhistory.do", method = RequestMethod.GET)
	public ModelAndView findMatchHistory(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Profile temp = (Profile) session.getAttribute("profile");
		mv.setViewName("WEB-INF/viewMatchHistory.jsp");
		System.out.println(mdao.getListMatchesByProfileId(temp.getId()));
		mv.addObject("matches", mdao.getListMatchesByProfileId(temp.getId()));
		return mv;
	}

	@RequestMapping(path = "message.do", method = RequestMethod.GET)
	public ModelAndView message(@RequestParam("matchId") int matchId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Profile partner = udao.findProfileByProfileId(matchId);
		mv.addObject("match", partner);
		mv.setViewName("WEB-INF/sendMessage.jsp");
		return mv;
	}

	@RequestMapping(path = "sendMessage.do", method = RequestMethod.POST)
	public ModelAndView sendMessage(@RequestParam("matchId") int matchId,
			@RequestParam("messageText") String messageText, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Profile partner = udao.findProfileByProfileId(matchId);
		Profile temp = (Profile) session.getAttribute("profile");
		System.out.println(temp);
		System.out.println(partner);

		Message newMessage = new Message();
		newMessage.setDateSent(new Date());
		newMessage.setMessageText(messageText);
		newMessage.setRecipient(partner);
		newMessage.setSender(temp);
		messdao.createMessage(newMessage);

		List<Message> threadMessages = messdao.viewEntireThread(newMessage.getThreadId());
		mv.addObject("threadMessages", threadMessages);

		mv.setViewName("WEB-INF/conversation.jsp");
		return mv;
	}

	@RequestMapping(path = "replyMessage.do", method = RequestMethod.POST)
	public ModelAndView replyMessage(@RequestParam("matchProfile") int recipientId,
			@RequestParam("messageText") String messageText, @RequestParam("threadId") int threadId,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Profile temp = (Profile) session.getAttribute("profile");

		Message newMessage = new Message();
		newMessage.setDateSent(new Date());
		newMessage.setMessageText(messageText);
		newMessage.setRecipient(udao.findProfileByProfileId(recipientId));
		newMessage.setSender(temp);
		newMessage.setThreadId(threadId);
		messdao.createReply(newMessage);

		List<Message> threadMessages = messdao.viewEntireThread(newMessage.getThreadId());
		mv.addObject("threadMessages", threadMessages);
		System.out.println(threadMessages.get(0).getSender());

		mv.setViewName("WEB-INF/conversation.jsp");
		return mv;
	}

	@RequestMapping(path = "inbox.do", method = RequestMethod.GET)
	public ModelAndView inbox(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Profile temp = (Profile) session.getAttribute("profile");
		List<Message> conversationList = messdao.viewMyConversations(temp.getId());
		mv.addObject("conversationList", conversationList);
		mv.setViewName("WEB-INF/inbox.jsp");
		return mv;
	}

	@RequestMapping(path = "conversation.do", method = RequestMethod.GET)
	public ModelAndView seeConversations(@RequestParam("threadId") int threadId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Message> threadMessages = messdao.viewEntireThread(threadId);
		mv.addObject("threadMessages", threadMessages);
		mv.setViewName("WEB-INF/conversation.jsp");
		return mv;
	}

}
