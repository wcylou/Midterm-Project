package com.skilldistillery.midterm.data;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.Location;

public interface EventDAO {
	public Event create(Event event);
	public Event update(int id, Event updatedEvent);
	public void delete(int id);
	public Event createEventAndLocation(Event event, Location location);
}
