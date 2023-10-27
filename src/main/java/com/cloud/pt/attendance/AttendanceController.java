package com.cloud.pt.attendance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttendanceController {
	@Autowired
	private AttendanceService attendanceService;

	@GetMapping("/attendance/info")
	public String getInfo(AttendanceVO attendanceVO, Model model) throws Exception {
		EmployeeVO employeeVO = attendanceService.getInfo(attendanceVO);
		log.info("vo: {}", employeeVO);
		model.addAttribute("vo", employeeVO);
		
		return "attendance/info";
	}
	
	@GetMapping("/attendance/list")
	public String getList() {
		
		return "attendance/list";
	}
	
	@GetMapping("/admin/attendanceMonth")
	public String getAdminMonth() {
		
		return "attendance/adminMonth";
	}
	
	@GetMapping("/admin/attendanceDay")
	public String getAdminDay() {
		
		return "attendance/adminDay";
	}
	
	//-----------------------------------------------------------
	@GetMapping("/attendanceModify/list")
	public String getModifyList(EmployeeVO employeeVO, Model model) throws Exception {
	//	List<AttendanceModifyVO> ar = attendanceService.getModifyList(employeeVO);
		
		return "attendance/list";
	}
	

	@GetMapping("/attendanceModify/add")
	public String setModifyAdd() throws Exception {
		
		return "attendance/form";
	}
	
	@PostMapping("/attendanceModify/add")
	public String setModifyAdd(AttendanceModifyVO attendanceModifyVO, EmployeeVO employeeVO) throws Exception {
		int result = attendanceService.setModifyAdd(attendanceModifyVO, employeeVO);
		
		return "attendance/list";
	}
	
}
