package com.cloud.pt.attendance.modify;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.attendance.AttendanceDAO;
import com.cloud.pt.employee.EmployeeVO;

@Service
public class AttendanceModifyService {
	@Autowired
	private AttendanceModifyDAO attendanceModifyDAO;
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	public List<AttendanceModifyVO> getList(EmployeeVO employeeVO) throws Exception {
		return attendanceModifyDAO.getList(employeeVO);
	}
	
	public int setAdd(AttendanceModifyVO attendanceModifyVO) throws Exception {
		attendanceModifyVO.setAttendanceNum(attendanceDAO.getNum(attendanceModifyVO));
		
		return 1;
	}
}
