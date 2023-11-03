package com.cloud.pt.ptLog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PtTypeService {
	
	@Autowired
	private PtTypeDAO ptTypeDAO;
	
	public List<PtTypeVO> getTypeList() throws Exception{
		return ptTypeDAO.getTypeList();
	}
}
