package com.cloud.pt.locker;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class LockerService {

	@Autowired
	private LockerDAO lockerDAO;
	
	public List<LockerVO> getLockerList(LockerVO lockerVO) throws Exception{
		
		return lockerDAO.getLockerList(lockerVO);
	}
	
}
