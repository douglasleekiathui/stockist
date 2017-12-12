package sg.edu.nus.iss.sa45.team4.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sg.edu.nus.iss.sa45.team4.model.Transaction;

@Component
public class MechanicValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Transaction.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Transaction tx = (Transaction) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "createdFor","","Customer Name is required! ");
		System.out.println(tx.toString());
	}
	
	

}
