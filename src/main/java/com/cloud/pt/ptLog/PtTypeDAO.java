package com.cloud.pt.ptLog;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PtTypeDAO {

	public List<PtTypeVO> getTypeList() throws Exception;

	
}
