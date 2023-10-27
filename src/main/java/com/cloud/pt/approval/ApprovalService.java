package com.cloud.pt.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.common.Pager;
import com.cloud.pt.employee.EmployeeVO;

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
	
	public List<EmployeeVO> getAnnualLine() throws Exception{
		
		return approvalDAO.getAnnualLine();
	}
	
	public int setAdd(ApprovalVO approvalVO)throws Exception{
		return approvalDAO.setAdd(approvalVO);
	}
	
	public List<ApprovalVO> getApproverList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total = approvalDAO.getCount(pager);
		pager.makePageNum(total);
		return approvalDAO.getApproverList(pager);
	}
	
}
