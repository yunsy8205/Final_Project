package com.cloud.pt.ptClass;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.myPtMember.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ptClass/*")
@Slf4j
public class PtClassController {
	
	@Autowired
	private PtClassService ptClassService;
	
	@GetMapping("ptList") 
	  public String getCalendar() throws Exception{
		
		return "ptClass/ptList";
	  }
	
		/*
		 * @ResponseBody
		 * 
		 * @PostMapping("addClass") public String addClass(PtClassVO ptClassVO )throws
		 * Exception{
		 * 
		 * ptClassService.addClass(ptClassVO);
		 * 
		 * String st = "ptClass/ptList"; return st;
		 * 
		 * }
		 */
	  @GetMapping("addClass")
	  public ModelAndView addClass(
			  @RequestParam("memberNum") String memberNum, 
              @RequestParam("employeeNum") String employeeNum, 
              @RequestParam("name") String name, 
              HttpSession session) throws Exception{
		  
		  ModelAndView mv = new ModelAndView();
		  log.info("사번 : {} >>>>>" , employeeNum);
		  log.info("멤버번호 : {} >>>>", memberNum);
		  log.info("멤버이름 : {} >>>" , name);
		  mv.addObject("memberNum", memberNum);
	      mv.addObject("employeeNum", employeeNum);
	      mv.addObject("name", name);
		  mv.setViewName("ptClass/addClass");
		  return mv;
	  }
	
	  @PostMapping("addClass") 
	  public ModelAndView addClass(PtClassVO ptClassVO,HttpSession session) throws Exception{
		  ModelAndView mv = new ModelAndView();
			
			/*
			 * log.info("사번 : {} >>>>>" , ptClassVO.getEmployeeNum());
			 * log.info("멤버번호 : {} >>>>", ptClassVO.getMemberNum());
			 * log.info("멤버이름 : {} >>>" , ptClassVO.getName());
			 */
			 
		  
		  int result = ptClassService.addClass(ptClassVO);
		  mv.addObject("ptClassVO", ptClassVO);
		  mv.setViewName("redirect:./ptList");
	  
	  return mv; 
	  
	  }
	  @PostMapping("delClass")
	  public String delClass(PtClassVO ptClassVO) throws Exception{
		  
		  ptClassService.delClass(ptClassVO);
		  return "redirect:./ptList";
	  }
	  
	  
	 

}