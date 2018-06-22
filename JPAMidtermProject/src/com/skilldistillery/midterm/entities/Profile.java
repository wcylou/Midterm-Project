package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Profile {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	private int age;
	@Enumerated(EnumType.STRING)
	private Gender gender;
	@Column(name="sexual_orientation")
	@Enumerated(EnumType.STRING)
	private Sexuality sexualOrientation;
	@Column(name="about_me")
	private String aboutMe;
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="location_id")
	private Location location;
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	@Column(name="picture_url")
	private String pictureUrl;
	@OneToMany(mappedBy="profile")
	private List<Match> matches;
	@ManyToMany(fetch=FetchType.EAGER, cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name = "profile_interest", joinColumns = @JoinColumn(name = "profile_id"), inverseJoinColumns = @JoinColumn(name = "interest_id"))
	private List<Interest> interests;
	@Column(name = "min_age")
	private int minAge;
	@Column(name = "max_age")
	private int maxAge;
	
	//gets and sets
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	public Sexuality getSexualOrientation() {
		return sexualOrientation;
	}
	public void setSexualOrientation(Sexuality sexualOrientation) {
		this.sexualOrientation = sexualOrientation;
	}
	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public int getId() {
		return id;
	}
	public List<Match> getMatches() {
		return matches;
	}
	public void setMatches(List<Match> matches) {
		this.matches = matches;
	}
	
	//convenience methods
		public void addMatch(Match match) {
			if(matches == null) matches = new ArrayList<>();
			
			if(!matches.contains(match)) {
				matches.add(match);
				if(match.getProfile() != null) {
					match.getProfile().getMatches().remove(match);
				}
				match.setProfile(this);
			}
		}
		
		public void removeMatch(Match match) {
			match.setProfile(null);
			if (matches != null) {
				matches.remove(match);
			}
		}
	
	public List<Interest> getInterests() {
		return interests;
	}
	public void setInterests(List<Interest> interests) {
		this.interests = interests;
	}
	
	public void addInterest(Interest interest) {
		if (interests == null)
			interests = new ArrayList<>();

		if (!interests.contains(interest)) {
			interests.add(interest);
			interest.addProfile(this);
		}

	}

	public void removeInterest(Interest interest) {
		if (interests != null && interests.contains(interest)) {
			interests.remove(interest);
			interest.removeProfile(this);
		}
	}
	
	public int getMinAge() {
		return minAge;
	}
	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}
	public int getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Profile id=");
		builder.append(id);
		builder.append("\n gender=");
		builder.append(gender);
		builder.append("\n sexualOrientation=");
		builder.append(sexualOrientation);
		builder.append("\n minAge=");
		builder.append(minAge);
		builder.append("\n maxAge=");
		builder.append(maxAge);
		builder.append("\n Age =");
		builder.append(age);
		return builder.toString();
	}
	
	
}
