package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.services.ProductService;
import sg.edu.nus.iss.sa45.team4.services.TransactionLineService;
import sg.edu.nus.iss.sa45.team4.services.TransactionService;

@Controller
@RequestMapping("/mechanic")

class MechanicProductControllerTest {

	@Autowired
	private ProductService pService;
	
	@Autowired
	TransactionService tService;
	
	@Autowired
	TransactionLineService tlService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView productsListPage() {
		ModelAndView mav = new ModelAndView("mechanic-products-list");
		ArrayList<Product> productsList = (ArrayList<Product>) pService.findAllProducts();
		mav.addObject("productsList", productsList);
		return mav;
	}

	@RequestMapping(value = "/recordUsage/{id}", method = RequestMethod.GET)
	public ModelAndView recordUsagePage(@PathVariable String id) {
		ModelAndView mav = new ModelAndView("mechanic-record-product-usage");
		String ceid = id;
		Product products = pService.findProduct(ceid);
		Integer usedAmount = 0;
		mav.addObject("products", products);
		mav.addObject("usedAmount", usedAmount);
		return mav;

	}

	@RequestMapping(value = "/recordUsage/{id}", method = RequestMethod.POST)
	public ModelAndView recordUsagePage(@ModelAttribute Product products, BindingResult result, @PathVariable String id, final RedirectAttributes redirectAttributes, @RequestParam String usedQuantityTextBox) {
		
		ModelAndView mav = new ModelAndView("redirect:/mechanic/list");
		products = pService.findProduct(id);
		Integer usedQuantity = Integer.parseInt(usedQuantityTextBox);
		Integer newQuantity = products.getOnhandQty()- usedQuantity;
		pService.updateUsage(products.getProductNo(), newQuantity);
		Date today = new Date();
		

		
		Transaction tr = new Transaction();
		TransactionLine tl = new TransactionLine();
		
		tr.setCreatedBy("Mechanic1");
		tr.setCreatedFor("Customer1");
		tr.setTransactionDate(today);
		tr.setTransactionType("WO");
		
		tl.setLineNo(1);
		tl.setPostedQty(newQuantity);
		tl.setProductNo(id);
		
		tService.createTransaction(tr);
		tlService.createTransactionLine(tl);
		
		String message = "Products successfully updated.";		
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
}
