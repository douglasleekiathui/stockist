package sg.edu.nus.iss.sa45.team4.security;

import org.springframework.security.core.GrantedAuthority;

public class CustomAuthority implements GrantedAuthority{

	private String userRole;
	
	@Override
	public String getAuthority() {
		return userRole;
	}
	
	public void setAuthority(String userRole) {
		this.userRole=userRole;
	}

}
