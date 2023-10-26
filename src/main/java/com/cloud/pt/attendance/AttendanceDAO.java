package com.cloud.pt.attendance;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.attendance.modify.AttendanceModifyVO;
import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface AttendanceDAO {
	public Long getNum(AttendanceModifyVO attendanceModifyVO) throws Exception;
	public EmployeeVO getInfo(AttendanceVO attendanceVO) throws Exception;
}
