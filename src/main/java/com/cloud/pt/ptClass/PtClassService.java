package com.cloud.pt.ptClass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PtClassService {
	@Autowired
	private PtClassDAO ptClassDAO;
	
	public int setPtClass(PtClassVO ptClassVO) throws Exception{
		ptClassDAO.setPtClass(ptClassVO);
		return 0;
	}
	
}
