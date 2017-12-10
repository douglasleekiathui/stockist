package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.RunningNumber;
import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.services.ProductService;
import sg.edu.nus.iss.sa45.team4.services.RunningNumberService;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;
import sg.edu.nus.iss.sa45.team4.services.TransactionLineService;
import sg.edu.nus.iss.sa45.team4.services.TransactionService;

@Controller
@RequestMapping("/products/orders")
public class ProductOrderController {

	@Autowired
	private ProductService productService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private TransactionService transactionService;
	@Autowired
	private RunningNumberService runningNumberService;
	@Autowired
	TransactionLineService transactionLineService;

	// view products to be re-ordered
	@RequestMapping(value = "/{supplier}", method = RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable("supplier") String supplier) {
		ModelAndView mav = new ModelAndView("products/orders/view");
		List<Product> products;
		if (supplier.equalsIgnoreCase("all")) {
			products = productService.getReorderProductByPage();
		} else {
			Supplier s = supplierService.findSupplier(supplier);
			products = productService.findProductsBySupplier(s);
			mav.addObject("s", s);
		}
		mav.addObject("pList", products);
		return mav;
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showFirstProduct() {
		return "forward:/products/orders/all";
	}


	// create new purchase order for individual product type
	@RequestMapping(value = "/new/p={productNo}", method = RequestMethod.GET)
	public ModelAndView addNewOrder(@PathVariable("productNo") String productNo ) {
		Product p = productService.findProduct(productNo);
		Transaction tx = new Transaction();
		TransactionLine tl = new TransactionLine();
		List<TransactionLine> tlList = new ArrayList<TransactionLine>();
		tlList.add(tl);
		tx.setTransactionLines(tlList);
		tx.setCreatedFor(p.getPrimarySupplier().getSupplierName());
		tl.setProductNo(p.getProductNo());
		
		ModelAndView mav = new ModelAndView("/products/orders/new-po-tx", "tx", tx);
		mav.addObject("p", p);
		return mav;
	}	

	@RequestMapping(value = "/new/p={productNo}", method = RequestMethod.POST)
	public ModelAndView submitNewOrder(@ModelAttribute("tx") Transaction tx,BindingResult bindingResult) {
		RunningNumber rn =runningNumberService.findRunningNumber("transactions");
		rn.setValue(rn.getValue()+1);
		runningNumberService.changeRunningNumber(rn);
		String txNo="T"+String.format("%04d", rn.getValue());
		tx.setTransactionNo(txNo);
		tx.setCreatedBy("admin");
		tx.setTransactionType("PO");
		TransactionLine tl=tx.getTransactionLines().get(0);
		tl.setTransactionNo(txNo);
		tl.setLineNo(1);
		tl.setTransaction(tx);
		
		
		transactionService.createTransaction(tx);
		transactionLineService.createTransactionLine(tl);
		ModelAndView mav = new ModelAndView("redirect:/products/orders/all");
		return mav;
	}

	
	// create new purchase order
	@RequestMapping(value = "/new/supplier={supplier}", method = RequestMethod.GET)
	public ModelAndView viewSupplier(@PathVariable String supplier) {
		Supplier s = supplierService.findSupplier(supplier);
		List<Product> products = productService.findProductsBySupplier(s);
		ModelAndView mav = new ModelAndView("/products/new", "products", products);
		return mav;
	}
}