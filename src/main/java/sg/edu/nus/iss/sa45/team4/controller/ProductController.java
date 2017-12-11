package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.ProductSearch;
import sg.edu.nus.iss.sa45.team4.services.ProductService;
import sg.edu.nus.iss.sa45.team4.validator.ProductValidator;



@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	//@Autowired
	//private SupplierService sService;

	@Autowired
	private ProductValidator pValidator;
	
	@InitBinder("product")
	private void initProductBinder(WebDataBinder binder) {
		binder.addValidators(pValidator);
	}

	@RequestMapping(value="/view",method = RequestMethod.GET)
	public ModelAndView viewProductsPage() {
		int noOfItemsPerPage = 99999;
		int start = 0;
		int end = noOfItemsPerPage;
		int noOfPages = 0 ;
		ProductSearch productSearch = new ProductSearch();
		ModelAndView mav = new ModelAndView();
		ArrayList<Product> productList=(ArrayList<Product>) pService.findAllProducts();
		productList.removeIf((Product p)-> p.getRecord_status() == 0);
		noOfPages = (int)Math.floor(productList.size()/noOfItemsPerPage) + 1;
		start = 0 * noOfItemsPerPage;
		end = start + noOfItemsPerPage;
		end = end > productList.size() ? productList.size() : end;
		productList =  new ArrayList<Product>(productList.subList(start, end));
		mav.addObject("productList",productList);
		mav.addObject("noOfPages",noOfPages);
		mav.addObject("currentPage",1);
		mav.addObject("productSearch",productSearch);
		mav.setViewName("/products/view");
		return mav;
	}
	
	@RequestMapping(value="/view/{pageNo}",method = RequestMethod.GET)
	public ModelAndView viewProductsPage(@PathVariable int pageNo) {
		int noOfItemsPerPage = 99999;
		int start = 0;
		int end = noOfItemsPerPage;
		int noOfPages = 0 ;
		ProductSearch productSearch = new ProductSearch();
		ModelAndView mav = new ModelAndView();
		ArrayList<Product> productList=(ArrayList<Product>) pService.findAllProducts();
		productList.removeIf((Product p)-> p.getRecord_status() == 0);
		noOfPages = (int)Math.floor(productList.size()/noOfItemsPerPage) + 1;
		start = (pageNo - 1) * noOfItemsPerPage;
		end = start + noOfItemsPerPage;
		end = end > productList.size() ? productList.size() : end;
		productList =  new ArrayList<Product>(productList.subList(start, end));
		mav.addObject("productList",productList);
		mav.addObject("noOfPages",noOfPages);
		mav.addObject("currentPage",pageNo);
		mav.addObject("productSearch",productSearch);
		mav.setViewName("/products/view");
		return mav;
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.POST )
	public ModelAndView searchProductByCriteria(@ModelAttribute ProductSearch productSearch) {
		int noOfItemsPerPage = 99999;
		int start = 0;
		int end = noOfItemsPerPage;
		int noOfPages = 0 ;
		ModelAndView mav = new ModelAndView("view");
		ArrayList<Product> productList=(ArrayList<Product>) pService.findAllProducts();
		if(!productSearch.getSearchText().isEmpty() &&
		   !productSearch.getSearchType().isEmpty())
		{
			if(productSearch.getSearchType().equalsIgnoreCase("productNo"))
			{
				productList.removeIf((Product p)-> !p.getProductNo().toLowerCase().contains(productSearch.getSearchText().toLowerCase()));
			}
			else if(productSearch.getSearchType().equalsIgnoreCase("productDescription"))
			{
				productList.removeIf((Product p)-> !p.getProductDescription().toLowerCase().contains(productSearch.getSearchText().toLowerCase()));
			}
			else if(productSearch.getSearchType().equalsIgnoreCase("manufacturer"))
			{
				productList.removeIf((Product p)-> !p.getManufacturer().toLowerCase().contains(productSearch.getSearchText().toLowerCase()));
			}
			else if(productSearch.getSearchType().equalsIgnoreCase("shelfLocation"))
			{
				productList.removeIf((Product p)-> !p.getShelfLocation().toLowerCase().contains(productSearch.getSearchText().toLowerCase()));
			}
		}
		productList.removeIf((Product p)-> p.getRecord_status() == 0);
		noOfPages = (int)Math.floor(productList.size()/noOfItemsPerPage) + 1;
		start = 0 * noOfItemsPerPage;
		end = start + noOfItemsPerPage;
		end = end > productList.size() ? productList.size() : end;
		productList =  new ArrayList<Product>(productList.subList(start, end));
		mav.addObject("productList",productList);
		mav.addObject("noOfPages",noOfPages);
		mav.addObject("currentPage",1);
		mav.addObject("productSearch",productSearch);
		mav.setViewName("/products/view");
		return mav;
	}
	
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView newProductPage() {
		Product p = new Product();
		ModelAndView mav = new ModelAndView("create", "products",p);
		mav.setViewName("/products/create");
		mav.addObject("product", p);
		return mav;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createNewProductPage(@ModelAttribute @Valid Product product, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		 if (result.hasErrors()) {
	        	ModelAndView mav = new ModelAndView("create");
	    		mav.addObject("product", product);
	    		mav.setViewName("/products/create");
	            return mav;
	        }
		ModelAndView mav = new ModelAndView();
		String message ="New Product" + product.getProductNo() +" was successfully created.";
		pService.createProduct(product);
		product.setRecord_status(1);
		mav.setViewName("redirect:/products/view");
		
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
		
	}
	@RequestMapping(value = "/detail/{productNo}", method = RequestMethod.GET)
	public ModelAndView DetailProductPage(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView("detail");
		Product product = pService.findProduct(productNo);
		mav.addObject("product", product);
		mav.setViewName("/products/detail");
		return mav;
	}
	
	@RequestMapping(value = "/edit/{productNo}", method = RequestMethod.GET)
	public ModelAndView editProductPage(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView("edit");
		Product product = pService.findProduct(productNo);
		//ArrayList<Supplier> supplier = sService.findAllSuppliers();
		//mav.addObject("supplier", supplier);
		mav.addObject("product", product);
		mav.setViewName("/products/edit");
		return mav;
	}
	
	@RequestMapping(value = "/edit/{productNo}", method = RequestMethod.POST)
	public ModelAndView editProductPage(@ModelAttribute @Valid Product product,  BindingResult result,
			@PathVariable String productNo, final RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
        	ModelAndView mav = new ModelAndView("edit");
    		mav.addObject("product", product);
    		mav.setViewName("/products/edit");
            return mav;
        }
        
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
		product.setRecord_status(0);
		pService.changeProduct(product);
//		pService.removeProduct(product);
		String message = "The product " + product.getProductNo() + " was successfully deleted.";

		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
}
