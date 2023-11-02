package com.cloud.pt.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/notice/*")
@Log4j2
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("add")
	public String setNoticeAdd()throws Exception{
		return "notice/add";
	}
	
	@PostMapping("add")
	public String setNoticeAdd(NoticeVO noticeVO)throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		
		noticeVO.setEmployeeNum(Long.valueOf(b.getName()));
		
		noticeService.setNoticeAdd(noticeVO);
		
		return "redirect:./list";
	}
	
	@GetMapping("list")
	public String getNoticeList()throws Exception{
		return "notice/list";
	}

}
