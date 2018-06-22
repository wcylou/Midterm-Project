package com.skilldistillery.midterm.clients;

import com.skilldistillery.midterm.data.EventDAOImpl;
import com.skilldistillery.midterm.data.UserDAOImpl;
import com.skilldistillery.midterm.entities.Event;

public class EventClient {

	public static void main(String[] args) {
		UserDAOImpl udi = new UserDAOImpl();
		EventDAOImpl edi = new EventDAOImpl();
//		Interest i = udi.getInterestObject("Food");
//		System.out.println(i);
//		Profile p = udi.findProfileById(1);
//		System.out.println(p.getFirstName());
		Event e = edi.getEventById(1);
		System.out.println(e.getName());

	}

}
