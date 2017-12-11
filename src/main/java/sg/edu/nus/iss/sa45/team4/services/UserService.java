package sg.edu.nus.iss.sa45.team4.services;

import java.util.ArrayList;


import sg.edu.nus.iss.sa45.team4.model.User;

public interface UserService {

	ArrayList<User> findAllUsers();

	User findUser(String ceid);

	User createUser(User User);

	User changeUser(User User);

	void removeUser(User User);
	
	User authenticate(String uname, String pwd);

	String authenticateUser(String user, String password);
}