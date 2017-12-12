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

import sg.edu.nus.iss.sa45.team4.exception.SupplierNotFoundException;
import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;
import sg.edu.nus.iss.sa45.team4.validator.AdminSupplierValidator;


@Controller
@RequestMapping("/admin/suppliers")
public class AdminSupplierController {

	@Autowired
	private SupplierService sService;
	
	@Autowired
	private AdminSupplierValidator sValidator;

	@InitBinder("supplier")
	private void initSupplierBinder(WebDataBinder binder) {
		binder.addValidators(sValidator);
	}
	
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView newSupplierPage()
	{
		Supplier supplier = new Supplier();
		ModelAndView mv=new ModelAndView("supplier-new","suppliers",supplier);
		mv.setViewName("admin/suppliers/supplier-new");
		sService.createSupplier(supplier);
		mv.addObject("supplier", supplier);
		return mv;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ModelAndView createNewSupplier(@ModelAttribute @Valid Supplier supplier, BindingResult result, 
			final RedirectAttributes redirectAttributes)
	{
		if(result.hasErrors()) {
			ModelAndView mv=new ModelAndView("admin/suppliers/supplier-new");
			return mv;
		}
		ModelAndView mv=new ModelAndView();
		String message="New Supplier "+ supplier.getSupplierName()+"was successfully created.";
		sService.createSupplier(supplier);
		supplier.setRecordStatus(1);
		mv.setViewName("redirect:/admin/suppliers/list");
	    redirectAttributes.addFlashAttribute("message",message);
		return mv;
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView supplierListPage() {
		ModelAndView mv = new ModelAndView("supplier-list");
		ArrayList<Supplier> sList = sService.findAllSuppliers();
		sList.removeIf((Supplier p)-> p.getRecordStatus() == 0);
		mv.setViewName("/admin/suppliers/supplier-list");
		mv.addObject("sList", sList);
		return mv;
	}

	@RequestMapping(value = "/edit/{supplierNo}", method = RequestMethod.GET)
	public ModelAndView editSupplierPage(@PathVariable String supplierNo) {
		ModelAndView mv = new ModelAndView("admin/suppliers/supplier-edit");
		Supplier supplier = sService.findSupplier(supplierNo);
		mv.addObject("supplier", supplier);
		return mv;
	}

	@RequestMapping(value = "/edit/{supplierNo}", method = RequestMethod.POST)
	public ModelAndView editSupplier(@ModelAttribute @Valid Supplier supplier, BindingResult result, @PathVariable String supplierNo,
			final RedirectAttributes redirectAttributes) throws SupplierNotFoundException {

		if (result.hasErrors())
			return new ModelAndView("admin/suppliers/supplier-edit");

		ModelAndView mav = new ModelAndView("admin/suppliers/supplier-list");
		String message = "Supplier was successfully updated.";
		sService.changeSupplier(supplier);
		mav.setViewName("redirect:/admin/suppliers/list");
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	@RequestMapping(value = "/delete/{supplierNo}", method = RequestMethod.GET)
	public ModelAndView deleteSupplier(@PathVariable String supplierNo, final RedirectAttributes redirectAttributes)
			throws SupplierNotFoundException {

		ModelAndView mv = new ModelAndView("redirect:/admin/suppliers/list");
		Supplier supplier = sService.findSupplier(supplierNo);
		supplier.setRecordStatus(0);
		sService.changeSupplier(supplier);
		String message = "The supplier" + supplier.getSupplierName() + " was successfully deleted.";
		redirectAttributes.addFlashAttribute("message", message);
		return mv;
	}
	@RequestMapping("")
	public ModelAndView viewReOrders() {
		ModelAndView mav = new ModelAndView();
		ArrayList<Supplier> sList=(ArrayList<Supplier>) sService.findAllSuppliers();
		mav.addObject("sList" , sList);
		mav.setViewName("/welcome");
		return mav;
	}
	

}
