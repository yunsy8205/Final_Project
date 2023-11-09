package com.cloud.pt.membership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/membership/*")
public class MembershipController {
	@Autowired
	private MembershipService membershipService;
	
	//등록 폼으로 이동
	@GetMapping("add")
	public void setAdd() throws Exception {
	}
	//이용권 등록
	@PostMapping("add")
	public String setAdd(MembershipVO membershipVO) throws Exception {
		int result = membershipService.setAdd(membershipVO);
		
		return "redirect:./list";
	}
	
	//이용권 목록
	@GetMapping("list")
	public String getList(Model model) throws Exception {
		List<MembershipVO> ar = membershipService.getList();
		model.addAttribute("list", ar);
		
		return "membership/list";
	}
}
