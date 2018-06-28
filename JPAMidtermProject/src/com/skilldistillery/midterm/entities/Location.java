package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Location {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String state;
	private String city;
	private String address;
	private String address2;
	@Column(name = "zip_code")
	private String zipCode;
	@OneToMany(mappedBy = "location")
	private List<Event> events;

	// gets and sets
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public int getId() {
		return id;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public void addEvent(Event event) {
		if (events == null)
			events = new ArrayList<>();

		if (!events.contains(event)) {
			events.add(event);
			if (event.getLocation() != null) {
				event.getLocation().getEvents().remove(event);
			}
			event.setLocation(this);
		}
	}

	public void removeEvent(Event event) {
		event.setLocation(null);
		if (events != null) {
			events.remove(event);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(address);
		builder.append(", ");
		if (address2 != null) {
			builder.append(address2);
			builder.append(", ");
		}
		builder.append(city);
		builder.append(", ");
		builder.append(state);
		builder.append(" ");
		builder.append(zipCode);
		return builder.toString();
	}

}
