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

import com.skilldistillery.midterm.entities.Profile;

class ProfileTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Profile p;
	
	
	@BeforeAll
	public static void setUpAll() throws Exception {
		emf = Persistence.createEntityManagerFactory("Midterm");

	}

	@BeforeEach
	public void setUp() throws Exception {
		em = emf.createEntityManager();
		p = em.find(Profile.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		p = null;
	}

	@AfterAll
	public static void tearDownAll() throws Exception {
		emf.close();

	}
	
	@Test
	void test_profile_mappings() {
		assertEquals("Wilson", p.getFirstName());
	}

//	@Test
//	void test_membership_mapping_to_user() {
//		assertEquals(1, m.getUsers().size());
//	}
	
	
	
	
}
