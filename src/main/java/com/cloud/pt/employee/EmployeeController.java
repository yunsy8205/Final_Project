package com.cloud.pt.employee;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloud.pt.commons.Pager;

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
	public String setJoin(@Valid EmployeeVO employeeVO,Errors errors, BindingResult bindingResult, Model model, MultipartFile photo)throws Exception{
		employeeVO.setPassword("0000");
		
//		boolean check = employeeService.getEmpError(employeeVO, bindingResult);
//		if(bindingResult.hasErrors() || check) {
//		
//			return "employee/join";
//		}
		if(errors.hasErrors()) {
			model.addAttribute("employeeVO", employeeVO);
			
			Map<String,String> validatorResult = employeeService.validateHandling(errors);
			for(String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			return "/employee/join";
		}
		
		int result = employeeService.setJoin(employeeVO);
		
		log.info("====>>>>>>>>>>>>>>>>>>> authorities :{} ", employeeVO.getAuthorities());
		
		return "redirect:/employee/list";
	}
	
	
	@GetMapping("list")
	public String getEmpList(Pager pager, Model model)throws Exception{
		List<EmployeeVO> ar = employeeService.getEmpList(pager);
		model.addAttribute("list", ar);
		
		return "employee/list";
	}
	
	
	@GetMapping("detail")
	public String getEmpDetail(EmployeeVO employeeVO, Model model)throws Exception{
		employeeVO = employeeService.getEmpDetail(employeeVO);
		model.addAttribute("employeeVO", employeeVO);
		
		return "employee/detail";
	}
	
	
	@GetMapping("update")
	public String setEmpUpdate(EmployeeVO employeeVO, Model model)throws Exception{
		employeeVO = employeeService.getEmpDetail(employeeVO);
		model.addAttribute("employeeVO", employeeVO);
		
		return "employee/update";
	}
	
	@PostMapping("update")
	public String setEmpUpdate(EmployeeVO employeeVO, MultipartFile  photo, RedirectAttributes attributes)throws Exception{
		String quit = employeeVO.getQuitDate();
		// 퇴직 -> 재직('' 값)
		if(quit==null || quit.equals("")) {
			
			employeeVO.setQuitDate(null);
			log.info(">>>>>>quitdate : {} ", employeeVO.getQuitDate());
		}
		
		int result = employeeService.setEmpUpdate(employeeVO);
		
		attributes.addAttribute("employeeNum", employeeVO.getEmployeeNum());
		
		return "redirect:/employee/detail";
	}
	
	
	@PostMapping("delete")
	public String setEmpDelete(EmployeeVO employeeVO)throws Exception{
		int result = employeeService.setEmpDelete(employeeVO);
		
		return "redirect:./list";
	}
}