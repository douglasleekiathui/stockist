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

	@RequestMapping(value = "/recordUsage/{productNo}", method = RequestMethod.GET)
	public ModelAndView recordUsagePage(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView("mechanic-record-usage");
		Product products = pService.findProduct(productNo);
		Integer usedAmount = 0;
		mav.addObject("products", products);
		mav.addObject("usedAmount", usedAmount);
		return mav;

	}

	@RequestMapping(value = "/recordUsage/{productNo}", method = RequestMethod.POST)
	public ModelAndView recordUsagePage(@ModelAttribute Product products, BindingResult result, 
			@PathVariable String productNo, final RedirectAttributes redirectAttributes, 
			@RequestParam String usedQuantityTextBox, @RequestParam String customerName) {
		ModelAndView mav = new ModelAndView("redirect:/mechanic/list");
		products = pService.findProduct(productNo);
		Integer usedQuantity = Integer.parseInt(usedQuantityTextBox);

		Date today = new Date();
		Transaction tr = new Transaction();
		TransactionLine tl = new TransactionLine();
		
		tr.setCreatedBy("mech1");
		tr.setCreatedFor(customerName);
		tr.setTransactionDate(today);
		tr.setTransactionType("WO");
		
		tl.setPostedQty((-usedQuantity));
		tl.setProductNo(productNo);
		tl.setTransaction(tr);
		ArrayList<TransactionLine> tlList = new ArrayList<TransactionLine>();
		tlList.add(tl);
		tr.setTransactionLines(tlList);
		
		tService.createTransaction(tr);

		String message = "Record done !.";		
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
	
	@RequestMapping(value = "/viewHistory/{productNo}", method = RequestMethod.GET)
	public ModelAndView viewHistoryPage(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView("mechanic-view-history");		
		ArrayList<Transaction> tList = new ArrayList<Transaction>();			
		tList = tService.findAllTransactions();
		
		mav.addObject("tList", tList);	
		return mav;
	}
	
}
