package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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
	private String gender;
	@Column(name="sexual_orientation")
	private String sexualOrientation;
	@Column(name="about_me")
	private String aboutMe;
	@ManyToOne
	@JoinColumn(name="location_id")
	private int locationId;
	@OneToOne
	@JoinColumn(name="user_id")
	private int userId;
	@Column(name="picture_url")
	private String pictureUrl;
	@OneToMany(mappedBy="profile_id")
	private List<Match> matches;
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSexualOrientation() {
		return sexualOrientation;
	}
	public void setSexualOrientation(String sexualOrientation) {
		this.sexualOrientation = sexualOrientation;
	}
	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	public int getLocationId() {
		return locationId;
	}
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
		builder.append("Profile [id=");
		builder.append(id);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", age=");
		builder.append(age);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", sexualOrientation=");
		builder.append(sexualOrientation);
		builder.append(", aboutMe=");
		builder.append(aboutMe);
		builder.append(", locationId=");
		builder.append(locationId);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", pictureUrl=");
		builder.append(pictureUrl);
		builder.append("]");
		return builder.toString();
	}
	
	
}
