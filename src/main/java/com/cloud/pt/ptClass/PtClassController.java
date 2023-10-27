package com.cloud.pt.ptClass;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ptClass/*")
public class PtClassController {
	
	@GetMapping("ptReservation")
	public void getCalendar() throws Exception{
		
	}
}
