package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Location;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.User;

public interface UserDAO {
	public User createUser(User user);
	public void deleteUser(User user);
	public User updateUser(User user, int userId);
	public User findUserById(int userId);
	public Profile findProfileById(int profileId);
	public Profile createProfile(Profile profile, User user);
	public Profile updateProfile(Profile profile, int profileId, User user);
	public Profile createProfileAndLocation(Profile profile, Location location);
	public List<Profile> getAllProfiles();
}
