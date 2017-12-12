package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.edu.nus.iss.sa45.team4.exception.SupplierNotFound;
import sg.edu.nus.iss.sa45.team4.exception.UserNotFound;
import sg.edu.nus.iss.sa45.team4.model.User;
import sg.edu.nus.iss.sa45.team4.services.UserService;
import sg.edu.nus.iss.sa45.team4.validator.AdminUserValidator;

@Controller
@RequestMapping("/users")
public class AdminUserController {
	
	@Autowired
	private UserService uService;

	@Autowired
	private AdminUserValidator uValidator;

	@InitBinder("user")
	private void initUserBinder(WebDataBinder binder) {
		binder.addValidators(uValidator);
	}
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView newUserPage()
	{
		User user = new User();
		ModelAndView mv=new ModelAndView("user-new","users",user);
		mv.addObject("user", user);
		mv.setViewName("user-new");
		return mv;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ModelAndView createNewUser(@ModelAttribute @Valid User users, BindingResult result, 
			final RedirectAttributes redirectAttributes)
	{
		if(result.hasErrors()) {
			ModelAndView mv=new ModelAndView("user-new");
			return mv;
		}
		ModelAndView mv=new ModelAndView();
		String message="New user "+ users.getUser()+"was successfully created.";
		uService.createUser(users);
		mv.setViewName("redirect:/users/list");
		redirectAttributes.addFlashAttribute("message",message);
		return mv;
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView userListPage() {
		ModelAndView mv = new ModelAndView("user-list");
		List<User> uList = uService.findAllUsers();
		mv.addObject("uList", uList);
		mv.setViewName("user-list");
		return mv;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("user-edit");
		User user = uService.findUser(id);
		mv.addObject("user", user);
		ArrayList<User> uList = uService.findAllUsers();
		mv.addObject("uList", uList);
		mv.setViewName("user-edit");
		return mv;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editUser(@ModelAttribute @Valid User users, BindingResult result, @PathVariable String id,
			final RedirectAttributes redirectAttributes) throws UserNotFound {

		if (result.hasErrors())
			return new ModelAndView("user-edit");

		ModelAndView mav = new ModelAndView("redirect:/users/list");
		String message = "User was successfully updated.";

		uService.changeUser(users);

		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable String id, final RedirectAttributes redirectAttributes) {

		ModelAndView mv = new ModelAndView("redirect:/users/list");
		User user = uService.findUser(id);
		uService.removeUser(user);
		String message = "The user " + user.getUser() + " was successfully deleted.";

		redirectAttributes.addFlashAttribute("message", message);
		return mv;
	}
	@RequestMapping("")
	public ModelAndView viewReOrders() {
		ModelAndView mav = new ModelAndView();
		ArrayList<User> userList=(ArrayList<User>) uService.findAllUsers();
		mav.addObject("userList" , userList);
		mav.setViewName("/home");
		return mav;
	}
	
}