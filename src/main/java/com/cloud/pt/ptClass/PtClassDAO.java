package com.cloud.pt.ptClass;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public class PtClassDAO {
	
	public ArrayList<PtClassVO> ptClassList() throws Exception;
	
}
