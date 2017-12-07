package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.edu.nus.iss.sa45.team4.model.User;
import sg.edu.nus.iss.sa45.team4.services.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	
	@Autowired
	private UserService uService;

	@RequestMapping(value="",method = RequestMethod.GET)
	public ModelAndView viewReOrders() {
		ModelAndView mav = new ModelAndView();
		ArrayList<User> userList=(ArrayList<User>) uService.findAllUsers();
		mav.addObject("userList" , userList);
		mav.setViewName("/users/view");
		return mav;
	}
	
}