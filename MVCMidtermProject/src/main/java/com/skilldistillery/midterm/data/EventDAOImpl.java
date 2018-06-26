package com.skilldistillery.midterm.data;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.EventDTO;
import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Location;

@Transactional
@Component
public class EventDAOImpl implements EventDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	private UserDAO udao;

	@Override
	public Event create(Event event) {
		em.persist(event);
		em.flush();

		return event;
	}

	@Override
	public Event update(int id, Event updatedEvent) {
		Event managed = em.find(Event.class, id);
		managed.setName(updatedEvent.getName());
		managed.setDescription(updatedEvent.getDescription());
		managed.setDate(updatedEvent.getDate());
		managed.setInterests(updatedEvent.getInterests());
		managed.setLocation(updatedEvent.getLocation());

		return managed;
	}

	@Override
	public void delete(int id) {
		Event managed = em.find(Event.class, id);
		em.remove(managed);

	}

	@Override
	public Event createEventAndLocation(EventDTO dto) {
		Event e = new Event();
		Location l = new Location();
		e.setName(dto.getName());
		e.setDescription(dto.getDescription());
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date inputDate = null;
		try {
			inputDate = format.parse(dto.getDate());
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		e.setDate(inputDate);
		for (String interest : dto.getInterests()) {
			Interest i = udao.getInterestObject(interest);
			e.addInterest(i);
		}
		l.setAddress(dto.getAddress());
		l.setAddress2(dto.getAddress2());
		l.setCity(dto.getCity());
		l.setState(dto.getState());
		l.setZipCode(dto.getZipCode());
		
		e.setLocation(l);
		em.persist(e);
		em.flush();

		return e;
	}
	@Override
	public Event updateEventAndLocation(EventDTO dto, int id) {
		Event managed = em.find(Event.class, id);
		Location l = managed.getLocation();
		managed.setName(dto.getName());
		managed.setDescription(dto.getDescription());
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date inputDate = null;
		try {
			inputDate = format.parse(dto.getDate());
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		managed.setDate(inputDate);			
		
		for (String interest : dto.getInterests()) {
			Interest i = udao.getInterestObject(interest);
			managed.addInterest(i);
		}
		l.setAddress(dto.getAddress());
		l.setAddress2(dto.getAddress2());
		l.setCity(dto.getCity());
		l.setState(dto.getState());
		l.setZipCode(dto.getZipCode());
		
		managed.setLocation(l);

		return managed;
		
	}
	
	@Override
	public EventDTO getEventDTOFromEventAndLocation(Event event, Location location) {
		EventDTO dto = new EventDTO();
		dto.setName(event.getName());
		dto.setDescription(event.getDescription());
	
		int arraySize = event.getInterests().size();
		List<String> listStrings = new ArrayList<>();
		for (Interest interest : event.getInterests()) {
			listStrings.add(interest.getName());
		}
		String[] interestNames = listStrings.toArray(new String[arraySize]);
		dto.setInterests(interestNames);
		dto.setAddress(location.getAddress());
		dto.setAddress2(location.getAddress2());
		dto.setCity(location.getCity());
		dto.setState(location.getState());
		dto.setZipCode(location.getZipCode());
		
		return dto;
	}
	
	
	@Override
	public List<Event> index() {
		String queryString = "SELECT e FROM Event e";
		List<Event> events = em.createQuery(queryString, Event.class).getResultList();
		return events;
	}

	@Override
	public Event getEventById(int id) {
		String query = "SELECT e FROM Event e JOIN FETCH e.interests WHERE e.id = :id";
		Event event = em.createQuery(query, Event.class).setParameter("id", id).getResultList().get(0);
		return event;
	}

	@Override
	public Event find(int id) {
		return em.find(Event.class, id);
	}

}
