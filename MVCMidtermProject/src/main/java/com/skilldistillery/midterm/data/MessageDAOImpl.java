package com.skilldistillery.midterm.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Message;
@Component
@Transactional
public class MessageDAOImpl implements MessageDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Message createMessage(Message message) {
		em.persist(message);
		em.flush();
		message.setThreadId(message.getId());
		return message;
	}
	
	@Override
	public Message createReply(Message message) {
		em.persist(message);
		em.flush();
		message.setThreadId(getThreadId(message.getRecipient().getId(), message.getSender().getId()));
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
		String query = "SELECT m FROM Message m WHERE m.threadId = :id ORDER BY m.dateSent DESC";
		List<Message> results = em.createQuery(query, Message.class).setParameter("id", threadId).getResultList();
		return results;
	}
	
	@Override
	public int getThreadId(int sender, int recipient) {
		String query = "SELECT m FROM Message m WHERE (m.sender.id = :sid and m.recipient.id = :rid) "
				+ "OR (m.sender.id = :rid and m.recipient.id = :sid)";
		int threadId = em.createQuery(query, Message.class)
								.setParameter("sid", sender)
								.setParameter("rid", recipient)
								.getResultList()
								.get(0)
								.getThreadId();
		return threadId;
	}
	
//	@Override 
//	public int nextAutoIncrement() {
//		String query="SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES "
//				+ "WHERE table_name = 'message' and table_schema = 'midterm'";
//	}
	
	
}
