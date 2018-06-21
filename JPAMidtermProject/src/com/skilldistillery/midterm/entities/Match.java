package com.skilldistillery.midterm.entities;

import javax.persistence.*;

@Entity
public class Match {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "profile_id")
	private int profileId;
	@Column(name = "partner_id")
	private int partnerId;
	@Column(name = "event_id")
	private int eventId;

	// gets and sets
	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public int getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(int partnerId) {
		this.partnerId = partnerId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Match [id=");
		builder.append(id);
		builder.append(", profileId=");
		builder.append(profileId);
		builder.append(", partnerId=");
		builder.append(partnerId);
		builder.append(", eventId=");
		builder.append(eventId);
		builder.append("]");
		return builder.toString();
	}

}
