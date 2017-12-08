package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.services.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	private ProductService pService;

	@RequestMapping(value="/view",method = RequestMethod.GET)
	public ModelAndView viewProductsPage() {
		ModelAndView mav = new ModelAndView();
		ArrayList<Product> productList=(ArrayList<Product>) pService.findAllProducts();
		mav.addObject("productList",productList);
		mav.setViewName("/products/view");
		return mav;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView newProductPage() {
		Product p = new Product();
		ModelAndView mav = new ModelAndView("create", "products",p);
		mav.setViewName("/products/create");
		mav.addObject("products", pService.createProduct(p));
		return mav;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createNewProductPage(@ModelAttribute Product product, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		String message ="New Product" + product.getProductNo() +" was successfully created.";
		
		pService.createProduct(product);
		mav.setViewName("redirect:/products/view");
		
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
		
	}
	@RequestMapping(value = "/edit/{productNo}", method = RequestMethod.GET)
	public ModelAndView editProductPage(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView("edit");
		Product product = pService.findProduct(productNo);
		System.out.print(productNo);
		mav.addObject("product", product);
		mav.setViewName("/products/edit");
		return mav;
	}
	
	@RequestMapping(value = "/edit/{productNo}", method = RequestMethod.POST)
	public ModelAndView editProductPage(@ModelAttribute Product product, BindingResult result,
			@PathVariable String productNo, final RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView("redirect:/products/view");
		pService.changeProduct(product);
		String message = "Product was successfully updated";
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
	@RequestMapping(value = "/delete/{productNo}", method = RequestMethod.GET)
	public ModelAndView deleteProductPage(@PathVariable String productNo, 
			final RedirectAttributes redirectAttributes) {

		ModelAndView mav = new ModelAndView("redirect:/products/view");
		Product product = pService.findProduct(productNo);
		pService.removeProduct(product);
		String message = "The product " + product.getProductNo() + " was successfully deleted.";

		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
}

