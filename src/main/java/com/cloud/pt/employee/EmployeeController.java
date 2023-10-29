package com.cloud.pt.employee;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.member.MemberVO;

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
/*		SecurityContext context = SecurityContextHolder.getContext();
		
		context.getAuthentication().getName();
		
		log.info("===== CONTEXT : {}=====", context);
		log.info("==== CONTEXT_NAME :{} =====", context.getAuthentication().getName());
		
		String check = context.getAuthentication().getPrincipal().toString();
		
		if(!check.equals("anonymousUser")) {
			return "redirect:/";
		}*/
		return "employee/login";
	}
	
	
	
	@GetMapping("join")
	public void setJoin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		
		
	}
	
	
	@PostMapping("join")
	public String setJoin(@Valid EmployeeVO employeeVO, BindingResult bindingResult, MultipartFile photo)throws Exception{
		employeeVO.setPassword("0000");
		int result = employeeService.setJoin(employeeVO);
		
		log.info("====>>>>>>>>>>>>>>>>>>> authorities :{} ", employeeVO.getAuthorities());
		
		return "redirect:/home";
	}
}
