package com.cloud.pt.ptType;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PtTypeDAO {

	public List<PtTypeVO> getTypeList(Map<String, Object> map,String employeeNum) throws Exception;

	public int addType(PtTypeVO ptTypeVO) throws Exception;
	
	public int delType(PtTypeVO ptTypeVO) throws Exception;
}
