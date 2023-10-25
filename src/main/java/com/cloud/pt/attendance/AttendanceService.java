package com.cloud.pt.attendance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.employee.EmployeeVO;

@Service
public class AttendanceService {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	public EmployeeVO getInfo(EmployeeVO employeeVO) throws Exception {
		return attendanceDAO.getInfo(employeeVO);
	}
}
