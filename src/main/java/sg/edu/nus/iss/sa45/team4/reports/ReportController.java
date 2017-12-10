package sg.edu.nus.iss.sa45.team4.reports;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;

import sg.edu.nus.iss.sa45.team4.services.TransactionService;

	
@Controller
@RequestMapping("/reports")
public class ReportController {
	
	@Autowired
    private ApplicationContext appContext;
	
	@Autowired
	private TransactionService transactionService;

	@RequestMapping(value="/transactions",method = RequestMethod.GET)
	public ModelAndView viewReOrders() {
		JasperReportsPdfView view = new JasperReportsPdfView();
        view.setUrl("classpath:reports/report1.jrxml");
        view.setApplicationContext(appContext);

        Map<String, Object> params = new HashMap<>();
        params.put("datasource", transactionService.findAllTransactions());

        return new ModelAndView(view, params);
	}
	
}
