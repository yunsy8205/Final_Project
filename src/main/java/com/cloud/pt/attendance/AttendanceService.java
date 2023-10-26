package com.cloud.pt.attendance;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	public EmployeeVO getInfo(AttendanceVO attendanceVO ) throws Exception {
		return attendanceDAO.getInfo(attendanceVO);
	}
	
	//---------------------------------------------------
	
	public List<AttendanceModifyVO> getModifyList(EmployeeVO employeeVO) throws Exception {
		return attendanceDAO.getModifyList(employeeVO);
	}
	
	public int setModifyAdd(AttendanceModifyVO attendanceModifyVO, EmployeeVO employeeVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("modify", attendanceModifyVO);
		map.put("emp", employeeVO);
		
		Long num = attendanceDAO.getNum(map);
		
		attendanceModifyVO.setAttendanceNum(num);
		log.info("vo: {}", attendanceModifyVO.getModifyDate());

		return attendanceDAO.setModifyAdd(attendanceModifyVO);
	}
}
