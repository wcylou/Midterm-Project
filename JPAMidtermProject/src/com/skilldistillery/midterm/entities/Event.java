package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class Event {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@ManyToOne(cascade= CascadeType.PERSIST)
	@JoinColumn(name="location_id")
	private Location location;
	@Temporal(TemporalType.DATE)
	private Date date;
	private String description;
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name = "event_interest", joinColumns = @JoinColumn(name = "event_id"), inverseJoinColumns = @JoinColumn(name = "interest_id"))
	private List<Interest> interests;
	
	//gets and sets
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public List<Interest> getInterests() {
		return interests;
	}
	public void setInterests(List<Interest> interests) {
		this.interests = interests;
	}
	
	public void addInterest(Interest interest) {
		if (interests == null)
			interests = new ArrayList<>();
		
		if (!interests.contains(interest)) {
			interests.add(interest);
			interest.addEvent(this);
		}
		
	}
	
	public void removeInterest(Interest interest) {
		if (interests != null && interests.contains(interest)) {
			interests.remove(interest);
			interest.removeEvent(this);
		}
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", date=");
		builder.append(date);
		builder.append(", description=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}
	
	
}
