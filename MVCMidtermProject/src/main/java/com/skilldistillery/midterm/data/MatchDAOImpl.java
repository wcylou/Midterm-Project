package com.skilldistillery.midterm.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.Gender;
import com.skilldistillery.midterm.entities.Interest;
import com.skilldistillery.midterm.entities.Match;
import com.skilldistillery.midterm.entities.Profile;
import com.skilldistillery.midterm.entities.Sexuality;

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
		Profile profile = em.find(Profile.class, 20);
		Profile partner = em.find(Profile.class, 2);
		System.out.println(profile.getFirstName());
		List<Profile> matches = findPotentialMatches(profile);
		
		for (Profile profile2 : matches) {
			System.out.println(profile2);
		}
	}

	public Match findEventMatch(Profile profile, Profile partner) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Midterm");
		EntityManager em = emf.createEntityManager();
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

		for (int i = 0; i < common.size(); i++) {

		}
		Match match = new Match();
		match.setProfile(profile);
		match.setPartner(partner);

		String query = "Select e FROM Event e";
		List<Event> events = em.createQuery(query, Event.class).getResultList();
		List<List<Interest>> commonEvent = new ArrayList<>();
		for (Event event : events) {
			List<Interest> temp = event.getInterests();
			temp.retainAll(common);
			commonEvent.add(temp);
		}

		List<Profile> result = new ArrayList<>();
		int max = commonEvent.get(0).size();
		int place = 0;
		for (int j = 1; j < commonEvent.size(); j++) {
			if (commonEvent.get(j).size() > max) {
				max = commonEvent.get(j).size();
				place = j;
			} else if (commonEvent.get(j).size() == max) {
				if(Math.random() > 0.5) {
					max = commonEvent.get(j).size();
					place = j;				
				}
			}
		}

		match.setEvent(events.get(place));
		return match;
	}

	public List<Profile> findPotentialMatches(Profile profile) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Midterm");
		EntityManager em = emf.createEntityManager();
		List<Interest> profileInterests = profile.getInterests();
		List<List<Interest>> common = new ArrayList<>();
		String query = "";

		if (profile.getSexualOrientation() == Sexuality.Heterosexual) {
			if (profile.getGender() == Gender.Man) {
				query = "SELECT p FROM Profile p WHERE p.id != :id AND p.age >= :min AND p.age <= :max AND p.minAge <= :age AND p.maxAge >= :age AND p.gender = 'Woman' AND p.sexualOrientation != 'Homosexual'";
			} else {
				query = "SELECT p FROM Profile p WHERE p.id != :id AND p.age >= :min AND p.age <= :max AND p.minAge <= :age AND p.maxAge >= :age AND p.gender = 'Man' AND p.sexualOrientation != 'Homosexual'";
			}
		} else if (profile.getSexualOrientation() == Sexuality.Homosexual) {
			if (profile.getGender() == Gender.Man) {
				query = "SELECT p FROM Profile p WHERE p.id != :id AND p.age >= :min AND p.age <= :max AND p.minAge <= :age AND p.maxAge >= :age AND p.gender = 'Man' AND p.sexualOrientation != 'Heterosexual'";
			} else {
				query = "SELECT p FROM Profile p WHERE p.id != :id AND p.age >= :min AND p.age <= :max AND p.minAge <= :age AND p.maxAge >= :age AND p.gender = 'Woman' AND p.sexualOrientation != 'Heterosexual'";
			}

		} else {
			if (profile.getGender() == Gender.Man) {
				query = "SELECT p FROM Profile p WHERE p.id != :id AND p.age >= :min AND p.age <= :max AND p.minAge <= :age AND p.maxAge >= :age AND (p.gender != 'Man' OR p.sexualOrientation != 'Heterosexual') AND (p.gender != 'Woman' OR p.sexualOrientation != 'Homosexual')";
			} else {
				query = "SELECT p FROM Profile p WHERE p.id != :id AND p.age >= :min AND p.age <= :max AND p.minAge <= :age AND p.maxAge >= :age AND (p.gender != 'Woman' OR p.sexualOrientation != 'Heterosexual') AND (p.gender != 'Man' OR p.sexualOrientation != 'Homosexual')";

			}

		}

		List<Profile> partners = em.createQuery(query, Profile.class).setParameter("id", profile.getId())
				.setParameter("min", profile.getMinAge()).setParameter("max", profile.getMaxAge())
				.setParameter("age", profile.getAge()).getResultList();
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
