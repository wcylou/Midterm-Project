package com.skilldistillery.midterm.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Gender;
import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Location;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.ProfileDTO;
import com.skilldistillery.midterm.entities.Sexuality;
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
	public Profile createProfile(ProfileDTO pdto, User user) {
		Profile p = new Profile();
		p.setUser(user);
		p.setFirstName(pdto.getFirstName());
		p.setLastName(pdto.getLastName());
		p.setAge(pdto.getAge());
		p.setGender(Gender.valueOf(pdto.getGender()));
		p.setSexualOrientation(Sexuality.valueOf(pdto.getSexualOrientation()));
		p.setAboutMe(pdto.getAboutMe());
		p.setPictureUrl(pdto.getPictureUrl());
		p.setMinAge(pdto.getMinAge());
		p.setMaxAge(pdto.getMaxAge());
		Location l = new Location();
		l.setState(pdto.getState());
		l.setCity(pdto.getCity());
		l.setAddress(pdto.getAddress());
		l.setAddress2(pdto.getAddress2());
		l.setZipCode(pdto.getZipCode());
		List<Interest> interestsUser = new ArrayList<>();
		for (String interest : pdto.getInterests()) {
			interestsUser.add(getInterestObject(interest));
		}
		p.setLocation(l);
		p.setInterests(interestsUser);
		em.persist(p);
		em.flush();
		return p;
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
		List<Profile> profiles = em.createQuery(query, Profile.class).setParameter("id", userId).getResultList();
		if (profiles.size() > 0) {
			p = profiles.get(0);
		}
		return p;
	}
	
	@Override
	public ProfileDTO getProfileDTOfromProfile(Profile profile, User user) {
		ProfileDTO p = new ProfileDTO();
		p.setFirstName(profile.getFirstName());
		p.setLastName(profile.getLastName());
		p.setAge(profile.getAge());
		p.setGender(profile.getGender().toString());
		p.setSexualOrientation(profile.getSexualOrientation().toString());
		p.setAboutMe(profile.getAboutMe());
		p.setPictureUrl(profile.getPictureUrl());
		p.setMinAge(profile.getMinAge());
		p.setMaxAge(profile.getMaxAge());
		p.setState(profile.getLocation().getState());
		p.setCity(profile.getLocation().getCity());
		p.setAddress(profile.getLocation().getAddress());
		p.setAddress2(profile.getLocation().getAddress2());
		p.setZipCode(profile.getLocation().getZipCode());
		String [] interestsString = new String [profile.getInterests().size()];
		for (int i = 0; i < interestsString.length; i++) {
			interestsString[i] = profile.getInterests().get(i).getName();
		}
		p.setInterests(interestsString);
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
	
	@Override
	public List<Interest> getAllInterests() {
		String query = "SELECT i from Interest i";
		List<Interest> interests = em.createQuery(query, Interest.class)
				.getResultList();
		return interests;
	}
	
	@Override
	public Interest getInterestObject(String name) {
		String query = "SELECT i from Interest i where i.name = :name";
		Interest i = em.createQuery(query, Interest.class)
				.setParameter("name", name)
				.getSingleResult();
		return i;
	}

}
