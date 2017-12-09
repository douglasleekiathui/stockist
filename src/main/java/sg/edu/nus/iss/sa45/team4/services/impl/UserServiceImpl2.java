package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.User;
import sg.edu.nus.iss.sa45.team4.repository.UserRepository;
import sg.edu.nus.iss.sa45.team4.services.UserService;


@Service
public class UserServiceImpl2 implements UserService{
	
	@Resource
	private UserRepository UserRepository;
	


	@Override
	@Transactional
	public ArrayList<User> findAllUsers() {
		ArrayList<User> l = (ArrayList<User>) UserRepository.findAll();
		return l;
	}


	@Override
	@Transactional
	public User findUser(String ceid) {
		return UserRepository.findOne(ceid);

	}

	
	@Override
	@Transactional
	public User createUser(User User) {
		return UserRepository.saveAndFlush(User);
	}

	
	@Override
	@Transactional
	public User changeUser(User User) {
		return UserRepository.saveAndFlush(User);
	}

	@Override
	@Transactional
	public void removeUser(User User) {
		UserRepository.delete(User);
	}
	
	@Transactional
	public User authenticate(String uname, String pwd)
	{
		User u= UserRepository.findUserByNamePwd(uname, pwd);
		return u;
	}


}
