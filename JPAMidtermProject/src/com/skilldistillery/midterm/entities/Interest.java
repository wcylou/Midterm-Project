package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity
public class Interest {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@ManyToMany(mappedBy = "interests")
	private List<Profile> profiles;
	@ManyToMany(mappedBy = "interests")
	private List<Event> events;
	
	//gets and sets
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	
	
	public List<Profile> getProfiles() {
		return profiles;
	}
	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	public void addProfile(Profile profile) {
		if (profiles == null)
			profiles = new ArrayList<>();

		if (!profiles.contains(profile)) {
			profiles.add(profile);
			profile.addInterest(this);
		}

	}

	public void removeProfile(Profile profile) {
		if (profiles != null && profiles.contains(profile)) {
			profiles.remove(profile);
			profile.removeInterest(this);
		}
	}
	public void addEvent(Event event) {
		if (events == null)
			events = new ArrayList<>();
		
		if (!events.contains(event)) {
			events.add(event);
			event.addInterest(this);
		}
		
	}
	
	public void removeEvent(Event event) {
		if (events != null && events.contains(event)) {
			events.remove(event);
			event.removeInterest(this);
		}
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(name);
		return builder.toString();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((events == null) ? 0 : events.hashCode());
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((profiles == null) ? 0 : profiles.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Interest other = (Interest) obj;
		if(other.getName().equals(this.getName())) {
			return true;
		}
		return false;
	}
	
	
}
