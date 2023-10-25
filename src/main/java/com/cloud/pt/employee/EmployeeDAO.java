package com.cloud.pt.employee;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {

	public EmployeeVO getEmpLogin(EmployeeVO employeeVO)throws Exception;
}
