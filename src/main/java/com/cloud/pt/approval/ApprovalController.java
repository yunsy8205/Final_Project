package com.cloud.pt.approval;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cloud.pt.common.Pager;
import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	@GetMapping("list")
	public void getApprovalList(Model model,Pager pager,ApprovalVO approvalVO,Principal principal) throws Exception{
		approvalVO.setEmployeeNum(principal.getName());
		List<ApprovalVO> al = approvalService.getApprovalList(pager,approvalVO);
		model.addAttribute("list", al);
		model.addAttribute("pager", pager);
	}
	
	@GetMapping("add")
	public void getAdd(String middle,String last) throws Exception{
		
	}
	@PostMapping("add")
	public void setAdd(ApprovalVO approvalVO) throws Exception{
		log.info("============="+approvalVO.getMiddle());
		int result=approvalService.setAdd(approvalVO);
	}
	
	@GetMapping("line")
	public void getAnnualLine(Model model) throws Exception{
		List<EmployeeVO> el = approvalService.getAnnualLine();
		model.addAttribute("employeeVO", el);
	}
	
	@GetMapping("approverList")
	public void getApproverList(Model model,Pager pager,ApprovalVO approvalVO,Principal principal) throws Exception{
		approvalVO.setEmployeeNum(principal.getName());
		
		List<ApprovalVO> al = approvalService.getApproverList(pager,approvalVO);
		model.addAttribute("list", al);
		model.addAttribute("pager", pager);
		
	}
	
	@GetMapping("temporaryList")
	public void getTemporaryList(Pager pager,ApprovalVO approvalVO,Principal principal) throws Exception{
		approvalVO.setEmployeeNum(principal.getName());
		
		
	}

	

}
