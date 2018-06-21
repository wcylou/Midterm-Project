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

import com.skilldistillery.midterm.entities.Interest;

class InterestTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Interest i;
	
	
	@BeforeAll
	public static void setUpAll() throws Exception {
		emf = Persistence.createEntityManagerFactory("Midterm");

	}

	@BeforeEach
	public void setUp() throws Exception {
		em = emf.createEntityManager();
		i = em.find(Interest.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		i = null;
	}

	@AfterAll
	public static void tearDownAll() throws Exception {
		emf.close();

	}
	
	@Test
	void test_interest_mappings() {
		assertEquals("Gaming", i.getName());
	}

	@Test
	void test_interest_mapping_to_profile() {
		assertEquals("Wilson", i.getProfiles().get(0).getFirstName());
	}

//	@Test
//	void test_event_mapping_to_interest() {
//		assertEquals("Music", e.getInterests().get(0).getName());
//	}
	
	
	
	
}
