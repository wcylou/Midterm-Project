package com.skilldistillery.midterm.entities;

import javax.persistence.*;


@Entity
public class Match {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name="profile_id")
	private Profile profile;
	@Column(name="partner_id")
	private Profile partner;
	@ManyToOne
	@JoinColumn(name="event_id")
	private Event event;
	
	//gets and sets
	
	
	public int getId() {
		return id;
	}
	public Profile getProfile() {
		return profile;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	public Profile getPartner() {
		return partner;
	}
	public void setPartner(Profile partner) {
		this.partner = partner;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Match [id=");
		builder.append(id);
		builder.append("]");
		return builder.toString();
	}
	
	
}
