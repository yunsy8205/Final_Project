package com.cloud.pt.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	
	@GetMapping("login")
	public String getEmpLogin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		// 로그인 성공 시, 뒤로가기 처리. context(사용자정보)
		SecurityContext context = SecurityContextHolder.getContext();
		
		context.getAuthentication().getName();
		
		log.info("===== CONTEXT : {}=====", context);
		log.info("==== CONTEXT_NAME :{} =====", context.getAuthentication().getName());
		
		String check = context.getAuthentication().getPrincipal().toString();
		
		if(!check.equals("anonymousUser")) {
			return "redirect:/";
		}
		return "/employee/login";
	}
}