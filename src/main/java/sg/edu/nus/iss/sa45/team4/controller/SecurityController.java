package sg.edu.nus.iss.sa45.team4.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.edu.nus.iss.sa45.team4.model.User;
import sg.edu.nus.iss.sa45.team4.services.UserService;

@Controller
@RequestMapping(value = "/")
public class SecurityController {
	
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String logic(Model model) {
		return "redirect:/login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
	
//	
//	@Autowired
//	private UserService userService;
//
//	@RequestMapping(value = { "/login", "/" }, method = RequestMethod.GET)
//	public String logic(Model model) {
//		model.addAttribute("user", new User());
//		return "login";
//	}
//
//	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
//	public ModelAndView authenticate(@ModelAttribute User user, HttpSession session, BindingResult result) {
//		ModelAndView mav = new ModelAndView("login");
//		if (result.hasErrors())
//			return mav;
//
//		String authenticationResult = userService.authenticateUser(user.getUser(),user.getPassword());;
//		switch (authenticationResult) {
//			case "authenticated":
//				UserSession us = new UserSession();
//				us.setUser(user);
//				us.setSessionId(session.getId());
//				session.setAttribute("USERSESSION", us);
//				mav = new ModelAndView("redirect:/products/view");
//			break;
//			case "no user found":
//				mav = new ModelAndView("redirect:/login");
//			break;
//			case "incorrect password":
//				mav = new ModelAndView("redirect:/login");
//		}
//		
//
//
//		return mav;
//	}
//
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public ModelAndView logout(HttpSession session) {
//		session.invalidate();
//		return new ModelAndView("redirect:/products/view");
//	}

}
