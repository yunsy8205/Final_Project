package com.cloud.pt.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {

	@GetMapping("info")
	public String getInfo() {
		
		return "attendance/info";
	}
}
