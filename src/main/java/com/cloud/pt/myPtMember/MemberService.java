package com.cloud.pt.myPtMember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession httpSession;
	
	/*
	 * public List<MemVO> getPtList(MemVO memberVO) throws Exception{ Long
	 * employee = (Long) httpSession.getAttribute("employee");
	 * 
	 * memberVO.setEmployeeNum(employee.getEmployeeNum()); return
	 * memberDAO.getPtList(memberVO); }
	 */
	
	public Long getTotal() throws Exception{
		return memberDAO.getTotal();
	}
	
	public List<MemberVO> getPtList(EmployeeVO employeeVO , Pager pager) throws Exception{
		
		pager.setStartRow(0L);
		pager.setLastRow(10L);
		
		SecurityContext context = SecurityContextHolder.getContext();
	    org.springframework.security.core.Authentication b = context.getAuthentication();
	    
	    String employeeNum = b.getName();
		
		Map<String,Object> map = new HashMap<>();
		map.put("employeeNum", employeeVO.getEmployeeNum());
		map.put("pager", pager);
		
		return memberDAO.getPtList(map,employeeNum);
	}
	
	
}
