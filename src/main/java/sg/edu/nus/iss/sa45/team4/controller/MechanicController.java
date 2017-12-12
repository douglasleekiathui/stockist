package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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


import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.services.ProductService;
import sg.edu.nus.iss.sa45.team4.services.TransactionLineService;
import sg.edu.nus.iss.sa45.team4.services.TransactionService;
import sg.edu.nus.iss.sa45.team4.validator.MechanicValidator;

@Controller
@RequestMapping("/mechanic")

class MechanicProductControllerTest {

	
	@Autowired
	private ProductService pService;
	@Autowired
	TransactionService tService;
	@Autowired
	TransactionLineService tlService;
	
	@Autowired
	private MechanicValidator mValidator;
	
	@InitBinder("tx")
	private void initProductBinder(WebDataBinder binder) {
		binder.addValidators(mValidator);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView productsListPage() {
		ModelAndView mav = new ModelAndView("mechanic/mechanic-products-list");
		ArrayList<Product> productsList = (ArrayList<Product>) pService.findAllProducts();
		mav.addObject("productsList", productsList);
		return mav;
	}

	@RequestMapping(value = "/recordUsage/p={productNo}", method = RequestMethod.GET)
	public ModelAndView recordUsagePage(@PathVariable("productNo") String productNo) {
		Product p = pService.findProduct(productNo);
		
		Transaction tx = new Transaction();
		TransactionLine tl = new TransactionLine();
		List<TransactionLine> tlList = new ArrayList<TransactionLine>();
		tlList.add(tl);
		tx.setTransactionLines(tlList);
		tl.setProductNo(p.getProductNo());
		tl.setTransaction(tx);
		ModelAndView mav = new ModelAndView("mechanic/mechanic-record-usage", "tx", tx);
		mav.addObject("p", p);
		
		return mav;

	}

	@RequestMapping(value = "/recordUsage/*", method = RequestMethod.POST)
	public ModelAndView recordUsagePage(@ModelAttribute("tx") @Valid Transaction tx, BindingResult result, 
			final RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors())
			return new ModelAndView("mechanic/mechanic-record-usage");
		
		Date today = new Date();		
		tx.setCreatedBy("mech1");
		tx.setTransactionDate(today);
		tx.setTransactionType("WO");		
		tService.createTransaction_Mechanic(tx);
		
		ModelAndView mav = new ModelAndView("redirect:/mechanic/list");
		
		String message = "Record done !.";		
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
	
	@RequestMapping(value = "/viewHistory/{productNo}", method = RequestMethod.GET)
	public ModelAndView viewHistoryPage(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView("mechanic/mechanic-view-history");		
		ArrayList<Transaction> tList = new ArrayList<Transaction>();			
		tList = tService.findAllTransactions();
		
		mav.addObject("tList", tList);	
		return mav;
	}
	@RequestMapping(value = "/mechanic-product-detail/{productNo}", method = RequestMethod.GET)
	public ModelAndView DetailProductPage(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView("product-detail");
		Product product = pService.findProduct(productNo);
		mav.addObject("product", product);
		mav.setViewName("/mechanic/mechanic-product-detail");
		return mav;
	}
	
}
