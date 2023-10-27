package com.cloud.pt.attendance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface AttendanceDAO {
	
	public EmployeeVO getInfo(AttendanceVO attendanceVO) throws Exception;
	
	//----------------------------------------
	public Long getNum(Map<String, Object> map) throws Exception;
	
	public List<AttendanceVO> getModifyList(EmployeeVO employeeVO) throws Exception;
	public int setModifyAdd(AttendanceModifyVO attendanceModifyVO) throws Exception;
}
