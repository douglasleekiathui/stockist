package sg.edu.nus.iss.sa45.team4.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import sg.edu.nus.iss.sa45.team4.model.User;
import sg.edu.nus.iss.sa45.team4.repository.UserRepository;
import sg.edu.nus.iss.sa45.team4.services.UserService;

@Component
@ComponentScan("sg.edu.nus.iss.security")
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Resource
	UserRepository userService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
        String password = authentication.getCredentials().toString();
        User user = userService.findUserByNamePwd(username, password);
        if(user != null){
        	CustomAuthority customAuthority= new CustomAuthority();
        	customAuthority.setAuthority(user.getUserRole());
        	List<GrantedAuthority> customAuthorityList= new ArrayList<GrantedAuthority>();
        	customAuthorityList.add(customAuthority);
        	return new UsernamePasswordAuthenticationToken(user, password, customAuthorityList);
        }
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
