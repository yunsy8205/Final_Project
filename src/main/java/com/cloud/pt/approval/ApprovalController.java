package com.cloud.pt.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.pt.common.Pager;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	@GetMapping("list")
	public void getApprovalList(Model model,Pager pager) throws Exception{
		List<ApprovalVO> al = approvalService.getApprovalList(pager);
		model.addAttribute("list", al);
		model.addAttribute("pager", pager);
	}
	

	

}
