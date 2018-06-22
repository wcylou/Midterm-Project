package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Location;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.ProfileDTO;
import com.skilldistillery.midterm.entities.User;

public interface UserDAO {
	public User createUser(User user);
	public void deleteUser(User user);
	public User updateUser(User user, int userId);
	public User findUserById(int userId);
	public Profile findProfileById(int userId);
	public Profile updateProfile(Profile profile, int profileId, User user);
	public Profile createProfileAndLocation(Profile profile, Location location);
	public List<Profile> getAllProfiles();
	public List<Interest> getInterestsForProfileWithId(int profileId);
	public List<Interest> getAllInterests();
	public Interest getInterestObject(String name);
	public Profile createProfile(ProfileDTO pdto, User user);
	public ProfileDTO getProfileDTOfromProfile(Profile profile, User user);
}
