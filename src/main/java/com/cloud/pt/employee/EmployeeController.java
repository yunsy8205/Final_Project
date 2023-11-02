
package com.cloud.pt.employee;

import java.security.Principal;
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
import org.springframework.web.bind.annotation.RequestParam;
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
		return "employee/login";
	}
	
	
	@GetMapping("info")
	public void getInfo(Principal principal, EmployeeVO employeeVO, Model model)throws Exception{	
		log.info("empnum : {}", employeeVO.getEmployeeNum());
		employeeVO.setEmployeeNum(principal.getName());
		log.info("Snum : {}", employeeVO.getEmployeeNum());
		log.info(">>>>>>>>>>>>>>>>> employee defaulinfo : {}", employeeVO);
		employeeVO = employeeService.getInfo(employeeVO);
		
		log.info(">>>>>>>>>>>>>>>>> employee info : {}", employeeVO);
		model.addAttribute("employeeVO", employeeVO);
	}
	
	
	
	
	@GetMapping("join")
	public void setJoin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		
	}
	
	
	@PostMapping("join")
	public String setJoin(@Valid EmployeeVO employeeVO,BindingResult bindingResult,Errors errors ,Model model, MultipartFile empfile)throws Exception{
		employeeVO.setPassword("0000");
		
		boolean check = employeeService.getEmpError(employeeVO, bindingResult);
		if(check) {
			log.info("==========================검증 에러 ===================");
			return "employee/join";
		}
		
		// 성공되는 검증
//		if(errors.hasErrors()) {
//			model.addAttribute("employeeVO", employeeVO);
//			
//			Map<String,String> validatorResult = employeeService.validateHandling(errors);
//			for(String key : validatorResult.keySet()) {
//				model.addAttribute(key, validatorResult.get(key));
//			}
//			return "/employee/join";
//		}
		
		int result = employeeService.setJoin(employeeVO,empfile);
		
		log.info("====>>>>>>>>>>>>>>>>>>> authorities :{} ", employeeVO.getAuthorities());
		
		return "redirect:/employee/list";
	}
	
	
	@GetMapping("list")
	public String getEmpList(EmployeeVO employeeVO, Pager pager, Model model)throws Exception{
		List<EmployeeVO> ar = employeeService.getEmpList(employeeVO, pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		return "/employee/list";
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