package com.cloud.pt.myPtMember;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
@Mapper
public interface MemberDAO {
	
	

	public List<MemberVO> getPtList(MemberVO memberVO) throws Exception;

	

	
}
