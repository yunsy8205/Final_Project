package com.cloud.pt.myPtMember;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.employee.EmployeeVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession httpSession;
	
	public void getPtList(MemberVO memberVO) throws Exception{
		/*
		 * EmployeeVO employee = (EmployeeVO) httpSession.getAttribute("employee");
		 * 
		 * memberVO.setEmployeeNum(employee.getEmployeeNum()); return
		 * memberDAO.getPtList(memberVO);
		 */
	}
	
}
