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
		builder.append("Interest [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append("]");
		return builder.toString();
	}
	
	
}
