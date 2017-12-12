package sg.edu.nus.iss.sa45.team4;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;


public class ServletInitializer extends SpringBootServletInitializer {
	
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(StockistApplication.class);
	}
	
}
