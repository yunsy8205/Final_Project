package com.cloud.pt.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface ChatDAO {
	
	public List<EmployeeVO> getChatList(String employeeNum)throws Exception;
	
	public RoomVO roomCheck(RoomVO roomVO)throws Exception;

}
