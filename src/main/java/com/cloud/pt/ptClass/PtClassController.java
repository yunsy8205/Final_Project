package com.cloud.pt.ptClass;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.myPtMember.MemberVO;

@Controller
@RequestMapping("/ptClass/*")
public class PtClassController {
	
	@Autowired
	private PtClassService ptClassService;
	
	@GetMapping("ptReservation")
	public ModelAndView getCalendar(PtClassVO ptClassVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pt",ptClassVO);
		mv.setViewName("ptClass/ptReservation");
		
		return mv;
		
	}
/*
 * @GetMapping("myList") public String documentFormList(Model model,Long
 * employeeNum)throws Exception{ List<PtClassVO> ar =
 * ptClassService.getMyList(); model.addAttribute("list", ar); return
 * "/ptClass/list"; } }
 */
}