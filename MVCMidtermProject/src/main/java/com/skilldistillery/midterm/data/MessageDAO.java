package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Message;
import com.skilldistillery.midterm.entities.Profile;

public interface MessageDAO {
	public Message create(Message message);
	public Message reply(Message message, int messageId);
	public List<List<Message>> viewAllMessages(Profile recipient);
}
