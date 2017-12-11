package sg.edu.nus.iss.sa45.team4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sg.edu.nus.iss.sa45.team4.services.UserService;

@Controller
public class PageController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/", "/public**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("Header", "Public Page");
		model.addObject("Menu", "<a href=\"login\">login</a>");
		model.setViewName("public");
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("Header", "Inventory Management System - User Maintenance Page");
		model.setViewName("admin");

		return model;

	}

	@RequestMapping(value = "/mechanic**", method = RequestMethod.GET)
	public ModelAndView mechanicPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("Header", "Inventory Management System - Mechanic Page");
		model.setViewName("mechanic");

		return model;

	}	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}
	
	//for denied access page
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();
		
		//check if user is logged in
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("denied");
		return model;

	}

}