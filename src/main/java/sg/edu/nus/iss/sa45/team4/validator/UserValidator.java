package sg.edu.nus.iss.sa45.team4.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sg.edu.nus.iss.sa45.team4.model.User;
	@Component
	public class UserValidator implements Validator {
		@Override
		public boolean supports(Class<?> clazz) {
			return User.class.isAssignableFrom(clazz);
		}

		@Override
		public void validate(Object target, Errors errors) {
			User u = (User) target;
//			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user", "","error.users.user.empty");
//			ValidationUtils.rejectIfEmpty(errors, "password", "","error.users.password.empty");
//			ValidationUtils.rejectIfEmpty(errors, "user_role", "","error.users.user_role.empty");
			
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user","User Name Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password","Password Name Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userRole","User Role Cannot be Empty");
			System.out.println(u.toString());
		}

	}

