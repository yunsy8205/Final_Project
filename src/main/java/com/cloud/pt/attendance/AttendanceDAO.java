package com.cloud.pt.attendance;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface AttendanceDAO {
	public EmployeeVO getInfo(EmployeeVO employeeVO) throws Exception;
}
