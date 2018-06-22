package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Location;

public interface EventDAO {
	public Event find(int id);
	public List<Event> index();
	public Event create(Event event);
	public Event update(int id, Event updatedEvent);
	public void delete(int id);
	public Event createEventAndLocation(Event event, Location location);
	public List<Interest> loadInterestsByEvent(int id);
}
