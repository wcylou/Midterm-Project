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

import com.skilldistillery.midterm.entities.Message;

class MessageTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Message m;
	
	
	@BeforeAll
	public static void setUpAll() throws Exception {
		emf = Persistence.createEntityManagerFactory("Midterm");

	}

	@BeforeEach
	public void setUp() throws Exception {
		em = emf.createEntityManager();
		m = em.find(Membership.class, 2);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		m = null;
	}

	@AfterAll
	public static void tearDownAll() throws Exception {
		emf.close();

	}
	
	@Test
	void test_membership_mappings() {
		assertEquals(5.00, m.getPrice());
	}

	@Test
	void test_membership_mapping_to_user() {
		assertEquals(0, m.getUsers().size());
	}
	
	
	
	
}
