package com.cloud.pt.ptLog;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PtLogService {
	
	@Autowired
	private PtLogDAO ptLogDAO;

	public ArrayList<PtLogVO> getTypeLog() throws Exception{
		return ptLogDAO.getTypeLog();
	}
}


