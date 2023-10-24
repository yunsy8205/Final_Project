package com.cloud.pt.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.common.Pager;

@Mapper
public interface ApprovalDAO {
	
	public Long getCount(Pager pager) throws Exception;
	
	public List<ApprovalVO> getApprovalList(Pager pager) throws Exception;
	
	
}
