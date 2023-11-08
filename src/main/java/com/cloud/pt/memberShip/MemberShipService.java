package com.cloud.pt.membership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.commons.Pager;

@Service
public class MembershipService {
	@Autowired
	private MembershipDAO membershipDAO;
	
	//이용권 등록
	public int setAdd(MembershipVO membershipVO) throws Exception {
		return membershipDAO.setAdd(membershipVO);
	}
	
	//이용권 삭제
	public int setDelete(List<String> list) throws Exception {
		return membershipDAO.setDelete(list);
	
	}
	
	//이용권 목록(페이저O)
	public List<MembershipVO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = membershipDAO.getTotal();
		pager.makePageNum(total);
		
		return membershipDAO.getListForPager(pager);
	}
	//이용권 목록(페이저X)
	public List<MembershipVO> getList() throws Exception{
		return membershipDAO.getList();
	}
}
