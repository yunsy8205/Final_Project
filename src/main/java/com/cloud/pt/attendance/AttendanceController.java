package com.cloud.pt.attendance;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttendanceController {

	@GetMapping("/attendance/info")
	public String getInfo(EmployeeVO employeeVO, Model model) throws Exception {
		
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
