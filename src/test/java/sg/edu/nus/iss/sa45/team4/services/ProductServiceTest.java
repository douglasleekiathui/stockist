package sg.edu.nus.iss.sa45.team4.services;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.junit4.SpringRunner;

import sg.edu.nus.iss.sa45.team4.repository.ProductRepository;
import sg.edu.nus.iss.sa45.team4.services.impl.ProductServiceImpl;

@RunWith(SpringRunner.class)
public class ProductServiceTest {

    @TestConfiguration
    static class ProductServiceTestContextConfiguration {
  
        @Bean
        public ProductService productService() {
            return new ProductServiceImpl();
        }
    }
	
	@Autowired
    private ProductService productService;
    @MockBean
    private ProductRepository productRepository;
    
    
}
