package com.skilldistillery.midterm.entities;

import javax.persistence.*;

@Entity
@Table(name = "user_match")
public class Match {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "profile_id")
	private Profile profile;
	@ManyToOne
	@JoinColumn(name = "partner_id")
	private Profile partner;
	@ManyToOne
	@JoinColumn(name = "event_id")
	private Event event;

	// gets and sets
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
		return "Match [id=" + id + ", profile=" + profile + ", partner=" + partner + ", event=" + event + "]";
	}

}