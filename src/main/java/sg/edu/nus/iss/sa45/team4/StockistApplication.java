package sg.edu.nus.iss.sa45.team4;

import java.util.Locale;
import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;


@SpringBootApplication(scanBasePackages = "sg.edu.nus.iss.sa45.team4")
@EnableWebMvc
@EnableTransactionManagement
@PropertySource({"classpath:application.properties"})
@EnableJpaRepositories("sg.edu.nus.iss.sa45.team4.repository")
public class StockistApplication extends WebSecurityConfigurerAdapter {

	public static void main(String[] args) {
		SpringApplication.run(StockistApplication.class, args);
	}

	@Resource(name="")
	private Environment env;
	
	//Tiles
	 @Bean 
	 public UrlBasedViewResolver tilesViewResolver(){

	    UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
	    tilesViewResolver.setViewClass(TilesView.class);
	    //tilesViewResolver.setPrefix("/WEB-INF/view/");
	    //tilesViewResolver.setSuffix(".jsp");
	    return tilesViewResolver;
	}
	 @Bean
	 public TilesConfigurer tilesConfigurer(){ 

	    String[] definitions = new String[] {"/WEB-INF/tiles.xml"};

	    TilesConfigurer tilesConfigurer = new TilesConfigurer();
	    tilesConfigurer.setDefinitions(definitions);
	    return tilesConfigurer;

	 }
	
	
	//Sitemesh-----------------------------------------------uncomment to test
//	@Bean
//	public FilterRegistrationBean siteMeshFilter() {
//	FilterRegistrationBean filter = new FilterRegistrationBean();
//	filter.setFilter(new MySiteMeshFilter());
//	return filter;
//	} 
	
	// security-----------------------------------------------------
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.jdbcAuthentication()
		.dataSource(dataSource()).usersByUsernameQuery(
				"select user, password, true from users where user=?")
		.authoritiesByUsernameQuery(
				"select user, 'ROLE_'+user_role from users where user=?");
    }

	@Override 
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.anyRequest().authenticated()
				.antMatchers("/login**","/").permitAll()
				.antMatchers("/products/create","/suppliers/**","/users/**").access("hasAuthority('ADMIN')")
				.and().formLogin()
				.failureUrl("/login?error")
				.defaultSuccessUrl("/products/view.jsp")
				.and().logout().logoutSuccessUrl("/login?logout").invalidateHttpSession(true)
				.and().exceptionHandling().accessDeniedPage("/403");
	}
	

	//property files-----------------------------------------------------------
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyPlaceholderConfigurer() {
	      return new PropertySourcesPlaceholderConfigurer();
	}

	//for i18n------------------------------------------------------------------
	//choose sessionlocaleresolver for non-persistence, compared to cookielocaleresolver
	@Bean
	public SessionLocaleResolver localeResolver() {
	    SessionLocaleResolver sessionLocaleResolver = new SessionLocaleResolver();
	    sessionLocaleResolver.setDefaultLocale(Locale.US);
	    return sessionLocaleResolver;
	}
	//intercept request and look for locale
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
	    LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
	    localeChangeInterceptor.setParamName("lang");
	    return localeChangeInterceptor;
	}
	//insert interceptors
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
	}
	@Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
		source.setBasename(env.getProperty("message.source.basename"));
		source.setUseCodeAsDefaultMessage(true);
		source.setDefaultEncoding("UTF-8");
		source.setCacheSeconds(0);
		return source;
	}


	//jasper reports------------------------------------------------------------
	 @Bean
	    @Primary
	    @ConfigurationProperties(prefix = "datasource")
	    public DataSource primaryDataSource() {
	        return DataSourceBuilder.create().build();
	    }
	 
	 
	@Bean
	// view resolver configuration to internal resource--------------------------
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	// data persistence configuration----------------------------------------------
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("db.driver"));
		dataSource.setUrl(env.getProperty("db.url"));
		dataSource.setUsername(env.getProperty("db.username"));
		dataSource.setPassword(env.getProperty("db.password"));
		return dataSource;
	}
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactoryBean.setDataSource(dataSource());
		entityManagerFactoryBean.setPackagesToScan(env.getProperty("entitymanager.packages.to.scan"));
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		entityManagerFactoryBean.setJpaVendorAdapter(vendorAdapter);
		entityManagerFactoryBean.setJpaProperties(hibernateProperties());
		return entityManagerFactoryBean;
	}
	@Bean
	public JpaTransactionManager transactionManager() {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory().getObject());
		return transactionManager;
	}
	private Properties hibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
		return properties;
	}
	
	
}