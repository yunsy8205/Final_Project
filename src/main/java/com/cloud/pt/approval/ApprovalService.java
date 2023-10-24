package com.cloud.pt.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.common.Pager;

@Service
public class ApprovalService {

	@Autowired
	private ApprovalDAO approvalDAO;
	
	public List<ApprovalVO> getApprovalList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total = approvalDAO.getCount(pager);
		pager.makePageNum(total);
		return approvalDAO.getApprovalList(pager);
	}
	
	
	
	
}
