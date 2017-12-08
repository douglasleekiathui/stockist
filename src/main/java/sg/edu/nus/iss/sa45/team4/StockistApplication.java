package sg.edu.nus.iss.sa45.team4;

import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@SpringBootApplication(scanBasePackages = "sg.edu.nus.iss.sa45.team4")
@EnableWebMvc
@EnableTransactionManagement
@PropertySource({"classpath:application.properties"})
@EnableJpaRepositories("sg.edu.nus.iss.sa45.team4.repository")
public class StockistApplication {

	public static void main(String[] args) {
		SpringApplication.run(StockistApplication.class, args);
	}


	@Resource
	private Environment env;

	
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyPlaceholderConfigurer() {
	      return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean
	// view resolver configuration to internal resource
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	// data persistence configuration
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("db.driver"));
		dataSource.setUrl(env.getProperty("db.url"));
		dataSource.setUsername(env.getProperty("db.username"));
		dataSource.setPassword(env.getProperty("db.password"));
		return dataSource;
	}

//	 @Bean
//	 public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
//	 LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new
//	 LocalContainerEntityManagerFactoryBean();
//	 entityManagerFactoryBean.setDataSource(dataSource());
//	 entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistenceProvider.class);
//	 entityManagerFactoryBean.setPackagesToScan(env.getProperty("entitymanager.packages.to.scan"));
//	 entityManagerFactoryBean.setJpaProperties(hibernateProperties());
//	 return entityManagerFactoryBean;
//	 }

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
