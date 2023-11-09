
package com.cloud.pt.employee;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
//import net.nurigo.sdk.NurigoApp;
//import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	
	@GetMapping("info")
	public void getInfo(Principal principal, EmployeeVO employeeVO,PasswordVO passwordVO, Model model)throws Exception{	
		employeeVO.setEmployeeNum(principal.getName());
		
		employeeVO = employeeService.getInfo(employeeVO);
		
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("passwordVO", passwordVO);
	}
	
	
	@GetMapping("infoUpdate")
	public void setInfoUpdate(@AuthenticationPrincipal EmployeeVO employeeVO, Model model)throws Exception{
		// update 전 검증 정보
		employeeVO = employeeService.getInfo(employeeVO);
		model.addAttribute("employeeVO", employeeVO);
	}
	
	@PostMapping("infoUpdate")
	public String setInfoUpdate(@Valid EmployeeVO employeeVO,BindingResult bindingResult, RedirectAttributes attributes, MultipartFile empfile)throws Exception{
		// update 후 검증 진행
		boolean check = employeeService.getEmpError(employeeVO, bindingResult);
		if(check) {
			log.info("==========================검증 에러 ===================");
			attributes.addAttribute("employeeNum", employeeVO.getEmployeeNum());
			return "/employee/infoUpdate";
		}	

		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO emp = (EmployeeVO)obj;
		employeeVO.setEmployeeNum(emp.getEmployeeNum());
		
		int result = employeeService.setInfoUpdate(employeeVO, empfile);

		attributes.addAttribute("employeeNum", employeeVO.getEmployeeNum());
		return "redirect:/employee/info";
	}
	

	
	@PostMapping("updatePw")
	public String setPwUpdate(@Valid PasswordVO passwordVO, BindingResult bindingResult, @AuthenticationPrincipal EmployeeVO employeeVO, Model model)throws Exception{
		
		String inputPw = passwordVO.getInputPw(); //JSP로부터 넘겨받은 입력한 기존비밀번호
			
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
		
		if(encoder.matches(inputPw, employeeVO.getPassword())) {//넘겨받은 비밀번호와 EMP의 암호화된 비밀번호와 비교
			
			boolean check = employeeService.getNewPwCheck(passwordVO, bindingResult);
			if(bindingResult.hasErrors() || check) {

				model.addAttribute("error", "true");
				return "/employee/info";
			}

			int result = employeeService.setPwUpdate(employeeVO, passwordVO);
		}else {
			bindingResult.rejectValue("inputPw", "employeeVO.password.inputPw");
			
			model.addAttribute("error", "true");
			return "/employee/info";
		}
		model.addAttribute("employeeVO", employeeVO);
		return	"/employee/info"; 
	}
	
	
	
	@GetMapping("join")
	public void setJoin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		
	}
	
	@PostMapping("join")
	public String setJoin(@Valid EmployeeVO employeeVO,BindingResult bindingResult,Errors errors ,Model model, MultipartFile empfile)throws Exception{
		employeeVO.setPassword("a12345678*");
		
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
		
		employeeVO.setEmployeeNum(employeeVO.getEmployeeNum());
		
		String userPhoneNumber = employeeVO.getPhone();
		String employeeNum = employeeVO.getEmployeeNum();
		String password = "a12345678*";
		
		log.info(userPhoneNumber);
		log.info(employeeNum);
		
		employeeService.sendJoin(userPhoneNumber, employeeNum, password);
		
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