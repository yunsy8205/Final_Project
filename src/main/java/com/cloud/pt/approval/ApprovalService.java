package com.cloud.pt.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApprovalService {

	@Autowired
	private ApprovalDAO approvalDAO;
	
	public List<ApprovalVO> getWatingList() throws Exception{
		return approvalDAO.getWatingList();
		
	}
	
	
}
