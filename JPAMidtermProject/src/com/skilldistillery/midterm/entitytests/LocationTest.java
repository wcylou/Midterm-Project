package com.skilldistillery.midterm.entitytests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.midterm.entities.Location;

class LocationTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Location l;
	
	
	@BeforeAll
	public static void setUpAll() throws Exception {
		emf = Persistence.createEntityManagerFactory("Midterm");

	}

	@BeforeEach
	public void setUp() throws Exception {
		em = emf.createEntityManager();
		l = em.find(Location.class, 2);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		l = null;
	}

	@AfterAll
	public static void tearDownAll() throws Exception {
		emf.close();

	}
	
	@Test
	void test_location_mappings() {
		assertEquals("Colorado", l.getState());
	}

	@Test
	void test_location_mapping_to_event() {
		assertEquals("Rockies Game", l.getEvents().get(0).getName());
	}

//	@Test
//	void test_event_mapping_to_interest() {
//		assertEquals("Music", e.getInterests().get(0).getName());
//	}
	
	
	
	
}
