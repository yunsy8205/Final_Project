package com.cloud.pt.ptLog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/trainer/*")
@Slf4j
public class PtLogController {
	
	@Autowired
	private PtLogService ptLogService;

	@GetMapping("ptLog")
	public String getClaendar() throws Exception{
		
		return "/trainer/ptLog";
	}
}
