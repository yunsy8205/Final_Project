package com.cloud.pt.myPtMember;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	public List<MemberVO> getPtList() throws Exception;
}
