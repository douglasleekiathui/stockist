package sg.edu.nus.iss.sa45.team4.security;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import sg.edu.nus.iss.sa45.team4.services.UserService;

@Component
public class CustomUserDetails implements UserDetails{

	private String user;
	private String password;
	private List<CustomAuthority> grantedAuthority;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities(){
		return grantedAuthority;
	}
	public void setAuthorities(List<CustomAuthority> grantedAuthority){
		this.grantedAuthority=grantedAuthority;
	}
	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public String getUsername() {
		return user;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public void setUser(String user) {
		this.user=user;
	}
	
	@Override
	public boolean isAccountNonExpired() {return true;}
	@Override
	public boolean isAccountNonLocked() {return true;}
	@Override
	public boolean isCredentialsNonExpired() {return true;}
	@Override
	public boolean isEnabled() {return true;}


	
}
