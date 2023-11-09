package com.cloud.pt.membership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberShipService {
	@Autowired
	private MemberShipDAO membershipDAO;
	
	//이용권 등록
	public int setAdd(MemberShipVO membershipVO) throws Exception {
		return membershipDAO.setAdd(membershipVO);
	}
	
	//이용권 목록
	public List<MemberShipVO> getList() throws Exception {
		return membershipDAO.getList();
	}
}
