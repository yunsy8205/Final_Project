package com.cloud.pt.ptClass;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.myPtMember.MemberVO;

@Controller
@RequestMapping("/ptClass/*")
public class PtClassController {
	
	@GetMapping("ptReservation")
	public ModelAndView getCalendar(PtClassVO ptClassVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pt",ptClassVO);
		mv.setViewName("ptClass/ptReservation");
		
		return mv;
		
	}
}
