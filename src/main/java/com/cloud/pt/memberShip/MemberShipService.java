package com.cloud.pt.membership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MembershipService {
	@Autowired
	private MembershipDAO membershipDAO;
	
	//이용권 등록
	public int setAdd(MembershipVO membershipVO) throws Exception {
		return membershipDAO.setAdd(membershipVO);
	}
	
	//이용권 목록
	public List<MembershipVO> getList() throws Exception {
		return membershipDAO.getList();
	}
}
