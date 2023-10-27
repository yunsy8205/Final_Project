package com.cloud.pt.ptClass;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PtClassDAO {
	
	public int setPtClass(PtClassVO ptClassVO) throws Exception;
	
}
