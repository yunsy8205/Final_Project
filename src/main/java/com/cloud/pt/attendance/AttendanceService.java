package com.cloud.pt.attendance;

import java.sql.Time;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	public AttendanceVO getInfo(EmployeeVO employeeVO) throws Exception {
		return attendanceDAO.getInfo(employeeVO);
	}
	
	public int setOn(EmployeeVO employeeVO) throws Exception {
		return attendanceDAO.setOn(employeeVO);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int setOff(EmployeeVO employeeVO) throws Exception {
		int result = attendanceDAO.setOff(employeeVO);
		
		if(result>0) {
			setState(employeeVO);
		}
		return result;
	}
	
	public int setState(EmployeeVO employeeVO) throws Exception {
		AttendanceVO attendanceVO = attendanceDAO.getInfo(employeeVO);
		String on = "09:01:00";
		String off = "18:00:00";
		Time standardOn = Time.valueOf(on);
		Time standardOff = Time.valueOf(off);
		
		Map<String, Object> map = new HashMap<>();
//		map.put("onTime", attendanceVO.getOnTime());
//		map.put("offTime", attendanceVO.getOffTime());
		map.put("vo", attendanceVO);
		map.put("on", standardOn);
		map.put("off", standardOff);
		
		return attendanceDAO.setState(map);
	}
	
	//---------------------------------------------------
	public AttendanceVO getRequestDetail(AttendanceModifyVO attendanceModifyVO) throws Exception {
		return attendanceDAO.getRequestDetail(attendanceModifyVO);
	}
	
	public List<AttendanceVO> getRequestList() throws Exception {
		return attendanceDAO.getRequestList();
	}
	
	//---------------------------------------------------
	public AttendanceModifyVO getModifyDetail(AttendanceModifyVO attendanceModifyVO) throws Exception {
		return attendanceDAO.getModifyDetail(attendanceModifyVO);
	}
	
	public List<AttendanceVO> getModifyList(EmployeeVO employeeVO) throws Exception {
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
