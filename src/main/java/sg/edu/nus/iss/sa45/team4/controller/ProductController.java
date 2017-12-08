package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.services.ProductService;




@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	private ProductService pService;

	@RequestMapping(value="",method = RequestMethod.GET)
	public ModelAndView viewReOrders() {
		ModelAndView mav = new ModelAndView();
		ArrayList<Product> productList=(ArrayList<Product>) pService.findAllProducts();
		mav.addObject("productList",productList);
		mav.setViewName("/products/view");
		return mav;
	}
	
}
