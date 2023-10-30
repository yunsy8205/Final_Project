package com.cloud.pt.attendance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface AttendanceDAO {
	
	public AttendanceVO getInfo(EmployeeVO employeeVO) throws Exception;
	
	public int setOn(EmployeeVO employeeVO) throws Exception;
	public int setOff(EmployeeVO employeeVO) throws Exception;
	public int setState(Map<String, Object> map) throws Exception;
	
	//----------------------------------------
	public AttendanceVO getRequestDetail(AttendanceModifyVO attendanceModifyVO) throws Exception;
	public List<AttendanceVO> getRequestList() throws Exception;
	
	//----------------------------------------
	public Long getNum(Map<String, Object> map) throws Exception;
	
	public AttendanceModifyVO getModifyDetail(AttendanceModifyVO attendanceModifyVO) throws Exception;
	public List<AttendanceVO> getModifyList(EmployeeVO employeeVO) throws Exception;
	public int setModifyAdd(AttendanceModifyVO attendanceModifyVO) throws Exception;
}
