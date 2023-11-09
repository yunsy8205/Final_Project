package com.cloud.pt.membership;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberShipDAO {
	public int setAdd(MemberShipVO membershipVO) throws Exception;
	public List<MemberShipVO> getList() throws Exception;
}
