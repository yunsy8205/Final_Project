package com.cloud.pt.employee;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;

@Mapper
public interface EmployeeDAO {

	public EmployeeVO getEmpLogin(EmployeeVO employeeVO)throws Exception;
	
	public int setJoin(EmployeeVO employeeVO)throws Exception;
	
	public List<EmployeeVO> getEmpList(Pager pager)throws Exception;
}
