package com.skilldistillery.midterm.data;

import com.skilldistillery.midterm.entities.Membership;
import com.skilldistillery.midterm.entities.User;

public interface LoginDAO {

	public User getUserByUserNameAndPassword(String username, String password);
	public User createUser(User user);
	public User updateUser(User user, int userId);

}
