package pl.rabowski.app.validators;

import java.util.ArrayList;
import java.util.List;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;


import pl.rabowski.app.entities.User;
import pl.rabowski.app.repositories.UserRepository;

public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String>{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public void initialize(UniqueEmail constraintAnnotation) {	
		
	}

	@Override
	public boolean isValid(String email, ConstraintValidatorContext context) {
		List<User> allUsers = userRepository.findAll();
		List<String> emails	= new ArrayList<>();
		for(User user: allUsers) {
			emails.add(user.getEmail());
		}
		return emails.contains(email);
	}


}
