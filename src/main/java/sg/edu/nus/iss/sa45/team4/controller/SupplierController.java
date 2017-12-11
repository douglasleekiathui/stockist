package sg.edu.nus.iss.sa45.team4.controller;

import java.util.ArrayList;
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

import com.t4.exception.SupplierNotFound;

import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;
import sg.edu.nus.iss.sa45.team4.validator.SupplierValidator;

@Controller
@RequestMapping("/suppliers")
public class SupplierController {

	@Autowired
	private SupplierService sService;
	
	@Autowired
	private SupplierValidator sValidator;

	@InitBinder("supplier")
	private void initSupplierBinder(WebDataBinder binder) {
		binder.addValidators(sValidator);
	}
	
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView newSupplierPage()
	{
		Supplier supplier = new Supplier();
		ModelAndView mv=new ModelAndView("supplier-new","suppliers",supplier);
    	//ArrayList<User> uList= uService.findAllUsers();
		mv.addObject("supplier", supplier);
		mv.setViewName("/suppliers/supplier-new");
		return mv;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ModelAndView createNewSupplier(@ModelAttribute Supplier supplier, BindingResult result, 
			final RedirectAttributes redirectAttributes)
	{
		if(result.hasErrors()) {
			ModelAndView mv=new ModelAndView("supplier-new");
			//mv.addObject("user",users);
			//mv.setViewName("users/create");
			return mv;
			
			//return new ModelAndView("user-new");
		}
		ModelAndView mv=new ModelAndView();
		String message="New Supplier "+ supplier.getSupplierName()+"was successfully created.";
		sService.createSupplier(supplier);
		mv.setViewName("suppliers/supplier-list");
		List<Supplier> sList = sService.findAllSuppliers();
		mv.addObject("sList", sList);
		redirectAttributes.addFlashAttribute("message",message);
		return mv;
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView supplierListPage() {
		ModelAndView mv = new ModelAndView("supplier-list");
		List<Supplier> sList = sService.findAllSuppliers();
		mv.addObject("sList", sList);
		mv.setViewName("/suppliers/supplier-list");
		return mv;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editSupplierPage(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("supplier-edit");
		Supplier supplier = sService.findSupplier(id);
		mv.addObject("supplier", supplier);
		ArrayList<Supplier> sList = sService.findAllSuppliers();
		mv.addObject("sList", sList);
		mv.setViewName("/suppliers/supplier-edit");
		return mv;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editSupplier(@ModelAttribute @Valid Supplier supplier, BindingResult result, @PathVariable String id,
			final RedirectAttributes redirectAttributes) {

		if (result.hasErrors())
			return new ModelAndView("supplier-edit");

		ModelAndView mav = new ModelAndView("redirect:suppliers/supplier-list");
		String message = "Supplier was successfully updated.";

		sService.changeSupplier(supplier);

		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteSupplier(@PathVariable String id, final RedirectAttributes redirectAttributes)
			throws SupplierNotFound {

		ModelAndView mv = new ModelAndView("redirect:/suppliers/list");
		Supplier supplier = sService.findSupplier(id);
		supplier.setRecordStatus(0);
		sService.changeSupplier(supplier);
		//sService.removeSupplier(supplier);;
		String message = "The supplier" + supplier.getSupplierName() + " was successfully deleted.";

		redirectAttributes.addFlashAttribute("message", message);
		return mv;
	}
	@RequestMapping("")
	public ModelAndView viewReOrders() {
		ModelAndView mav = new ModelAndView();
		ArrayList<Supplier> sList=(ArrayList<Supplier>) sService.findAllSuppliers();
		mav.addObject("sList" , sList);
		mav.setViewName("/home");
		return mav;
	}
	

}
