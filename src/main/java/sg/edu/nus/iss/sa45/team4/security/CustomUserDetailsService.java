package sg.edu.nus.iss.sa45.team4.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import sg.edu.nus.iss.sa45.team4.services.UserService;

@Component
public class CustomUserDetailsService implements UserDetailsService{

	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String arg0) throws UsernameNotFoundException {
		userService.findUser(arg0);
		UserDetails ud= new CustomUserDetails();
		return ud;
	}

}
