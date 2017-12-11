package sg.edu.nus.iss.sa45.team4;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;


@RunWith(SpringRunner.class)
@SpringBootTest(classes=StockistApplication.class)
public class StockistApplicationTests {

	@Autowired
	private MockMvc mockMvc;
	

	    
	@Test
	public void contextLoads() {
		//this.mockMvc.perform(??);
	}

}
