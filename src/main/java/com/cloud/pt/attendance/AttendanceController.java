package com.cloud.pt.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController {

	@GetMapping("/attendance/info")
	public String getInfo() {
		
		return "attendance/info";
	}
	
	@GetMapping("/attendance/list")
	public String getList() {
		
		return "attendance/list";
	}
	
	@GetMapping("/attendance/add")
	public String setAdd() {
		
		return "attendance/form";
	}
	
	@GetMapping("/admin/attendanceMonth")
	public String getAdminMonth() {
		
		return "attendance/adminMonth";
	}
	
	@GetMapping("/admin/attendanceDay")
	public String getAdminDay() {
		
		return "attendance/adminDay";
	}
}
