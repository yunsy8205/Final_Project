package com.cloud.pt.membership;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MembershipDAO {
	public int setAdd(MembershipVO membershipVO) throws Exception;
	public List<MembershipVO> getList() throws Exception;
}
