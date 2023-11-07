package com.cloud.pt.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.pt.approval.ApprovalController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/leave/*")
public class LeaveController {

	
	
	@GetMapping("list")
	public void getLeaveList()throws Exception{
		
	}
}
