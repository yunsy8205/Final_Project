package com.cloud.pt.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.common.Pager;
import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface ApprovalDAO {
	
	public Long getCount(Pager pager)throws Exception;
	
	public List<ApprovalVO> getApprovalList(Pager pager) throws Exception;
	
	public List<EmployeeVO> getAnnualLine() throws Exception;
	
	public int setAdd(ApprovalVO approvalVO)throws Exception;
	
	public List<ApprovalVO> getApproverList(Pager pager) throws Exception;
	
}
