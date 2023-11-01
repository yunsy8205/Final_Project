package com.cloud.pt.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/notice/*")
@Log4j2
public class NoticeController {
	
	@GetMapping("add")
	public String setNoticeAdd()throws Exception{
		return "notice/add";
	}

}
