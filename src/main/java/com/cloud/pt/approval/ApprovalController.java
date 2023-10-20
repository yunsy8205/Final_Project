package com.cloud.pt.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@GetMapping("main")
	public void getMain(Model model) throws Exception{
		List<ApprovalVO> wl = approvalService.getWatingList();
		model.addAttribute("wating",wl);
	}
	
	@GetMapping("select")
	public void getSelect() throws Exception{
		
	}

}
