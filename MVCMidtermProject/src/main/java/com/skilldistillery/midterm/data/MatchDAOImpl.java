package com.skilldistillery.midterm.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Match;
import com.skilldistillery.midterm.entities.Profile;

@Transactional
@Component
public class MatchDAOImpl implements MatchDAO {

	 @PersistenceContext
	  private EntityManager em;
	 
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
		
		public List<Profile> findPotentialMatches(Profile profile) {
			List<Interest> profileInterests = profile.getInterests();
			List<List<Interest>> common = new ArrayList<>();
			
			String query = "SELECT p FROM Profile p WHERE p.id != :id";
			List<Profile> partners = em.createQuery(query, Profile.class).setParameter("id", profile.getId()).getResultList();
			
			for (int i = 0; i < partners.size(); i++) {
				common.add(new ArrayList<>());
				for (int j = 0; j < partners.get(i).getInterests().size(); j++) {
					if(profileInterests.contains(interest)) {
						
					}
				}
			}
		}
}
