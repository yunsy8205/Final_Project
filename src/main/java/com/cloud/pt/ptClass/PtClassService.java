package com.cloud.pt.ptClass;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PtClassService {
	@Autowired
	private PtClassDAO ptClassDAO;
	
	public ArrayList<PtClassVO> ptClassList(HttpSession session) throws Exception{
		return ptClassDAO.getList();
	}
	
	
	public ArrayList<PtClassVO> getMyList(Long employeeNum) throws Exception{
		return ptClassDAO.getMyList(employeeNum);
	}
}
