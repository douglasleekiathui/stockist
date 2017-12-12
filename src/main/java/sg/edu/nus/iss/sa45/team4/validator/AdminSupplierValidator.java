package sg.edu.nus.iss.sa45.team4.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sg.edu.nus.iss.sa45.team4.model.Supplier;

	@Component
	public class AdminSupplierValidator implements Validator {
		@Override
		public boolean supports(Class<?> clazz) {
			return Supplier.class.isAssignableFrom(clazz);
		}

		@Override
		public void validate(Object target, Errors errors) {
			Supplier s= (Supplier) target;	
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "supplierNo;","Supplier No Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "supplierName","Supplier Name Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "supplierContact","Supplier Contact Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "supplierEmail","Supplier Role Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "recordStatus","Record Status Cannot be Empty");
			System.out.println(s.toString());
		}

	}
