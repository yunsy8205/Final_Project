package com.cloud.pt.employee;

import org.springframework.validation.Errors;

public interface Validator {
	
	boolean supports(Class<?> clazz);
	void validate(Object target, Errors errors);
}
