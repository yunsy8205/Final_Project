package com.cloud.pt.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalDAO {
	
	public List<ApprovalVO> getWatingList () throws Exception;
}
