package com.skilldistillery.midterm.entities;

public class MembershipDTO {

	private int userId;
	private String username;
	private String password;
	private boolean access;
	private boolean active;
	private String email;
	private int membershipId;
	private String name;
	private double price;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

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

	public boolean isAccess() {
		return access;
	}

	public void setAccess(boolean access) {
		this.access = access;
	}

	public boolean isActive() {
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

	public int getMembershipId() {
		return membershipId;
	}

	public void setMembershipId(int membershipId) {
		this.membershipId = membershipId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MembershipDTO [userId=");
		builder.append(userId);
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
		builder.append(", membershipId=");
		builder.append(membershipId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", price=");
		builder.append(price);
		builder.append("]");
		return builder.toString();
	}

}
