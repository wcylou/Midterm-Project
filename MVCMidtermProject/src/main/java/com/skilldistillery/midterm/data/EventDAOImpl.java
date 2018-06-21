package com.skilldistillery.midterm.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.Location;

@Transactional
@Component
public class EventDAOImpl implements EventDAO {

	 @PersistenceContext
	  private EntityManager em;

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
	public Event createEventAndLocation(Event event, Location location) {
		event.setLocation(location);
		em.persist(event);
		em.flush();
		
		return event;
	}
}
