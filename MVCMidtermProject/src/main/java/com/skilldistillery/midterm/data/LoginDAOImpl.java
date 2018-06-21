package com.skilldistillery.midterm.data;

import java.util.Set;

public class LoginDAOImpl implements LoginDAO {
	
	  @Override
	  public User getUserByUserNameAndPassword(String username, String password) {
	    User u = null;
	    Set<Integer> keys = users.keySet();
	    for (Integer key : keys) {
	      User user = users.get(key);
	      if(user.getUsername().equals(username) && user.getPassword().equals(password)) {
	        u = user;
	        break;
	      }
	    }
	    return u;
	  }

}
