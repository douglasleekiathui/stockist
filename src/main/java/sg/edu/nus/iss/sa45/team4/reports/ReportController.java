package sg.edu.nus.iss.sa45.team4.reports;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;

import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.services.ProductService;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;

@Controller
@RequestMapping("/reports")
public class ReportController {

	
	@Autowired
	private ApplicationContext appContext;
	@Autowired
	private ProductService productService;
	@Autowired
	private SupplierService supplierService;

	@RequestMapping(value = "/reorder/{supplier}", method = RequestMethod.GET)
	public ModelAndView viewReOrders(@PathVariable("supplier") String supplier) {
		Supplier s = supplierService.findSupplier(supplier);
		JasperReportsPdfView view = new JasperReportsPdfView();
		view.setUrl("classpath:reports/reorder.jrxml");
		view.setApplicationContext(appContext);

		Map<String, Object> params = new HashMap<>();
		params.put("datasource", productService.findProductsBySupplier(s));
		params.put("s", s);

		return new ModelAndView(view, params);
	}

}