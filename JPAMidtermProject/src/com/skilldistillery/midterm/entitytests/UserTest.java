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

import com.skilldistillery.midterm.entities.User;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User u;
	
	
	@BeforeAll
	public static void setUpAll() throws Exception {
		emf = Persistence.createEntityManagerFactory("Midterm");

	}

	@BeforeEach
	public void setUp() throws Exception {
		em = emf.createEntityManager();
		u = em.find(User.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		u = null;
	}

	@AfterAll
	public static void tearDownAll() throws Exception {
		emf.close();

	}
	
	@Test
	void test_user_mappings() {
		assertEquals("a@a.com", u.getEmail());
	}
	@Test
	void test_user_membership() {
		assertEquals("Bronze", u.getMembership().getName());
	}
	
	
	
}
