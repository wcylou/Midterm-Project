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
	public Message create(Message message) {
		em.persist(message);
		em.flush();

		return message;
	}

	@Override
	public Message reply(Message message, int messageId) {
		String query = "SELECT m from Message m WHERE m.inReplyTo = :id";
	}

	@Override
	public List<List<Message>> viewAllMessages(Profile recipient) {
		// TODO Auto-generated method stub
		return null;
	}

}
