package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Membership {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private double price;
	@OneToMany(mappedBy = "membership")
	private List<User> users;
	
	//gets and sets
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
	public int getId() {
		return id;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	public void addUser(User user) {
		if(users == null) users = new ArrayList<>();
		
		if(!users.contains(user)) {
			users.add(user);
			if(user.getMembership() != null) {
				user.getMembership().getUsers().remove(user);
			}
			user.setMembership(this);
		}
	}
	
	public void removeUser(User user) {
		user.setMembership(null);
		if (users != null) {
			users.remove(user);
		}
	}
	
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Membership: ");
		builder.append(name);
		builder.append(", price: ");
		builder.append(price);
		return builder.toString();
	}
	
}
