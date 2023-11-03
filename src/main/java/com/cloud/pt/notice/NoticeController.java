package com.cloud.pt.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("add")
	public String setNoticeAdd()throws Exception{
		return "notice/add";
	}
	
	@PostMapping("add")
	public String setNoticeAdd(NoticeVO noticeVO, MultipartFile [] files)throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		noticeVO.setEmployeeNum(Long.valueOf(b.getName()));
		
		noticeService.setNoticeAdd(noticeVO, files);
		
		return "redirect:./list";
	}
	
	@GetMapping("list")
	public String getNoticeList(Model model)throws Exception{
		List<NoticeVO> list =noticeService.getNoticeList();
		model.addAttribute("list", list);
		
		return "notice/list";
	}
	
	@GetMapping("detail")
	public String getNoticeDetail(Model model, NoticeVO noticeVO)throws Exception{
		noticeVO = noticeService.getNoticeDetail(noticeVO);
		model.addAttribute("notice", noticeVO);
		
		return "notice/detail";
	}

}
