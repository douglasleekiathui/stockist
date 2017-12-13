package sg.edu.nus.iss.sa45.team4.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
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
import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.services.ProductService;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;
import sg.edu.nus.iss.sa45.team4.services.TransactionService;
import sg.edu.nus.iss.sa45.team4.validator.AdminOrderValidator;

@Controller
@RequestMapping("/admin/orders")
public class AdminOrderController {

	// business logic
	@Autowired
	private ProductService pService;
	@Autowired
	private SupplierService sService;
	@Autowired
	private TransactionService trService;

	// validator
	@Autowired
	private AdminOrderValidator productOrderValidator;

	@InitBinder(value = "tx")
	private void initProductOrderBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		webDataBinder.setValidator(productOrderValidator);
	}

	// view products to be re-ordered
	@RequestMapping(value = "/{supplier}", method = RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable("supplier") String supplier) {
		ModelAndView mav = new ModelAndView("/admin/orders/order-view");
		List<Product> products;
		if (supplier.equalsIgnoreCase("all")) {
			products = pService.getReorderProductByPage();
		} else {
			Supplier s = sService.findSupplier(supplier);
			products = pService.findProductsBySupplier(s);
			mav.addObject("s", s);
		}
		mav.addObject("pList", products);
		return mav;
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showFirstProduct() {
		return "forward:/admin/orders/all";
	}

	// create new purchase order for individual product
	@RequestMapping(value = "/new/p={productNo}", method = RequestMethod.GET)
	public ModelAndView addNewOrder(@PathVariable("productNo") String productNo) {
		Product p = pService.findProduct(productNo);
		Transaction tx = new Transaction();
		TransactionLine tl = new TransactionLine();
		List<TransactionLine> tlList = new ArrayList<TransactionLine>();
		tlList.add(tl);
		tx.setTransactionLines(tlList);
		tx.setCreatedFor(p.getPrimarySupplier().getSupplierName());
		tx.setTransactionDate(Calendar.getInstance().getTime());
		tl.setProductNo(p.getProductNo());
		tl.setTransaction(tx);

		ModelAndView mav = new ModelAndView("/admin/orders/order-new", "tx", tx);
		mav.addObject("p", p);
		return mav;
	}

	@RequestMapping(value = "/new/*", method = RequestMethod.POST)
	public ModelAndView submitNewOrder(@ModelAttribute("tx") @Valid Transaction tx, BindingResult bindingResult,
			final RedirectAttributes redirectAttributes) {

		if (bindingResult.hasErrors())
			return new ModelAndView("/admin/orders/order-new");

		tx.setCreatedBy("admin");
		tx.setTransactionType("PO");
		trService.createTransaction(tx);
		String message = "Purchase was successfully updated.";

		ModelAndView mav = new ModelAndView("redirect:/admin/orders/all");
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	// create new purchase order for supplier
	@RequestMapping(value = "/new/s={supplier}", method = RequestMethod.GET)
	public ModelAndView viewSupplier(@PathVariable String supplier) {
		Supplier s = sService.findSupplier(supplier);
		List<Product> products = pService.findProductsBySupplier(s);
		Transaction tx = new Transaction();
		tx.setTransactionDate(Calendar.getInstance().getTime());
		tx.setCreatedFor(s.getSupplierName());
		ArrayList<TransactionLine> tlList = new ArrayList<TransactionLine>();
		for (Product p : products) {
			TransactionLine tl = new TransactionLine();
			tl.setTransaction(tx);
			tl.setProductNo(p.getProductNo());
			tl.setPostedQty(java.lang.Math.max(p.getReorderQty() - p.getOnhandQty(), 0));
			tlList.add(tl);
		}
		tx.setTransactionLines(tlList);

		ModelAndView mav = new ModelAndView("/admin/orders/order-new", "tx", tx);
		return mav;
	}
	
	
	// view reorder report by supplier
	@RequestMapping(value = "/suppliers", method = RequestMethod.GET)
	public ModelAndView viewAllSuppliers() {
		List<Supplier> sList = sService.findAllSuppliers();
		return new ModelAndView("admin/orders/order-view-supplier","sList",sList);
	}

}
