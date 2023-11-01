package com.cloud.pt.approval;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface ApprovalDAO {
	
	public Long getMyCount(Map<String,Object> map)throws Exception;
	
	public Long getAllCount(Map<String,Object> map) throws Exception;
	
	public Long getTemporaryCount(Map<String,Object> map) throws Exception;
	
	public List<ApprovalVO> getApprovalList(Map<String, Object> map) throws Exception;
	
	public List<EmployeeVO> getAnnualLine() throws Exception;
	
	public int setAdd(ApprovalVO approvalVO)throws Exception;
	
	public List<ApprovalVO> getApproverList(Map<String,Object> map) throws Exception;
	
	public ApprovalVO getMyDetail(ApprovalVO approvalVO) throws Exception;
	
	public EmployeeVO getMiddleEmployee(ApprovalVO approvalVO) throws Exception;
	
	public EmployeeVO getLastEmployee(ApprovalVO approvalVO) throws Exception;
	
	public int setTempAdd(ApprovalVO approvalVO)throws Exception;
	
	public List<ApprovalVO> getTemporaryList(Map<String, Object> map) throws Exception;
	
	public int setTempUpdate(ApprovalVO approvalVO)throws Exception;
	
	public int setDelete(ApprovalVO approvalVO)throws Exception;
	
	public int setSignUpload(EmployeeVO employeeVO)throws Exception;
	
	
}
