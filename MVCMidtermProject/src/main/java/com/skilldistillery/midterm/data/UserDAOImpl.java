package com.skilldistillery.midterm.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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

}
