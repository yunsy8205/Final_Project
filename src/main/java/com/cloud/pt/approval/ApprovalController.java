package com.cloud.pt.approval;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	public void getAdd() throws Exception{
		
	}
	@PostMapping("add")
	public String setAdd(ApprovalVO approvalVO) throws Exception{
		int result=approvalService.setAdd(approvalVO);
		return "redirect:./list";
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
	public void getTemporaryList(Pager pager,ApprovalVO approvalVO,Principal principal,Model model) throws Exception{
		approvalVO.setEmployeeNum(principal.getName());
		List<ApprovalVO> al = approvalService.getTemporaryList(pager,approvalVO);
		model.addAttribute("list", al);
		model.addAttribute("pager",pager);
		
	}
	
	@GetMapping("detail")
	public void getMyDetail(ApprovalVO approvalVO,Model model)throws Exception{
		
		approvalVO=approvalService.getMyDetail(approvalVO);
		EmployeeVO empVO = new EmployeeVO();
		empVO=approvalService.getMiddleEmployee(approvalVO);
		model.addAttribute("middle", empVO);
		empVO=approvalService.getLastEmployee(approvalVO);
		model.addAttribute("last", empVO);
		model.addAttribute("approvalVO", approvalVO);
	}
	
	@GetMapping("approverDetail")
	public void getApproverDetail(ApprovalVO approvalVO,Model model)throws Exception{
		
		approvalVO=approvalService.getMyDetail(approvalVO);
		EmployeeVO empVO = new EmployeeVO();
		empVO=approvalService.getMiddleEmployee(approvalVO);
		model.addAttribute("middle", empVO);
		empVO=approvalService.getLastEmployee(approvalVO);
		model.addAttribute("last", empVO);
		model.addAttribute("approvalVO", approvalVO);
	}
	
	@PostMapping("tempAdd")
	public String setTempAdd(ApprovalVO approvalVO,Model model)throws Exception{
		int result=approvalService.setTempAdd(approvalVO);
		
		model.addAttribute("message", "임시저장 되었습니다.");
		model.addAttribute("url", "./temporaryList");
		return "ajax/ajaxResult";
		
	}
	@GetMapping("tempDetail")
	public void getTempDetail(ApprovalVO approvalVO,Model model)throws Exception{
		approvalVO=approvalService.getMyDetail(approvalVO);
		EmployeeVO empVO = new EmployeeVO();
		empVO=approvalService.getMiddleEmployee(approvalVO);
		model.addAttribute("middle", empVO);
		empVO=approvalService.getLastEmployee(approvalVO);
		model.addAttribute("last", empVO);
		model.addAttribute("approvalVO", approvalVO);
	}
	@PostMapping("tempUpdate")
	public String setTempUpdate(ApprovalVO approvalVO) throws Exception {
		approvalService.setAdd(approvalVO);
		approvalService.setDelete(approvalVO);
		
		return "redirect:./list";
	}
	
	@GetMapping("signMain")
	public void getSignMain() throws Exception{
		
	}
	@GetMapping("sign")
	public void setSign() throws Exception{
		
	}
	@GetMapping("mySign")
	public void setMySign() throws Exception{
		
	}

}
