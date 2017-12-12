package sg.edu.nus.iss.sa45.team4.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;

@Component
public class AdminOrderValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return Transaction.class.equals(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		Transaction tx = (Transaction) arg0;
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "transactionDate","","Purchase date is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "createdFor","","Supplier is required");
		checkQtyIsGreaterThanZero(tx, arg1);

	}

	/*
	 * check that posted quantity > 0 accept quantity=0 because supplier view has
	 * full list of products, but user may not want to update every single product
	 */
	private void checkQtyIsGreaterThanZero(Transaction tx, Errors arg1) {
		if (tx.getTransactionDate() == null)
			arg1.reject("transactionDate", "Enter a valid date");
		for (int i = 0; i < tx.getTransactionLines().size(); i++) {
			TransactionLine tl = tx.getTransactionLines().get(i);
			if (tl.getPostedQty() < 0) {
				arg1.rejectValue("transactionLines[" + i + "].postedQty", "Purchase quantity cannot be negative");
			}

		}
	}

}
