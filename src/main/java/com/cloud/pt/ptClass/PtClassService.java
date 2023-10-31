package com.cloud.pt.ptClass;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PtClassService {
	@Autowired
	private PtClassDAO ptClassDAO;
	
	public ArrayList<PtClassVO> ptClassList() throws Exception{
		return ptClassDAO.ptClassList();
	}
	
}
