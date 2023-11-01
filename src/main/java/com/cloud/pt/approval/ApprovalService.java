package com.cloud.pt.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cloud.pt.commons.Pager;
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
	@Transactional
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
	
	public ApprovalVO getMyDetail(ApprovalVO approvalVO)throws Exception{
		return approvalDAO.getMyDetail(approvalVO);
	}
	
	public EmployeeVO getMiddleEmployee(ApprovalVO approvalVO)throws Exception{
		return approvalDAO.getMiddleEmployee(approvalVO);
	}
	
	public EmployeeVO getLastEmployee(ApprovalVO approvalVO)throws Exception{
		return approvalDAO.getLastEmployee(approvalVO);
	}
	
	public List<ApprovalVO> getTemporaryList(Pager pager,ApprovalVO approvalVO)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", approvalVO);
		map.put("pager", pager);
		Long total = approvalDAO.getTemporaryCount(map);
		pager.makePageNum(total);
		map.put("pager", pager);
		return approvalDAO.getTemporaryList(map);
	}
	
	public int setTempAdd(ApprovalVO approvalVO)throws Exception{
		return approvalDAO.setTempAdd(approvalVO);
	}
	
	public int setTempUpdate(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setTempUpdate(approvalVO);
	}
	@Transactional
	public int setDelete(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setDelete(approvalVO);
	}
	
}
