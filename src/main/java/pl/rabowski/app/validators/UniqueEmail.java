package pl.rabowski.app.validators;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import org.hibernate.validator.constraints.NotEmpty;


@Constraint(validatedBy = UniqueEmailValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@NotEmpty
public @interface UniqueEmail {
	
	String message() default "{uniqueEmail.error.message}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
