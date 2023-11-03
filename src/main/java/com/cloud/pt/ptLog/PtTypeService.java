package com.cloud.pt.ptLog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PtTypeService {
	
	@Autowired
	private PtTypeDAO ptTypeDAO;
	
	public List<PtTypeVO> getTypeList(PtTypeVO ptTypeVO) throws Exception{
		
		SecurityContext context = SecurityContextHolder.getContext();
	    org.springframework.security.core.Authentication b = context.getAuthentication();
	    
	    String employeeNum = b.getName();
	    
	    Map<String,Object> map = new HashMap<>();
	    map.put("employeeNum",ptTypeVO.getEmployeeNum());
	    
		return ptTypeDAO.getTypeList(map,employeeNum);
	}
	
	public int addType() throws Exception{
		return ptTypeDAO.addType();
	}
}
