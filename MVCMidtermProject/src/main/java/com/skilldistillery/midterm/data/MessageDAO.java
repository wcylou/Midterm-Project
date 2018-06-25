package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Message;

public interface MessageDAO {
	public Message create(Message message);
	public List<Message> viewMyConversations(int profileId);
	public List<Message> viewEntireThread(int threadId);
}
