package com.skilldistillery.midterm.data;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Location;
import com.skilldistillery.midterm.entities.Match;
import com.skilldistillery.midterm.entities.Membership;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.User;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {
	
	 @PersistenceContext
	  private EntityManager em;
	
	 public static void main(String[] args) {
		UserDAOImpl udao = new UserDAOImpl();
		udao.run();
	}

	private void run() {
//		System.out.println(em.find(User.class, 1));
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public void deleteUser(User user) {
		user.setActive(false);
	}

	@Override
	public User updateUser(User user, int userId) {
		User managed = em.find(User.class, userId);
		managed.setAccess(user.getAccess());
		managed.setActive(user.getActive());
		managed.setEmail(user.getEmail());
		managed.setPassword(user.getPassword());
		managed.setUsername(user.getUsername());
		return managed;
	}
	
	
	@Override
	public Profile createProfile(Profile profile, User user) {
		profile.setUser(user);
		em.persist(profile);
		return profile;
	}
	
	@Override
	public Profile updateProfile(Profile profile, int profileId, User user) {
		profile.setUser(user);
		Profile managed = em.find(Profile.class, profileId);
		managed.setAboutMe(profile.getAboutMe());
		managed.setAge(profile.getAge());
		managed.setFirstName(profile.getFirstName());
		managed.setLastName(profile.getLastName());
		managed.setGender(profile.getGender());
		managed.setSexualOrientation(profile.getSexualOrientation());
		managed.setLocation(profile.getLocation());
		managed.setPictureUrl(profile.getPictureUrl());
		managed.setUser(profile.getUser());
		return managed;
	}

	@Override
	public User findUserById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public Profile findProfileById(int userId) {
		Profile p = null;
		String query = "SELECT p from Profile p JOIN User u on u.id = p.user where u.id = :id";
		p = em.createQuery(query, Profile.class).setParameter("id", userId).getSingleResult();
		return p;
	}

	@Override
	public Profile createProfileAndLocation(Profile profile, Location location) {
		profile.setLocation(location);
		em.persist(profile);
		em.flush();
		return profile;
	}
	@Override
	public List<Profile> getAllProfiles() {
		String queryString = "SELECT p FROM Profile p";
		List<Profile> profiles = em.createQuery(queryString, Profile.class).getResultList();
		return profiles;
	}
	
	@Override
	public List<Interest> getInterestsForProfileWithId(int profileId) {
		String query = "SELECT p from Profile p JOIN FETCH p.interests where p.id = :id";
		Profile p = em.createQuery(query, Profile.class)
				.setParameter("id", profileId)
				.getResultList()
				.get(0);
		
		List <Interest> interests = p.getInterests();
		return interests;
	}
	
	
}
