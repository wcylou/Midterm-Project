package com.skilldistillery.midterm.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component
public class MatchDAOImpl implements MatchDAO {

	 @PersistenceContext
	  private EntityManager em;
}
