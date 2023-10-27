package com.cloud.pt.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.common.Pager;
import com.cloud.pt.employee.EmployeeVO;

@Service
public class ApprovalService {

	@Autowired
	private ApprovalDAO approvalDAO;
	
	public List<ApprovalVO> getApprovalList(Pager pager,ApprovalVO approvalVO) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		pager.makeRowNum();
		map.put("id", approvalVO);
		map.put("pager", pager);
		Long total = approvalDAO.getMyCount(map);
		pager.makePageNum(total);
		map.put("pager", pager);
		return approvalDAO.getApprovalList(map);
	}
	
	public List<EmployeeVO> getAnnualLine() throws Exception{
		
		return approvalDAO.getAnnualLine();
	}
	
	public int setAdd(ApprovalVO approvalVO)throws Exception{
		return approvalDAO.setAdd(approvalVO);
	}
	
	public List<ApprovalVO> getApproverList(Pager pager,ApprovalVO approvalVO) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		pager.makeRowNum();
		map.put("id", approvalVO);
		map.put("pager", pager);
		Long total = approvalDAO.getAllCount(map);
		pager.makePageNum(total);
		map.put("pager", pager);
		return approvalDAO.getApproverList(map);
	}
	
}
