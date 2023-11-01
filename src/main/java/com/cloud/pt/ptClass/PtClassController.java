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
	
	@GetMapping("ptList") 
	  public void getCalendar() throws Exception{
	  
	  }

}