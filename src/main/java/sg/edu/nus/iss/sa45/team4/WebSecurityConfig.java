package sg.edu.nus.iss.sa45.team4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import sg.edu.nus.iss.sa45.team4.model.User;
import sg.edu.nus.iss.sa45.team4.security.CustomAuthenticationProvider;
import sg.edu.nus.iss.sa45.team4.services.UserService;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private CustomAuthenticationProvider customAuthenticationProvider;
	
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
            auth.authenticationProvider(customAuthenticationProvider);
    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/**").access("hasRole('ADMIN')").and().formLogin()
				.loginPage("/login").loginProcessingUrl("/j_spring_security_check").failureUrl("/login?error").usernameParameter("username")
				.passwordParameter("password").and().logout().logoutSuccessUrl("/login?logout").and()
				.exceptionHandling().accessDeniedPage("/403").and().csrf();
	}

}
