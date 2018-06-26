package com.skilldistillery.midterm.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Message;
import com.skilldistillery.midterm.entities.Profile;
@Component
@Transactional
public class MessageDAOImpl implements MessageDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Message createMessage(Message message) {
		em.persist(message);
		em.flush();
		return message;
	}

	@Override
	public List<Message> viewMyConversations(int profileId) {
		String query = "SELECT m FROM Message m WHERE m.threadId = m.id AND m.recipient.id = :pid";
		List<Message> results = em.createQuery(query, Message.class).setParameter("pid", profileId).getResultList();
		return results;
	}

	@Override
	public List<Message> viewEntireThread(int threadId) {
		String query = "SELECT m FROM Message m WHERE m.threadId = :id";
		List<Message> results = em.createQuery(query, Message.class).setParameter("id", threadId).getResultList();
		return results;
	}

}
