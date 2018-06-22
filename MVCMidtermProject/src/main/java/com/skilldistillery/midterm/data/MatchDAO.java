package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Match;
import com.skilldistillery.midterm.entities.Profile;

public interface MatchDAO {
	public Match findEventMatch(Profile profile, Profile partner);
	public List<Profile> findPotentialMatches(Profile profile);
}
