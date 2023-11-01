package com.cloud.pt.ptClass;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PtClassDAO {
	
	public ArrayList<PtClassVO> getList() throws Exception;
	
	public ArrayList<PtClassVO> getMyList(Long employeeNum) throws Exception;
	
}
