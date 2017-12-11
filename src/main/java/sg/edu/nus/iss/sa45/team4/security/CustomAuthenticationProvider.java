package sg.edu.nus.iss.sa45.team4.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import sg.edu.nus.iss.sa45.team4.model.User;
import sg.edu.nus.iss.sa45.team4.services.UserService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	UserService userService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String user = authentication.getName();
        String password = authentication.getCredentials().toString();
        User u = userService.authenticate(user, password);
        if(u!=null){
        	CustomAuthority customAuthority= new CustomAuthority();
        	customAuthority.setAuthority(u.getUserRole());
        	List<CustomAuthority> customAuthorityList= new ArrayList<CustomAuthority>();
        	customAuthorityList.add(customAuthority);
        	return new UsernamePasswordAuthenticationToken(user, password, customAuthorityList);
        }
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
