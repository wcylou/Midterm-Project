package com.skilldistillery.midterm.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
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
	public static void main(String[] args) {
		MatchDAOImpl dao = new MatchDAOImpl();
		dao.test();
	}

	private void test() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Midterm");
		EntityManager em = emf.createEntityManager();
		Profile profile = em.find(Profile.class, 1);
		System.out.println(profile.getFirstName());
		System.out.println(findPotentialMatches(profile));
	}

	public Match findEventMatch(Profile profile, Profile partner) {
		List<Interest> common = new ArrayList<>();
		List<Interest> profileInterests = profile.getInterests();
		List<Interest> partnerInterests = partner.getInterests();

		for (Interest interest : profileInterests) {
			if (partnerInterests.contains(interest)) {
				common.add(interest);
			}
		}

		if (common.size() == 0) {
			common.add(em.find(Interest.class, 1));
		}
		return null;
	}

	public List<Profile> findPotentialMatches(Profile profile) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Midterm");
		EntityManager em = emf.createEntityManager();
		List<Interest> profileInterests = profile.getInterests();
		List<List<Interest>> common = new ArrayList<>();

		String query = "SELECT p FROM Profile p WHERE p.id != :id AND p.age > :min AND p.age < :max";
		List<Profile> partners = em.createQuery(query, Profile.class).setParameter("id", profile.getId())
				.setParameter("min", profile.getMinAge()).setParameter("max", profile.getMaxAge()).getResultList();
		if (partners.size() != 0) {
			for (int i = 0; i < partners.size(); i++) {
				common.add(new ArrayList<>());
				List<Interest> partnerInterests = partners.get(i).getInterests();
				for (int j = 0; j < partnerInterests.size(); j++) {
					if (profileInterests.contains(partnerInterests.get(j))) {
						common.get(i).add(partnerInterests.get((j)));
					}
				}
			}

			List<Profile> result = new ArrayList<>();
			int partnersSize = partners.size();
			for (int i = 0; i < 5 && i < partnersSize; i++) {
				int max = common.get(0).size();
				int place = 0;
				for (int j = 0; j < common.size(); j++) {
					if (common.get(j).size() > max) {
						max = common.get(j).size();
						place = j;
					}
				}
				result.add(partners.get(place));
				common.remove(place);
				partners.remove(place);
			}
			return result;
		}
		return new ArrayList<>();
	}

}
