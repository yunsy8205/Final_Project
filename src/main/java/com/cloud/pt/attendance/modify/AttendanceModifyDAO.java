package com.cloud.pt.attendance.modify;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface AttendanceModifyDAO {
	public List<AttendanceModifyVO> getList(EmployeeVO employeeVO) throws Exception;
	public int setAdd(AttendanceModifyVO attendanceModifyVO) throws Exception;
}
