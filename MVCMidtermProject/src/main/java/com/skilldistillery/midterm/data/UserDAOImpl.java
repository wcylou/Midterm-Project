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

import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Match;
import com.skilldistillery.midterm.entities.Membership;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.User;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {
	
	 @PersistenceContext
	  private EntityManager em;
	
	 private  Map<Integer, User> users = new LinkedHashMap<>();
	 
	 public UserDAOImpl () 
	 { users.put(1, new User(1, "bobdobbs", "password", false, em.find(Membership.class, 1), true, "bobdobbs@gmail.com"));
	    users.put(2, new User(2, "ronnytoms", "password", false, em.find(Membership.class, 1), true, "ronnytoms@gmail.com"));
	  }
	 
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
	public Profile createProfile(Profile profile) {
		em.persist(profile);
		return profile;
	}
	
	@Override
	public Profile updateProfile(Profile profile, int profileId) {
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
	public Profile findProfileById(int profileId) {
		return em.find(Profile.class, profileId);
	}
	
	public Match findEventMatch(Profile profile, Profile partner) {
		List<Interest> common = new ArrayList<>();
		List<Interest> profileInterests = profile.getInterests();
		List<Interest> partnerInterests = partner.getInterests();
		
		for (Interest interest : profileInterests) {
			if(partnerInterests.contains(interest)) {
				common.add(interest);
			}
		}
		
		if(common.size() == 0) {
			common.add(em.find(Interest.class, 1));
		}
		return null;
	}
	
	  
	  @Override
	  public User getUserByUserNameAndPassword(String username, String password) {
	    User u = null;
	    Set<Integer> keys = users.keySet();
	    for (Integer key : keys) {
	      User user = users.get(key);
	      if(user.getUsername().equals(username) && user.getPassword().equals(password)) {
	        u = user;
	        break;
	      }
	    }
	    return u;
	  }
}
