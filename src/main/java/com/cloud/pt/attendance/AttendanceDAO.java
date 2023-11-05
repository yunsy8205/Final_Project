package com.cloud.pt.attendance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface AttendanceDAO {
	
	public List<Map<String, Object>> getList(EmployeeVO employeeVO) throws Exception;
	public List<Map<String, Object>> getAdminList() throws Exception;
	public List<Map<String, Object>> getResources() throws Exception;

	//	public List<AttendanceVO> getList(EmployeeVO employeeVO) throws Exception;
	public AttendanceVO getInfo(EmployeeVO employeeVO) throws Exception;
	
	public int setOn(EmployeeVO employeeVO) throws Exception;
	public int setOff(EmployeeVO employeeVO) throws Exception;
	public int setState(Map<String, Object> map) throws Exception;
	
	public Long getDayTotal(Map<String, Object> map) throws Exception; 
	public List<AttendanceVO> getDayList(Map<String, Object> map) throws Exception; 
	//----------------------------------------
	public Long getRequestTotal(Pager pager) throws Exception;
	
	public int setUpdateA(Map<String, Object> map) throws Exception;
	public int setUpdateAM(AttendanceModifyVO attendanceModifyVO) throws Exception;
	public AttendanceVO getRequestDetail(AttendanceModifyVO attendanceModifyVO) throws Exception;
	public List<AttendanceVO> getRequestList(Pager pager) throws Exception;
	
	//----------------------------------------
	public Long getNum(Map<String, Object> map) throws Exception;
	
	public Long getModifyTotal(EmployeeVO employeeVO) throws Exception;
	
	public AttendanceModifyVO getModifyDetail(AttendanceModifyVO attendanceModifyVO) throws Exception;
	public List<AttendanceVO> getModifyList(Map<String, Object> map) throws Exception;
	public int setModifyAdd(AttendanceModifyVO attendanceModifyVO) throws Exception;
}
