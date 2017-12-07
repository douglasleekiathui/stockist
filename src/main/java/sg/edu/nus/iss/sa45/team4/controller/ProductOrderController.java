package sg.edu.nus.iss.sa45.team4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/products/order/")
public class ProductOrderController {
	
	@RequestMapping("/")
	public String viewReOrders() {
		return "order";
	}

}
