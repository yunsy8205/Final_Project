package com.cloud.pt.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.pt.employee.EmployeeService;
import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("home")
	public String getIndex(Model model) throws Exception {
		
		SecurityContext context = SecurityContextHolder.getContext();
		
		Authentication a = context.getAuthentication();
		
		log.info("==>>> GetName :{}", a.getName());       // id
		log.info("==>>> GetPrincipal :{}", a.getPrincipal());  // 사용자 정보
		log.info("==>>> GetRole :{}", a.getAuthorities());// 사용자 권한s 
		log.info("==>>> STATE :{}", a.getPrincipal().toString());
		//int findIndex = a.getPrincipal().toString().indexOf("재직");
		
		
		log.info("==>>> index(재직) : {}", a.getPrincipal().toString().contains("재직"));
		boolean check = a.getPrincipal().toString().contains("재직");
		if(!check) {
			model.addAttribute("message", "퇴직처리 되었습니다. 그동안 수고 많으셨습니다!");
			model.addAttribute("url", "/");
			return "/commons/result";
		}
		
		return "home";
	}
	
	@GetMapping("/")
	public String getEmpLogin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		return "/employee/login";
	}
	
	@GetMapping("findPw")
	public void getFindPw(EmployeeVO employeeVO)throws Exception{
		
	}
	
	@PostMapping("findPw")
	public String getFindPw(EmployeeVO employeeVO, Model model)throws Exception{
		
		employeeService.getFindPw(employeeVO);
		return "employee/login";
	}
	
}
