package com.skilldistillery.midterm.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private boolean access;
	@ManyToOne
	@JoinColumn(name = "membership_id")
	private Membership membership;
	private boolean active;
	private String email;

	public User() {
	}

	public User(int id, String username, String password, boolean access, Membership membership, boolean active,
			String email) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.access = access;
		this.membership = membership;
		this.active = active;
		this.email = email;
	}

	// gets and sets
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getAccess() {
		return access;
	}

	public void setAccess(boolean access) {
		this.access = access;
	}

	public Membership getMembership() {
		return membership;
	}

	public void setMembership(Membership membership) {
		this.membership = membership;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", username=");
		builder.append(username);
		builder.append(", password=");
		builder.append(password);
		builder.append(", access=");
		builder.append(access);
		builder.append(", active=");
		builder.append(active);
		builder.append(", email=");
		builder.append(email);
		builder.append("]");
		return builder.toString();
	}

}
