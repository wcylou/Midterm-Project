package com.skilldistillery.midterm.entities;

import java.util.Date;

import javax.persistence.*;


@Entity
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "sender_id")
	private Profile sender;
	@ManyToOne
	@JoinColumn(name = "recipient_id")
	private Profile recipient;
	@Column(name = "date_sent")
	@Temporal(TemporalType.DATE)
	private Date dateSent;
	@OneToOne
	@JoinColumn(name = "in_reply_to")
	private Message inReplyTo;
	@Column(name = "message_text")
	private String messageText;
	
	
	//gets and sets
	public Profile getSender() {
		return sender;
	}
	public void setSender(Profile sender) {
		this.sender = sender;
	}
	public Profile getRecipient() {
		return recipient;
	}
	public void setRecipient(Profile recipient) {
		this.recipient = recipient;
	}
	public Date getDateSent() {
		return dateSent;
	}
	public void setDateSent(Date dateSent) {
		this.dateSent = dateSent;
	}
	public Message getInReplyTo() {
		return inReplyTo;
	}
	public void setInReplyTo(Message inReplyTo) {
		this.inReplyTo = inReplyTo;
	}
	public String getMessageText() {
		return messageText;
	}
	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}
	public int getId() {
		return id;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Message [id=");
		builder.append(id);
		builder.append(", dateSent=");
		builder.append(dateSent);
		builder.append(", messageText=");
		builder.append(messageText);
		builder.append("]");
		return builder.toString();
	}
	
	
}
