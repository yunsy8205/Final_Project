package com.cloud.pt.main;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class HomeController {
	
	@GetMapping("home")
	public String getHome() throws Exception{
		return "home";
	}
	
	@GetMapping("/")
	public String getIndex(@ModelAttribute EmployeeVO employeeVO) throws Exception {
		
		SecurityContext context = SecurityContextHolder.getContext();
		
		Authentication a = context.getAuthentication();
		
		log.info("==>>> GetName :{}", a.getName());       // id
		log.info("==>>> GetPrincipal :{}", a.getPrincipal());  // 사용자 정보
		log.info("==>>> GetRole :{}", a.getAuthorities());// 사용자 권한s 
		
		return "/employee/login";
	}
	
	
	
}
