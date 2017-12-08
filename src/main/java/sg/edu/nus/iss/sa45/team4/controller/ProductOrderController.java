package sg.edu.nus.iss.sa45.team4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.edu.nus.iss.sa45.team4.services.ProductService;

@Controller
@RequestMapping("/products/orders")
public class ProductOrderController {
	
	@Autowired
	private ProductService productService;

	@RequestMapping(value="/page={page}",method=RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable String page) {
		ModelAndView mav=new ModelAndView("products/orders/view");
		mav.addObject("pList", productService.getReorderProductByPage(page,20));
		return mav;
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String showFirstProduct() {
		return "forward:/products/orders/page=0";
	}
	

}
