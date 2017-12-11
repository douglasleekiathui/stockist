package sg.edu.nus.iss.sa45.team4.repository;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import sg.edu.nus.iss.sa45.team4.model.Product;

@RunWith(SpringRunner.class)
@DataJpaTest
public class ProductRepositoryTest {

	@Autowired
    private TestEntityManager entityManager;
    @Autowired
    private ProductRepository productRepository;
    
    @Test
    public void whenFindByName_thenReturnEmployee() {
        // given
        Product p = new Product();
        p.setProductNo("Q0001");
        entityManager.persist(p);
        entityManager.flush();
     
        // when
        Product found = productRepository.findOne(p.getProductNo());
     
        // then
        assertThat(found.getProductNo()).isEqualTo(p.getProductNo());
    }
    
}
