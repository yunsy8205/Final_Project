package com.cloud.pt.attendance.modify;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttendanceModifyController {
	@Autowired
	private AttendanceModifyService attendanceModifyService;
	
	@GetMapping("/attendanceModify/list")
	public String getList(EmployeeVO employeeVO) throws Exception {
		
		return "attendance/list";
	}
	

	@GetMapping("/attendanceModify/add")
	public String setAdd(Model model) throws Exception {
		
		return "attendance/form";
	}
	
	@PostMapping("/attendanceModify/add")
	public String setAdd(AttendanceModifyVO attendanceModifyVO) throws Exception {
		int result = attendanceModifyService.setAdd(attendanceModifyVO);
		
		return "attendance/list";
	}
}
