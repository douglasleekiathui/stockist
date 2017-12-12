package sg.edu.nus.iss.sa45.team4.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;

@Component
public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Product p = (Product) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productNo","", "Product Number is empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productDescription","", "Product Description is empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dimension","", "Dimension is empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "primarySupplier","", "Supplier is empty");
		ValidationUtils.rejectIfEmpty(errors, "onhandQty","", "Onhand Quantity is empty");
		ValidationUtils.rejectIfEmpty(errors, "minQty","", "Minimun Quantity is empty");
		ValidationUtils.rejectIfEmpty(errors, "reorderQty","", "Reorder Quantity is empty");
		ValidationUtils.rejectIfEmpty(errors, "price","", "Price is empty");
		System.out.println(p.toString());
	}
}
