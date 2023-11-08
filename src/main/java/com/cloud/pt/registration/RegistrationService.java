package com.cloud.pt.registration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegistrationService {
	@Autowired
	private RegistrationDAO registrationDAO;
	
	@Transactional(rollbackFor = Exception.class)
	public int setAdd(RegistrationVO registrationVO) throws Exception {
		int result = registrationDAO.setAdd(registrationVO);
		
		if(result>0) {
			result = registrationDAO.setUpdate(registrationVO);
		}
		
		return result;
	}
}
